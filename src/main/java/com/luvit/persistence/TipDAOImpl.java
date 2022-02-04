package com.luvit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.TipVO;

@Repository
public class TipDAOImpl implements TipDAO {

	// DAO 동작

	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlSession;
	// -> Mapper가 있는 위치까지 접근

	// Mapper를 구분하는 값
	private static final String namespace = "com.luvit.mapper.TipMapper";

	// 시간정보추가
	@Override
	public String getTime() {
		System.out.println("DAO : DB접근 sqlSession객체를 주입!");
		System.out.println("DAO : TEST에서 해당메서드 호출!!! ");
		System.out.println("DAO : memberMapper.xml 이동");
		System.out.println("DAO : Select구문을 실행하는 메서드를 실행해서 SQL구문 실행");
		// "com.itwillbs.mapper.MemberMapper.getTime";
		String result = sqlSession.selectOne(namespace + ".getTime");
		System.out.println("DAO : SQL 구문 실행완료! 값 리턴 후 테스트로 이동");
		return result;
	}
	
	// 글번호 계산 
	@Override
	public int cntBno(TipVO vo) throws Exception {
		return sqlSession.selectOne(namespace + ".cntBno", vo);
	}
	

	// 글쓰기
	@Override
	public void insertTip(TipVO vo) throws Exception {

		sqlSession.insert(namespace + ".insertTip", vo);

	}


	// 글목록
	@Override
	public List<TipVO> listAll() throws Exception {

		return sqlSession.selectList(namespace + ".listTip");
	}

	// 글읽기
	@Override
	public TipVO readTip(int t_bno) throws Exception {
		return sqlSession.selectOne(namespace + ".readTip", t_bno);
	}

	// 글삭제
	@Override
	public void deleteTip(int t_bno) throws Exception {

		sqlSession.delete(namespace + ".deleteTip", t_bno);

	}

	// 글수정
	@Override
	public void updateTip(TipVO vo) throws Exception {

		sqlSession.update(namespace + ".updateTip", vo);

	}
	
	// 글 총 갯수
	@Override
	public int count() throws Exception {
		
		return sqlSession.selectOne(namespace+".count");
	}
	
//	// 게시물 목록 + 페이징
//	@Override
//	public List listPage(int displayPost, int postNum) throws Exception {
//
//	 HashMap data = new HashMap();
//	  
//	 data.put("displayPost", displayPost);
//	 data.put("postNum", postNum);
//	  
//	 return sqlSession.selectList(namespace + ".listPage", data);
//	}

	// 게시물 조회수
	@Override
	public void hitTip(int t_bno) throws Exception {
		
		sqlSession.update(namespace + ".tipHit", t_bno);
	}

	// 팁 목록 + 페이징 + 검색
	@Override
	public List<TipVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectList(namespace + ".listPageSearch", data);
	}
	
	// 팁 총 수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap data = new HashMap();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectOne(namespace + ".searchCount", data); 
	}

//	// 좋아요
//	@Override
//	public int like_cnt_up(int t_bno) throws Exception {
//		return sqlSession.update(namespace + ".cntup", t_bno);
//	}
//
//	@Override
//	public int like_cnt_down(int t_bno) throws Exception {
//		
//		return sqlSession.update(namespace + ".cntdown", t_bno);
//	}
	
	// 평균평점
	@Override
	public int avgRating(int t_c_rating) throws Exception {
		return sqlSession.update(namespace+".avgRating", t_c_rating);
	}
	
	
	
	
}
