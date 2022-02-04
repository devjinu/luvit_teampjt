package com.luvit.controller;

import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.StoreVO;
import com.luvit.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/store/*")
public class StoreController {

	// 서비스 처리 객체를 주입(DI)
	@Inject
	private StoreService service;

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	// http://localhost:8088/store/storeWrite
	// 스토어 제품 등록
	@RequestMapping(value = "/storeWrite", method = RequestMethod.GET)
	public String writeGET(HttpSession session) throws Exception {
		logger.info("C : 상품등록 페이지");
		String id = (String)session.getAttribute("id");
		return "/store/storeWrite";

	}

	@RequestMapping(value = "/store/storeWrite", method = RequestMethod.POST)
	public String writePOST(StoreVO vo, RedirectAttributes rttr,HttpSession session) throws Exception {
		logger.info("C : 상품등록 페이지");
		String id = (String)session.getAttribute("id");
		String pathImg = vo.getS_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감.
			vo.setS_file(resultTwoPath[0]);
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail." + resultTwoPath[0];
			vo.setS_thumbnail(thumbName);
	
			logger.info("C : " + vo);
		}else {// 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setS_file(defaultImg);
			vo.setS_thumbnail(defaultImg);
		}
		service.insertProduct(vo);
		logger.info("C : 상품등록 완료!");

		rttr.addFlashAttribute("msg", "성공");
		return "redirect:/store/storeList?num=1";
	}

	/*
	 * // http://localhost:8088/store/storeList?num=1 // 스토어 목록 + 페이징
	 * 
	 * @RequestMapping(value="/storeList", method=RequestMethod.GET) public void
	 * listPage(@RequestParam("num") int num, Model model) throws Exception {
	 * logger.info("C : 스토어 메인 테스트");
	 * 
	 * // 게시물 총 갯수 int count = service.count();
	 * 
	 * // 한 페이지에 출력할 게시물 갯수 int postNum = 9;
	 * 
	 * // 하단 페이징 번호 ([게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림) int pageNum =
	 * (int)Math.ceil((double)count/postNum);
	 * 
	 * // 출력할 게시물 int displayPost = (num-1)*postNum;
	 * 
	 * // 한번에 표시할 페이징 번호의 갯수 int pageNum_cnt = 10;
	 * 
	 * // 표시되는 페이지 번호 중 마지막 번호 int endPageNum = (int)(Math.ceil((double)num /
	 * (double)pageNum_cnt)*pageNum_cnt);
	 * 
	 * // 표시되는 페이지 번호 중 첫번째 번호 int startPageNum = endPageNum - (pageNum_cnt-1);
	 * 
	 * // 마지막 번호 재계산 int endPageNum_tmp = (int)(Math.ceil((double)count /
	 * (double)pageNum_cnt));
	 * 
	 * if(endPageNum > endPageNum_tmp) { endPageNum = endPageNum_tmp; }
	 * 
	 * boolean prev = startPageNum == 1?false:true; boolean next = endPageNum *
	 * pageNum_cnt >= count?false:true;
	 * 
	 * 
	 * 
	 * List<StoreVO> list = null; list = service.storeList(displayPost, postNum);
	 * model.addAttribute("list",list); model.addAttribute("pageNum", pageNum);
	 * 
	 * 
	 * 
	 * // 시작 및 끝번호 model.addAttribute("startPageNum", startPageNum);
	 * model.addAttribute("endPageNum", endPageNum);
	 * 
	 * // 이전 및 다음 model.addAttribute("prev", prev); model.addAttribute("next",
	 * next);
	 * 
	 * // 현재 페이지 model.addAttribute("select", num); }
	 */

	// http://localhost:8088/store/storeList?num=1
	// 스토어 목록 + 페이징 + 검색
	@RequestMapping(value = "/storeList", method = RequestMethod.GET)
	public void listPage(@RequestParam("num") int num, Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "cate", required = false, defaultValue = "") String cate) throws Exception {
		logger.info("C : 스토어 메인 테스트");

		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 9;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		boolean prev = startPageNum != 1;
		boolean next = endPageNum * pageNum_cnt < count;

		List<StoreVO> list = null;
		list = service.listPage(displayPost, postNum, keyword, cate);

		logger.info("list : " + list);

		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);

		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		// 현재 페이지
		model.addAttribute("select", num);
	}

	// 상품 조회
	@RequestMapping(value = "/store/storeDetail", method = RequestMethod.GET)
	public void productGET(@RequestParam("no") int s_pno, Model model,HttpSession session) throws Exception {
		logger.info("C : 상품 조회 페이지");
		String id = (String)session.getAttribute("id");
		StoreVO vo = service.product(s_pno);

		logger.info("@@@@@@@@@@@@ " + s_pno + "번글 상세보기 @@@@@@@@@@@@@@");
		model.addAttribute("vo", vo);
	}

	// 상품 수정
	@RequestMapping(value = "/store/storeModify", method = RequestMethod.GET)
	public void productModify(@RequestParam("no") int s_pno, Model model) throws Exception {
		logger.info("C : 상품 수정 페이지");

		StoreVO vo = service.product(s_pno);
		logger.info("C : " + s_pno + "번 수정");
		model.addAttribute("vo", vo);

	}

	// 상품 수정
	@RequestMapping(value = "/store/storeModify", method = RequestMethod.POST)
	public String productModify(StoreVO vo) throws Exception {
		logger.info("C : 상품 수정 페이지");

		String pathImg=vo.getS_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setS_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setS_thumbnail(thumbName);
			
			logger.info("수정글내용 파싱1:"+resultTwoPath[0]);
			logger.info("수정글내용:"+vo);
		
			logger.info("레시피 수정동작@@@@@@@@@@@@@@@@"+vo);
		}else {// 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setS_file(defaultImg);
			vo.setS_thumbnail(defaultImg);
		}
		service.modify(vo);
		logger.info("C : 수정 완료!");
		return "redirect:/store/storeList?num=1";

	}

	// 상품 삭제
	@RequestMapping(value = "/store/storeDelete", method = RequestMethod.POST)
	public String productDelete(@RequestParam("no") int s_pno) throws Exception {
		logger.info("C : 상품 삭제 페이지");

		service.delete(s_pno);
		logger.info("C : " + s_pno + "번 상품 삭제 완료 ");

		return "redirect:/store/storeList?num=1";

	}

	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basketGET() throws Exception {
		return "/order/basket";
	}
