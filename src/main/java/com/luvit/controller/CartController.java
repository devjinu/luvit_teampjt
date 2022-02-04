package com.luvit.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luvit.domain.CartListVO;
import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.Order_detailVO;
import com.luvit.domain.Order_listVO;
import com.luvit.domain.PayerVO;
import com.luvit.domain.StoreVO;
import com.luvit.domain.UserVO;
import com.luvit.service.CartService;
import com.luvit.service.StoreService;

@Controller
@RequestMapping(value="/cart/*")
public class CartController {
	
	// 서비스 처리 객체를 주입(DI)
	@Inject
	private CartService service;
		
	private static final Logger logger =
			LoggerFactory.getLogger(CartController.class);

	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	public int addCart(@ModelAttribute CartVO vo, HttpSession session) throws Exception {

		logger.info("C : 카트 담기 컨트롤러");
		logger.info("C : 카트 컨트롤러" +vo);
		
		int result = 0;
		
		String c_id = (String)session.getAttribute("id");

		logger.info("id : " + c_id);
		
		if(c_id != null) {
			vo.setC_id(c_id);
			service.addCart(vo);
		
			logger.info("vo : "+vo);
		
			result = 1;
		}
		
		return result;
	}
	
	// http://localhost:8088/cart/payment
	// 카트 목록
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public void cartList(HttpSession session, Model model) throws Exception {
		logger.info("C : 카트 리스트 테스트");
		
		String c_id = (String)session.getAttribute("id");
		logger.info("id : " + c_id);
		
		List<CartVO> cartList = service.cartList(c_id);		
		logger.info("cartList : " + cartList); 
		
		model.addAttribute("cartList",cartList);
	}
	
	
	// 주문
	@RequestMapping(value = "/payment", method = RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String order(HttpSession session, Order_listVO vo, Order_detailVO detailvo) throws Exception {
	 logger.info("order");
	 
	 String id = (String)session.getAttribute("id");
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String o_ono = ymd + "_" + subNum;

	 vo.setO_ono(o_ono);
	 vo.setO_id(id);
	 
	 service.orderInfo(vo);
	 
	 detailvo.setO_d_ono(o_ono);
	 service.orderInfo_Details(detailvo); 
	 
	 
	 service.cartAllDelete(id);
	 
	 logger.info("vo : "+vo);
	 
	 return "redirect:/cart/orderList";  
	}
	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value="/cartDelete", method = RequestMethod.POST)
	public int cartDelete(HttpSession session,
					@RequestParam(value="chbox[]") List<String> chArr, CartVO vo) throws Exception{
		logger.info("C : 카트 삭제 페이지");
		
		String c_id = (String)session.getAttribute("id");
		logger.info("id : " + c_id);
		
		int result = 0;
		int cartNum = 0;
		
		if(c_id != null) {
			vo.setC_id(c_id);
			logger.info("id : "+c_id);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				vo.setC_ono(cartNum);
				logger.info("cartNum : " + cartNum);
				service.cartDelete(vo);
				logger.info("C : 삭제 완료");
			}
			
			result = 1;
		}
		
		return result;

	}
	
	// 주문 목록
	@RequestMapping(value="/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Order_listVO vo, Model model) throws Exception{
		logger.info("C : 주문 목록");
		
		String id = (String)session.getAttribute("id");
		logger.info("id : " + id);
		
		vo.setO_id(id);
		
		List<Order_listVO> orderList = service.orderList(vo);
		
		model.addAttribute("orderList", orderList);
		
	}
	
	// 관리자 주문 목록
		@RequestMapping(value="/adminOrderList", method = RequestMethod.GET)
		public void getAdminOrderList(HttpSession session, Order_listVO vo, Model model) throws Exception{
			logger.info("C : 주문 목록");
			
			String id = (String)session.getAttribute("id");
			logger.info("id : " + id);
			
			vo.setO_id(id);
			
			List<Order_listVO> adminOrderList = service.adminOrderList(vo);
			
			model.addAttribute("adminOrderList", adminOrderList);
			
		}
	
	// 주문 상세 목록
	@RequestMapping(value="/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String o_ono,
							Order_listVO vo, Model model) throws Exception{
		logger.info("C : 주문 조회 페이지");
		
		String id = (String)session.getAttribute("id");
		logger.info("id : " + id);
		
		vo.setO_id(id);
		vo.setO_ono(o_ono);
		
		List<PayerVO> orderView = service.orderView(vo);
		logger.info("orderView : " + orderView );
		
		model.addAttribute("orderView", orderView);
		
	}


	
	// 배송정보 수정
		@RequestMapping(value = "/orderModify", method = RequestMethod.GET)
		public void productModify(@RequestParam("n") String o_ono, Model model) throws Exception {
			logger.info("C : 배송정보 수정 페이지");

			Order_listVO vo = service.order(o_ono);
			logger.info("C : " + o_ono + "번 수정");
			model.addAttribute("vo", vo);

		}
		
		
		// 배송정보 수정
		@RequestMapping(value = "/orderModify", method = RequestMethod.POST)
		public String productModify(Order_listVO vo) throws Exception {
			logger.info("C : 상품 수정 페이지");

			service.orderModify(vo);
			logger.info("C : 수정 완료!");
			return "redirect:/cart/orderList";

		}
	
	
}
