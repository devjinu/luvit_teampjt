package com.luvit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;

//@Service와 거의 비슷한 기능
@Repository 
public class RecipeDAOImpl implements RecipeDAO{
	
	// DB 처리하기 위한 객체 주입 
	@Inject // 의존 주입
	private SqlSession sqlSession;
	
	private static final String namespace = "com.luvit.mapper.RecipeMapper";
	private static final String name = "com.luvit.mapper.MypageMapper";
	
	// 게시글 추가 
	@Override
	public void create(RecipeVO vo) throws Exception {
		sqlSession.insert(namespace+".insertBoard", vo);
		
	}

	// 게시글 리스트 보기
	@Override
	public List<RecipeVO> listAll() throws Exception {
		
		
		return sqlSession.selectList(namespace+".listBoard");
	}

	// 게시글 상세보기
	@Override
	public RecipeVO read(int r_bno) throws Exception {
		
		return sqlSession.selectOne(namespace+".detailBoard", r_bno);
	}
	
	// 선택한 게시글 조회수 증가시키기 
	@Override
	public void recipeHit(int r_bno) throws Exception {
		sqlSession.update(namespace+".recipeHit", r_bno);		
	}
	
	// 게시글 삭제
	@Override
	public void delete(int r_bno) throws Exception {
		sqlSession.delete(namespace+".deleteBoard", r_bno);
		
	}
	
	// 게시글 수정
	@Override
	public void update(RecipeVO vo) throws Exception {
		sqlSession.update(namespace+".updateBoard", vo);
		
	}
	
	// 게시글 총 갯수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(namespace+".count");
	}

	// 게시글 목록 + 페이징
	@Override
	public List<RecipeVO> listPage(int displayPost, int postNum) throws Exception {
		
	HashMap<String, Integer> data = new HashMap<String, Integer>();
	// DAO와 매퍼에서는 데이터를 하나만 전송할 수 있기 때문에
	// 두 개 이상을 동시에 가져가야 할 때는 VO나 해시맵에 담아가야 함.
	data.put("displayPost", displayPost);
	data.put("postNum", postNum);
	return sqlSession.selectList(namespace+".listPage", data);
	}
	
	// 해당 태그에 따른 게시글 총 갯수
	@Override
	public int tagCount(String tag) throws Exception{
		return sqlSession.selectOne(namespace+".tagCount",tag);
	}
	
	// 태그에 따른 게시글 목록 + 페이징
	@Override
	public List<RecipeVO> tagResult(String tag, int displayPost, int postNum) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("tag", tag);
		return sqlSession.selectList(namespace+".tagResult", data);
	}
	
	// 요청한 갯수의 게시물 조회수 순으로 출력
	@Override
	public List<RecipeVO> readRecipeAmount(int hopeAmount) throws Exception {
		return sqlSession.selectList(namespace+".readRecipeAmount", hopeAmount);
	}
	
	// r_tag2 중 선택률이 가장 높은 태그 값 받아오기 
	@Override
	public String bestTag2() throws Exception {
		return sqlSession.selectOne(namespace+".bestTag2");
	}
	
	// 게시글 목록 + 페이징 + 검색
	@Override
	public List<RecipeVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectList(namespace+".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용 
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap data = new HashMap();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectOne(namespace+".searchCount", data);
	}
	
	// r_tag3 중 선택률이 가장 높은 태그 값 받아오기 
	@Override
	public String bestTag3() throws Exception {
		return sqlSession.selectOne(namespace+".bestTag3");
	}
	
	// r_tag4 중 선택률이 가장 높은 태그 값 받아오기 
	@Override
	public String bestTag4() throws Exception {
		return sqlSession.selectOne(namespace+".bestTag4");
	}

	
	// ************ 마이페이지에서 사용할 기능 **************
	// 해당 유저가 작성한 글 보기 
	@Override
	public List<RecipeVO> myBoardList(String r_id) throws Exception {

		return sqlSession.selectList(namespace+".myBoardList",r_id);
	}
	
	// 해당 유저가 작성한 모든 글 보기 (MypageMapper)
	@Override
	public List<RecipeVO> myBoardAll(String r_id, int displayPost, int postNum) throws Exception {
		HashMap data = new HashMap();
		data.put("r_id", r_id);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sqlSession.selectList(name+".myBoardAll",data);
	}

	@Override
	public int myBoardAllCount(String r_id) throws Exception {
		return sqlSession.selectOne(name+".myBoardAllCount",r_id);
	}

}