// orderComplete

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public @ResponseBody ModelAndView completePOST(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println(request.getParameter("id"));

		// *********** parameter로 StoreVO 를 선언하게 되면 output JSON 파일에도 포함되므로
		// 선언하지 않고 밑에서 새로운 객체 VO 생성하여 입력

		OrderVO ovo1 = new OrderVO();
//        ovo1.setId("888888888888888888");
		ovo1.setId("테스트 성공");
//
		mav.addObject("ovo1", ovo1);
//        mav.addObject("svo", returnSVO);
		mav.setViewName("jsonView");
//        mav.setViewName("/order/basket");

		return mav;
	}

//	@RequestMapping(value = "/payment")
//	public String paymentReviewGET() throws Exception {
//
//		return "/store/payment";
//	}

	@RequestMapping(value = "/payment_bak")
	public String paymentReviewBakGET() throws Exception {

		return "/store/payment_bak";
	}

	
	 // 결제페이지
	  
	  @ResponseBody
	  
	  @RequestMapping(value="/payment", method=RequestMethod.POST) public int
	  payment(@ModelAttribute OrderVO vo, HttpSession session) throws Exception {
	  
	  logger.info("C : 오더 담기 컨트롤러");
	  logger.info("C : 오더 컨트롤러" +vo);
	  
	  int result = 1;
	  
	  String o_oid = (String)session.getAttribute("id");
	  
	  logger.info("id : " + o_oid);
	 
	  if(o_oid != null) {
	  vo.setO_oid(o_oid);
	  
	  service.payment(vo);
	  logger.info("vo : "+vo);
	  
	  result = 1;
	  }
	  
	  return result;
	  }
	 

	/*
	 * // 오더 목록
	 * 
	 * @RequestMapping(value = "/payment", method = RequestMethod.GET) public void
	 * cartList(HttpSession session, Model model) throws Exception {
	 * logger.info("C : 오더 리스트 테스트");
	 * 
	 * String o_oid = (String) session.getAttribute("id"); logger.info("id : " +
	 * o_oid);
	 * 
	 * List<OrderVO> payment = service.payment(o_oid); logger.info("payment : " +
	 * payment);
	 * 
	 * model.addAttribute("payment", payment); }
	 */
}