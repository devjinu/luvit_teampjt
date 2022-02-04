package com.luvit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luvit.domain.PhotoVO;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;


@Controller 
public class PhotoController {
	
	//단일파일업로드
    @RequestMapping("/common/photoUpload.do")
    public String photoUpload(HttpServletRequest request, PhotoVO vo){
        String callback = vo.getCallback();
        String callback_func = vo.getCallback_func();
        String file_result = "";
        try {
            if(vo.getR_file() != null && vo.getR_file().getOriginalFilename() != null && !vo.getR_file().getOriginalFilename().equals("")){
                //파일이 존재하면
                String original_name = vo.getR_file().getOriginalFilename();
                String ext = original_name.substring(original_name.lastIndexOf(".")+1);
                //파일 기본경로
                String defaultPath = request.getSession().getServletContext().getRealPath("/");
                //파일 기본경로 _ 상세경로
                String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;              
                File file = new File(path);
                System.out.println("path:"+path);
                //디렉토리 존재하지 않을경우 디렉토리 생성
                if(!file.exists()) {
                    file.mkdirs();
                }
                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                String realname = UUID.randomUUID().toString() + "." + ext;
            ///////////////// 서버에 파일쓰기 ///////////////// 
                vo.getR_file().transferTo(new File(path+realname));
                file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/photo_upload/"+realname;
            } else {
                file_result += "&errstr=error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + callback + "?callback_func="+callback_func+file_result;
    }

  //다중파일업로드
    @RequestMapping("/common/multiplePhotoUpload.do")
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response, Model model){
    	String filename_ext = "";
    	try {
             //파일정보
             String sFileInfo = "";
             //파일명을 받는다 - 일반 원본파일명
             String filename = request.getHeader("file-name");
             //파일 확장자
             filename_ext = filename.substring(filename.lastIndexOf(".")+1);
             //확장자를소문자로 변경
             filename_ext = filename_ext.toLowerCase();
             //파일 기본경로
             String dftFilePath = request.getSession().getServletContext().getRealPath("/");
             System.out.println("@@@@@@@@@@@@파일 기본 경로:"+dftFilePath);
             //파일 기본경로 _ 상세경로
             String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
             System.out.println("@@@@@@@@@@@@파일 상세 경로:"+filePath);
             File file = new File(filePath);
             if(!file.exists()) {
                file.mkdirs();
             }
             String realFileNm = "";
             SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
             String today= formatter.format(new java.util.Date());
             realFileNm = "Img"+today+UUID.randomUUID().toString()+"End" + filename.substring(filename.lastIndexOf("."));
             // realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
             String rlFileNm = filePath + realFileNm;
             System.out.println("@@@@@@@@@@@@진짜 파일 이름:"+rlFileNm);
             request.setAttribute("imageurl", rlFileNm);

             
             ///////////////// 서버에 파일쓰기 ///////////////// 
             InputStream is = request.getInputStream();
             OutputStream os=new FileOutputStream(rlFileNm);
             int numRead;
             byte[] b = new byte[Integer.parseInt(request.getHeader("file-size"))];
             while((numRead = is.read(b,0,b.length)) != -1){
                os.write(b,0,numRead);
             }
             if(is != null) {
                is.close();
             }
             os.flush();
             os.close();
             ///////////////// 서버에 파일쓰기 /////////////////
             // 정보 출력
             sFileInfo += "&bNewLine=true";
             // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
             sFileInfo += "&sFileName="+ filename;
            sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
             PrintWriter print = response.getWriter();
             print.print(sFileInfo);
             print.flush();
             print.close();
             
			///////////////////////////
			// 썸네일 처리 https://github.com/coobird/thumbnailator 
            // 가운데를 기준으로 350*350 크롭하게 처리해둠 
			Thumbnails.of(new File(rlFileNm)).allowOverwrite(true).crop(Positions.CENTER).size(350, 350).outputFormat(filename_ext).toFiles(Rename.PREFIX_DOT_THUMBNAIL);                
			
            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@가져갈 파일명:"+realFileNm);
            System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@가져갈 썸네일명:thumbnail."+realFileNm);


             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
  
    	
    }
 