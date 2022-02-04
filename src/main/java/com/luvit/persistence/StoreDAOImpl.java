package com.luvit.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace
	="com.luvit.mapper.StoreMapper";
	
	// 상품 등록
	@Override
	public void insertProduct(StoreVO vo) {
		System.out.println("DAO : insertProduct(StoreVO vo) 호출 ");
		sqlSession.insert(namespace+".insertProduct", vo);
		
		System.out.println("DAO : insertProduct 쿼리 실행 완료");
		
	}
	
	/*
	 * // 상품 목록
	 * 
	 * @Override public List storeList(int displayPost, int postNum) throws
	 * Exception { System.out.println("DAO :  List<StoreVO> storeList() 호출 ");
	 * HashMap data = new HashMap();
	 * 
	 * data.put("displayPost", displayPost); data.put("postNum", postNum); return
	 * sqlSession.selectList(namespace+".storeList");
	 * 
	 * }
	 */
	
	// 스토어 목록 + 페이징처리
		@Override
		public List listPage(int displayPost, int postNum, String keyword,String cate) throws Exception {
			HashMap data = new HashMap();
			
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);

			data.put("keyword", keyword);
			data.put("cate", cate);
			
			
			return sqlSession.selectList(namespace+".listPage",data);
		}
		
	
	// 상품 조회
	@Override
	public StoreVO product(int s_pno) throws Exception {
		System.out.println("DAO :  StoreVO product(int s_pno) 호출 ");
		return sqlSession.selectOne(namespace+".product", s_pno);
	}

	// 상품 수정
	@Override
	public void modify(StoreVO vo) throws Exception {
		sqlSession.update(namespace+".modify", vo);
		
	}
	
	// 상품 삭제
	@Override
	public void delete(int s_pno) throws Exception {
		sqlSession.delete(namespace+".delete", s_pno);
		
	}

	// 총 갯수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(namespace+".count");
	}

	

	
	  @Override public void payment(OrderVO vo) throws Exception {
	  System.out.println("DAO : payment(OrderVO vo) 호출 ");
	  sqlSession.insert(namespace+".payment", vo);
	  
	  System.out.println("DAO : payment 쿼리 실행 완료"); }
	 

	/*
	 * @Override public List<OrderVO> payment(String o_oid) throws Exception {
	 * System.out.println("DAO :  List<OrderVO> payment() 호출 "+ o_oid); return
	 * sqlSession.selectList(namespace+".payment",o_oid); }
	 */
	
	
	
}
