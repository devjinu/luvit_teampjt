package com.luvit.persistence;

/*import java.lang.System.Logger;*/
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.persistence.Store_reviewDAO;
import com.luvit.domain.QnaVO;
import com.luvit.domain.StoreVO;
import com.luvit.domain.Store_reviewVO;

// @Repository : DAO객체를 스프링에서 인식 할 수 있도록 처리
//              DAO 객체를 구현한 객체로 사용하도록 지정
@Repository
public class Store_reviewDAOImpl implements Store_reviewDAO {
	// DAO 동작

	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlSession;
	// -> Mapper가 있는 위치까지 접근

	// Mapper를 구분하는 값
	private static final String namespace = "com.luvit.mapper.Store_reviewMapper";

	// 후기 조회
	@Override
	public List<Store_reviewVO> list_store_review() throws Exception{
		return sqlSession.selectList(namespace + ".store_review_List");
	}

	// 현재시간 가져옴 
	@Override
	public String getTime() throws Exception{
		System.out.println("DAO : DB접근 sqlSession객체를 주입!");
		System.out.println("DAO : TEST에서 해당메서드 호출!!! ");
		System.out.println("DAO : Store_reviewMapper.xml 이동");
		System.out.println("DAO : Select구문을 실행하는 메서드를 실행해서 SQL구문 실행");
		// "com.luvit.mapper.Store_reviewMapper.getTime";
		String result = sqlSession.selectOne(namespace + ".getTime");
		System.out.println("DAO : SQL 구문 실행완료! 값 리턴 후 테스트로 이동");
		return result;
	}

	// 후기 등록
	@Override
	public void insertReview(Store_reviewVO vo) {

		sqlSession.insert(namespace + ".insertReview", vo);

	}

	// 후기 수정 
	@Override
	public void updateReview(Store_reviewVO vo) {
		System.out.println("DAO : updateReview(vo) 호출");
		System.out.println("DAO : 정보가지고 mapper 이동 ");

		sqlSession.update(namespace + ".updateReview", vo);

		System.out.println("DAO : 수정완료 ! ");

	}
	
	// 후기 정보 가져오기
	@Override
	public Store_reviewVO getStore_review(int s_r_bno) {
		System.out.println("DAO : 후기 가져오기 확인");
		return sqlSession.selectOne(namespace+".getStore_review", s_r_bno);
	}
	
	// 후기 삭제 
	@Override
	public void deleteReview(int s_r_bno) {
		sqlSession.delete(namespace + ".ReviewDelete", s_r_bno);
	}
	
	// 후기 갯수 
	@Override
	public int count() { 
		return sqlSession.selectOne(namespace+".count"); 
	 }
	
	// 후기 조회수 
	@Override
	public void storeReviewHit(int s_r_bno) throws Exception{
		sqlSession.update(namespace+".storeReviewHit", s_r_bno);
	}
	
	// 게시물 목록 + 페이징 (전체)
	@Override
	public List listAll2(int displayPost3, int postNum3) throws Exception{
		HashMap data = new HashMap();
		 
		 data.put("displayPost", displayPost3); 
		 data.put("postNum", postNum3);

		 return sqlSession.selectList(namespace + ".listAll2", data); 
	}
	
		
	// 게시물 목록 + 페이징
	@Override 
	public List listPage(int displayPost, int postNum, int s_r_pno) throws Exception{
		 HashMap data = new HashMap();
		 
		 data.put("displayPost", displayPost); 
		 data.put("postNum", postNum);
		 data.put("s_r_pno", s_r_pno);

		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@// : postNum " + postNum + "@@@@@@@@@@@@@@ : displayPost" + displayPost);
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@// : data " + data);
		 
		 System.out.println(sqlSession.selectList(namespace + ".listPage", data));
		 
		 return sqlSession.selectList(namespace + ".listPage", data); 
	}
	
	// 게시물 목록 + 페이징 (카테고리)
	@Override
	public List catePage(int displayPost1, int postNum1, String s_r_cate) throws Exception{ 
		HashMap data = new HashMap();
		 
		 data.put("displayPost", displayPost1); 
		 data.put("postNum", postNum1);
		 data.put("s_r_cate", s_r_cate);
		 
		 
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@ : postNum " + postNum1 + "@@@@@@@@@@@@@@ : displayPost" + displayPost1);
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@ : data " + data);
		  
		 return sqlSession.selectList(namespace + ".store_review_cate", data);
	}
	
	// 후기 추천여부 검사
	@Override
	public int srlCheck(Map<String, Object> m) throws Exception{
		int result = 0;
		result = sqlSession.selectOne(namespace + ".srl_check", m);
		return result;
	}
	
	// 후기 추천
	@Override
	public void srlUpdate(Map<String, Object> m) throws Exception{
		sqlSession.insert(namespace + ".srl_update", m);
	}
	
	// 후기 추천 제거
	@Override
	public void srlDelete(Map<String, Object> m) throws Exception{
		sqlSession.delete(namespace + ".srl_delete", m);
	}
	
	// 후기 추천수
	@Override
	public int srlCount(int s_r_bno) throws Exception{
		int count = 0;
		count = sqlSession.selectOne(namespace + ".srl_count", s_r_bno);
		return count;
	}
	
	// 상품 이름 조회 
	@Override
	public StoreVO productName(int s_r_pno) throws Exception{
		System.out.println("DAO : 상품 이름 조회 ");
		return sqlSession.selectOne(namespace+".productName", s_r_pno);
	}
	
}
