package com.luvit.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.luvit.domain.StoreVO;
import com.luvit.domain.Store_reviewVO;
import com.luvit.domain.Store_review_Page;
import com.luvit.service.Store_reviewService;

@Controller
@RequestMapping(value = "/store_review/*")
public class Store_reviewController {

	// 서비스 처리 객체를 주입(DI)
	@Inject
	private Store_reviewService service;

	/* @Resource(name = "uploadPath") */
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(Store_reviewController.class);

	// 후기 리스트(GET)
	@RequestMapping(value = "/store_review_list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List<Store_reviewVO> list = null;
		
		list = service.list_store_review();
		model.addAttribute("list", list);	 

	}
	
	// http://localhost:8088/store_review/listPage?num=1&no=1
	// 후기_리뷰 목록 + 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num,@RequestParam("no") int s_r_pno) throws Exception {
		Store_review_Page page = new Store_review_Page();

		page.setNum(num);
		
		page.setCount(service.count());
		List list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum(),s_r_pno);
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : list " + list);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : num " + num);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : model" + model);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : s_r_pno" + s_r_pno );
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : page" + page );
		
		StoreVO vo = service.productName(s_r_pno);
		
		// 정보 저장후 페이지 이동 
		model.addAttribute("review3", vo); 

		model.addAttribute("s_r_pno", s_r_pno);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
	}
	
	  // http://localhost:8088/store_review/listCate?num=1&s_r_cate=기타 // 후기_리뷰 목록 + 페이징 
	  @RequestMapping(value = "/listCate", method = RequestMethod.GET) 
	  public void getCatePage(Model model,
			  @RequestParam("num") int num ,@RequestParam("s_r_cate") String s_r_cate ) throws Exception {
	  Store_review_Page page = new Store_review_Page();
	  
	  page.setNum(num);
	  
		 model.addAttribute("s_r_cate", s_r_cate);
	  page.setCount(service.count()); 
	  List list2 = null;
	  list2 = service.catePage(page.getDisplayPost(), page.getPostNum(), s_r_cate);
	  logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : list2 " + list2);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : num " + num);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : model" + model);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ : page" + page );
	  
	  model.addAttribute("list2", list2); 
	  model.addAttribute("page", page); 
	  }
	  
	// http://localhost:8088/store_review/listAll2?num=1
	  
	// 후기_리뷰 목록 + 페이징 (전체후기)
	@RequestMapping(value = "/listAll2", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		Store_review_Page page = new Store_review_Page();

		page.setNum(num);
		
		page.setCount(service.count());
		List listall2 = null; 
		listall2 = service.listAll2(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("listall2", listall2);
		model.addAttribute("page", page);
	}
	 
	
	// http://localhost:8088/store_review/insert
	// 상품 후기 등록 - 소감(댓글) 작성

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET() throws Exception {
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(Store_reviewVO vo,@RequestParam("no") int s_r_pno,Model model) throws Exception {
		
		
		logger.info("C : 상품리뷰등록 처리 페이지(정보처리)");
		logger.info("C : /store_review/insertForm.jsp -> 처리");
		
		logger.info("C : " + vo);
		model.addAttribute("s_r_pno", s_r_pno);
		service.insertReview(vo);
		
		logger.info("C : 상품리뷰등록 완료!");

		return "redirect:/store_review/listPage?num=1";
	}

	// http://localhost:8088/store_review/finsert
	// 리뷰 처리 동작 (파일)
	@RequestMapping(value ="/finsert", method = RequestMethod.GET)
	public String finsertGET(@RequestParam("no") int s_r_pno,Model model,HttpSession session) throws Exception {
		
		String nickname =(String)session.getAttribute("nickname");
		
		model.addAttribute("s_r_pno", s_r_pno);
		
		logger.info("C: 후기 페이지(정보입력)");
		logger.info("C : /store_review/insert -> store_review/finsertForm.jsp 페이지 이동");
        
		return "/store_review/finsertForm";  // finsertForm.jsp
	}
	
	// http://localhost:8088/store_review/finsert
	@RequestMapping(value ="/finsert", method = RequestMethod.POST )
	public String finsertPOST(Store_reviewVO vo,@RequestParam("no") int s_r_pno,Model model,RedirectAttributes rttr,HttpSession session) throws Exception {
	
		String nickname =(String)session.getAttribute("nickname");
		
		logger.info("C: 후기쓰기 처리 페이지 ");
		logger.info("C: /store_review/finsertForm.jsp -> 처리");
	
		String pathImg=vo.getS_r_contents();
		
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
			vo.setS_r_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setS_r_thumbnail(thumbName);
		
		}else { // 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setS_r_file(defaultImg);
			vo.setS_r_thumbnail(defaultImg);
		}
		
		logger.info("작성글내용:"+vo);
		
		model.addAttribute("s_r_pno", s_r_pno);
		
		// 0. 한글처리 (web.xml) 
		// 1. 전달되는 정보 저장하기(파라미터값)
		logger.info("C : "+vo);
		
		// 2. 서비스 객체 생성(의존주입)
		// 3. 서비스 후기 쓰기 동작 호출
		service.insertReview(vo);
		logger.info("C : 후기올리기 완료!");
		
		rttr.addFlashAttribute("msg","성공");
		return "redirect:/store_review/listPage?num=1&no="+vo.getS_r_pno();
	}	

	// 상품 후기 수정(update)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(Model model,@RequestParam("s_r_bno") int s_r_bno,@RequestParam("no") int s_r_pno) throws Exception {
		logger.info("C : updateGET() 호출");
		logger.info("C : /update -> (GET)");
		model.addAttribute("s_r_pno", s_r_pno);
		// 뷰 페이지로 전달 
		Store_reviewVO vo = service.getStore_review(s_r_bno);
		
		// 정보 저장후 페이지 이동 
		model.addAttribute("review", vo); 
		
		return "/store_review/updateForm";
	}

	// 상품 후기 수정 처리(update)

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(Store_reviewVO vo,@RequestParam("no") int s_r_pno,Model model) throws Exception {
		logger.info("C : updatePOST() ");
		model.addAttribute("s_r_pno", s_r_pno);

		/* vo.setS_r_bno(1); */
		 
		// 1. 전달된 파라미터값 저장 logger.info("C : 수정할 리뷰 -> "+vo);
		// 2. 정보를 가지고 수정하기위해 이동(서비스 객체)
		// 3. 서비스 -> DAO 호출 -> Mapper 호출 
		
		String pathImg=vo.getS_r_contents();
		
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
		
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setS_r_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setS_r_thumbnail(thumbName);
			
		}else { // 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용	
			String defaultImg = "defaultImg.jpg";
			vo.setS_r_file(defaultImg);
			vo.setS_r_thumbnail(defaultImg);
		}
		logger.info("수정글내용:"+vo);
		
		service.updateReview(vo);
		logger.info("C : 리뷰 수정완료! "); 
		// 4. 후기 수정 완료 후 후기 등록 페이지 이동

		return "redirect:/store_review/listPage?num=1&no="+vo.getS_r_pno();
	}
	
	// 상품후기 글정보 리스트(GET) review
	@RequestMapping(value ="/review", method = RequestMethod.GET)
	public String reviewGET(Model model, int s_r_bno,HttpSession session) throws Exception {
		logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		logger.info("--- review ---");
		logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		
		Store_reviewVO review = service.getStore_review(s_r_bno);
		logger.info("C : " + review);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		model.addAttribute("review", review);
		
		String id =(String)session.getAttribute("id");
		
		
		Map<String, Object> m = new HashMap<>();
		m.put("s_r_bno", s_r_bno);
		m.put("id", id);
		
		if(id != null) {
			int result = service.srlCheck(m);
					
			if(result == 0){ // 추천하지 않았다면 추천 추가
				service.srlUpdate(m);
			}else{ // 추천을 하였다면 추천 삭제
				service.srlDelete(m);
			} /*
				 * int count = service.srlCount(s_r_bno);
				 * System.out.println("%%%%%%%%count222%%%%%%%%%%%%%%%%%%%%%"+count);
				 */
		}
		
		return "/store_review/review";
	}	
	
	// 상품후기 글정보 리스트Ajax(POST) review
	/*
	 * @RequestMapping(value ="/reviewAjax", method = RequestMethod.POST) public
	 * String reviewAjaxGET(Model model, int s_r_bno,HttpSession session) throws
	 * Exception { logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	 * logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	 * logger.info("--- reviewAjax ---");
	 * logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	 * logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
	 */
		
		
//
//		return "/store_review/review";
//	}	
	

	
	
	// 상품 후기 삭제 처리(delete)
	@GetMapping("/delete")
	public String delete(@RequestParam("s_r_bno") int s_r_bno,@RequestParam("no") int s_r_pno,Model model) {
		model.addAttribute("s_r_pno", s_r_pno);
		service.deleteReview(s_r_bno);
		
		return "redirect: /store_review/listAll2?num=1";
	}


	  
}