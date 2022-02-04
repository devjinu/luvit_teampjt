package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.StoreVO;
import com.luvit.persistence.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService{

	@Inject
	private StoreDAO sdao;
	
	// 상품 등록
	@Override
	public void insertProduct(StoreVO vo) throws Exception {
		System.out.println("S : 상품등록 동작");	
		sdao.insertProduct(vo);		
	}

	/*
	 * // 상품 목록
	 * 
	 * @Override public List storeList(int displayPost, int postNum) throws
	 * Exception{ System.out.println("S : 상품 목록"); return
	 * sdao.storeList(displayPost, postNum); }
	 */
	
	// 상품 목록 + 페이징 처리
		@Override
		public List listPage(int displayPost, int postNum, String keyword,String cate) throws Exception {
			return sdao.listPage(displayPost, postNum, keyword,cate);
		}

	// 상품 조회
	@Override
	public StoreVO product(int s_pno) throws Exception {
		System.out.println("S : 상품 조회");
		return sdao.product(s_pno);
	}

	// 상품 수정
	@Override
	public void modify(StoreVO vo) throws Exception {
		System.out.println("S : 상품 수정");
		sdao.modify(vo);
		
	}
	
	// 상품 삭제
	@Override
	public void delete(int s_pno) throws Exception {
		System.out.println("S : 상품 삭제");
		sdao.delete(s_pno);
	}



	// 총 갯수
	@Override
	public int count() throws Exception {
		return sdao.count();
	}

	

	
	  @Override public void payment(OrderVO vo) throws Exception {
	  System.out.println("S : 주문페이지"); sdao.payment(vo);
	  
	  
	  }
	 

		/*
		 * @Override public List<OrderVO> payment(String o_oid) throws Exception {
		 * System.out.println("S : 카트 목록 " + o_oid); return sdao.payment(o_oid); }
		 */
	
	
	
	
}