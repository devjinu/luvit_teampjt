package com.luvit.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.luvit.domain.Tip_Page;
import com.luvit.domain.RecipeVO;
import com.luvit.domain.TipVO;
import com.luvit.domain.Tip_commentVO;
import com.luvit.domain.UserVO;
import com.luvit.service.TipService;
import com.luvit.service.Tip_commentService;
import com.luvit.service.UserService;
import com.luvit.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/tip/*") // 모든주소 맵핑
public class TipController {

	// 서비스 처리 객체를 주입(DI)
	@Inject
	private TipService service;
	@Inject UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(TipController.class);

	// 글쓰기
	// http://localhost:8088/tip/insertTip
	@RequestMapping(value = "/insertTip", method = RequestMethod.GET)
	public String insertGET(TipVO vo, HttpSession session,
						  RedirectAttributes rttr, Model model) throws Exception {

		logger.info("C: 회원가입 페이지(정보입력)");
		logger.info("C : /tip/insert -> /tip/insertTip.jsp 페이지 이동");
		logger.info("C : 호출");
		
		String id = (String)session.getAttribute("id");
		logger.info("@@@@@@@@@@@@세션에서 넘어온 아이디:"+id);
		
		UserVO user = null;
		user = userService.readMember(id);
		model.addAttribute("user", user);
		
		return "/tip/insertTip";
		
	}

	@RequestMapping(value = "/insertTip", method = RequestMethod.POST)
	public String insertPOST(TipVO vo,RedirectAttributes rttr) throws Exception {


		System.out.println("/tip/insertTip POST방식 입니다.");
		System.out.println(vo.toString());
		
		String pathImg=vo.getT_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			logger.info("!!!!!!!!!!!pathImg"+pathImg);
			String[] result = pathImg.split("upload/");
				logger.info("result"+result);
			String resultTwo = result[1];
				logger.info("resultTwo"+resultTwo);
			String[] resultTwoPath = resultTwo.split("\" title");
				logger.info("resultTwoPath"+resultTwoPath);
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setT_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setT_thumbnail(thumbName);
			logger.info("작성글내용 파싱1:"+resultTwoPath[0]);
			logger.info("작성글내용:"+vo);
		}else { // 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용	
			String defaultImg = "defaultImg.jpg";
			vo.setT_file(defaultImg);
			vo.setT_thumbnail(defaultImg);
		}
		service.insertTip(vo);
		
		rttr.addFlashAttribute("msg","성공");

		return "redirect:/tip/listPageSearch?num=1";
	}

	// 글 목록
	@RequestMapping(value = "/listTip", method = RequestMethod.GET)
	public void getList(TipVO vo, Model model) throws Exception {
		
		List list = null;
		list = service.listAll();
		model.addAttribute("list", list);
	}

	// 게시물 조회
	@RequestMapping(value = "/viewTip", method = RequestMethod.GET)
	public void getView(@RequestParam("t_bno") int t_bno, Model model) throws Exception {
		

		TipVO vo = service.readTip(t_bno);
		
		model.addAttribute("readTip", vo);


	}

	// 레시피 수정
	@RequestMapping(value="/tip/updateTip", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("t_bno") int t_bno, Model model)throws Exception {
		logger.info("컨트롤러: 레시피 수정 요청을 받았습니다.");
		TipVO vo = service.readTip(t_bno);
		model.addAttribute("tips", vo);
		return "/tip/updateTip";
	}
	
	// 레시피 수정 - PRO
	@RequestMapping(value="/tip/updateTip", method=RequestMethod.POST)
	public String modifyPOST(TipVO vo)throws Exception{
		
		String pathImg=vo.getT_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setT_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setT_thumbnail(thumbName);
			
			logger.info("수정글내용 파싱1:"+resultTwoPath[0]);
			logger.info("수정글내용:"+vo);
		}else {// 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setT_file(defaultImg);
			vo.setT_thumbnail(defaultImg);
		}
		service.updateTip(vo);
		logger.info("레시피 수정동작@@@@@@@@@@@@@@@@"+vo);
		return "redirect:/tip/viewTip?t_bno="+vo.getT_bno();
	}

	// 게시물 삭제
	@RequestMapping(value = "/tip/deleteTip", method = RequestMethod.GET)
	public String deleteTipGET(@RequestParam("t_bno") int t_bno) throws Exception {
		logger.info("post tip delete");

		logger.info("t_bno" + t_bno);
		service.deleteTip(t_bno);

		return "redirect:/tip/listPageSearch?num=1";
	}

//	// 글 목록 + 페이징추가
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
//
//		Tip_Page page = new Tip_Page();
//
//		page.setNum(num);
//		page.setCount(service.count());
//
//		List list = null;
//		list = service.listPage(page.getDisplayPost(), page.getPostNum());
//
//		model.addAttribute("list", list);
//		model.addAttribute("page", page);
//		model.addAttribute("select", num);
//	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch (Model model,
			@RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "t_subject") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Tip_Page page = new Tip_Page();
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<TipVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	
	
}