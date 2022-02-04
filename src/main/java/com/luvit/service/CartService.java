package com.luvit.service;

import java.util.List;

import com.luvit.domain.CartListVO;
import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.Order_detailVO;
import com.luvit.domain.Order_listVO;
import com.luvit.domain.PayerVO;
import com.luvit.domain.StoreVO;

public interface CartService {
	
	// 카트 담기
    void addCart(CartVO vo) throws Exception;
	
	// 카트 목록
    List<CartVO> cartList(String c_id) throws Exception;

	// 카트 삭제
    void cartDelete(CartVO vo) throws Exception;
    
    // 주문 정보
    void orderInfo(Order_listVO vo) throws Exception;
    
    // 주문 상세 정보
    void orderInfo_Details(Order_detailVO vo) throws Exception;
    
    
    // 카트 비우기
    void cartAllDelete(String id) throws Exception;
    
    // 주문목록
    List<Order_listVO> orderList(Order_listVO vo) throws Exception;
    
    // 관리자 주문목록
    List<Order_listVO> adminOrderList(Order_listVO vo) throws Exception;
    
    // 특정 주문 목록
    List<PayerVO> orderView(Order_listVO vo) throws Exception;
    
 	// 주문 조회
    Order_listVO order(String o_ono) throws Exception;
  	
  	// 배송정보 수정
    void orderModify(Order_listVO vo) throws Exception;
}
