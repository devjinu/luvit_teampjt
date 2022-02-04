package com.luvit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.Recipe_reviewVO;

@Repository
public class Recipe_reviewDAOImpl implements Recipe_reviewDAO {
	
	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sql; // -> Mapper가 있는 위치까지 접근
	
	// Mapper를 구분하는 값
	private static final String namespace = "com.luvit.mapper.Recipe_reviewMapper";
	
	// 시간정보추가
	@Override
	public String getTime() {
		System.out.println("DAO : DB접근 sqlSession객체를 주입!");
		System.out.println("DAO : TEST에서 해당메서드 호출!!! ");
		System.out.println("DAO : memberMapper.xml 이동");
		System.out.println("DAO : Select구문을 실행하는 메서드를 실행해서 SQL구문 실행");
		// "com.itwillbs.mapper.MemberMapper.getTime";
		String result = sql.selectOne(namespace + ".getTime");
		System.out.println("DAO : SQL 구문 실행완료! 값 리턴 후 테스트로 이동");
		return result;
	}
	
	// 레시피_리뷰 번호 
	@Override
	public int cntBno(Recipe_reviewVO vo) throws Exception {
		return sql.selectOne(namespace + ".cntBno", vo);
	}
	
	// 레시피_리뷰 목록
	@Override
	public List<Recipe_reviewVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	// 레시피_리뷰 작성
	@Override
	public void write(Recipe_reviewVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}
	
	// 레시피_리뷰 조회
	@Override
	public Recipe_reviewVO view(int r_r_bno) throws Exception {
		return sql.selectOne(namespace + ".view", r_r_bno);
	}
	
	// 레시피_리뷰 수정
	@Override
	public void modify(Recipe_reviewVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}
	
	// 레시피_리뷰 조회수
	@Override
	public void hit(int r_r_bno) throws Exception {			
		sql.update(namespace + ".hit", r_r_bno);
	}
	
	// 레시피_리뷰 삭제
	public void delete(int r_r_bno) throws Exception {
		sql.delete(namespace + ".delete", r_r_bno);
	}
	
	// 레시피_리뷰 총 수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count"); 
	}
	
	// 레시피_리뷰 목록 + 페이징 + 검색
	@Override
	public List<Recipe_reviewVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 레시피_리뷰 총 수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap data = new HashMap();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sql.selectOne(namespace + ".searchCount", data); 
	}
	
}
