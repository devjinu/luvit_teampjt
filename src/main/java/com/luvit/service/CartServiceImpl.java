package com.luvit.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.CartListVO;
import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.Order_detailVO;
import com.luvit.domain.Order_listVO;
import com.luvit.domain.PayerVO;
import com.luvit.persistence.CartDAO;


@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO cdao;
	
	// 카트 담기
	@Override
	public void addCart(CartVO vo) throws Exception{
		System.out.println("S : 카트 담기 동작");	
		cdao.addCart(vo);
	}
	
	
	// 카트 목록
	@Override
	public List<CartVO> cartList(String c_id) throws Exception{
		System.out.println("S : 카트 목록 " + c_id);
		return cdao.cartList(c_id);
	}
	
	// 카트 삭제
	@Override
    public void cartDelete(CartVO vo) {
		cdao.cartDelete(vo);
    }


	// 주문정보
	@Override
	public void orderInfo(Order_listVO vo) throws Exception {
	cdao.orderInfo(vo);
		
	}

	// 주문상세정보
	@Override
	public void orderInfo_Details(Order_detailVO vo) throws Exception {
		cdao.orderInfo_Details(vo);
		
	}

	// 카트비우기
	@Override
	public void cartAllDelete(String id) throws Exception {
		cdao.cartAllDelete(id);
		
	}
	 
	// 주문목록
    public List<Order_listVO> orderList(Order_listVO vo) throws Exception{
    	return cdao.orderList(vo);
    }

    
    @Override
	public List<Order_listVO> adminOrderList(Order_listVO vo) throws Exception {
		return cdao.adminOrderList(vo);
	}


	// 특정 주문 목록
	@Override
	public List<PayerVO> orderView(Order_listVO vo) throws Exception {
		return cdao.orderView(vo);
	}

	// 주문 조회
	@Override
	public Order_listVO order(String o_ono) throws Exception {
		return cdao.order(o_ono);
	}


	// 배송정보 수정
	@Override
	public void orderModify(Order_listVO vo) throws Exception {
		cdao.orderModify(vo);
		
	}
	
    
    
}
