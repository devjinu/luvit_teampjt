package com.luvit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.CartListVO;
import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.Order_detailVO;
import com.luvit.domain.Order_listVO;
import com.luvit.domain.PayerVO;
import com.luvit.domain.StoreVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
	="com.luvit.mapper.CartMapper";
	
	// 카트 담기
	@Override
	public void addCart(CartVO vo) throws Exception{
		System.out.println("DAO : addCart(CartVO vo) 호출 ");
		sqlSession.insert(namespace+".addCart", vo);
		
		System.out.println("DAO : addCart 쿼리 실행 완료");
	}
	
	// 카트 목록
	@Override
	public List<CartVO> cartList(String c_id) throws Exception {	
		System.out.println("DAO :  List<CartVO> cartList() 호출 "+ c_id);
		return sqlSession.selectList(namespace+".cartList",c_id);
	}
	
	// 카트 삭제
	@Override
    public void cartDelete(CartVO vo) {
        sqlSession.delete(namespace+".cartDelete", vo);
    }
	
	
	// 주문 정보
	@Override
	public void orderInfo(Order_listVO vo) throws Exception{
		sqlSession.insert(namespace+".orderInfo",vo);
	}

	//주문 상세 정보
	@Override
	public void orderInfo_Details(Order_detailVO vo) throws Exception {
		sqlSession.insert(namespace+".orderInfo_Details",vo);
		
	}

	
	// 카트 비우기
	@Override
	public void cartAllDelete(String id) throws Exception {
		sqlSession.delete(namespace+".cartAllDelete",id);
		
	}

	// 주문목록
	@Override
	public List<Order_listVO> orderList(Order_listVO vo) throws Exception {
		return sqlSession.selectList(namespace+".orderList", vo);
	}

	
	// 관리자 주문목록
	@Override
	public List<Order_listVO> adminOrderList(Order_listVO vo) throws Exception {
		return sqlSession.selectList(namespace+".adminOrderList", vo);
	}

	@Override
	public List<PayerVO> orderView(Order_listVO vo) throws Exception {
		return sqlSession.selectList(namespace+".orderView", vo);
	}

	
	@Override
	public Order_listVO order(String o_ono) throws Exception {
		return sqlSession.selectOne(namespace+".order", o_ono);
	}

	@Override
	public void orderModify(Order_listVO vo) throws Exception {
		sqlSession.update(namespace+".orderModify", vo);
		
	}
	
	
	
}
