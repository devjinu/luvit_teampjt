package com.luvit.persistence;

import java.util.List;

import com.luvit.domain.RecipeVO;

public interface RecipeDAO {
	
	// 레시피 등록
    void create(RecipeVO vo) throws Exception;
	
	// 레시피 목록보기
    List<RecipeVO> listAll() throws Exception;
	
	// 레시피 보기
    RecipeVO read(int r_bno) throws Exception;
	
	// 선택한 레시피의 조회수 
    void recipeHit(int r_bno) throws Exception;
	
	// 레시피 삭제
    void delete(int r_bno) throws Exception;
	
	// 레시피 수정
    void update(RecipeVO vo) throws Exception;
	
	// 레시피 총 갯수
    int count() throws Exception;
	
	// 레시피 총 갯수 + 검색 적용
    int searchCount(String searchType, String keyword) throws Exception;
	
	// 레시피 목록 + 페이징
    List<RecipeVO> listPage(int displayPost, int postNum) throws Exception;
	
	// 레시피 목록 + 페이징 + 검색
    List<RecipeVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 해당 태그가 포함된 레시피 수
    int tagCount(String tag) throws Exception;
	
	// 해당 태그가 포함된 레시피 목록 + 페이징
    List<RecipeVO> tagResult(String tag, int displayPost, int postNum) throws Exception;
	
	// 요청한 갯수의 게시물 조회수 순으로 조회
    List<RecipeVO> readRecipeAmount(int hopeAmount) throws Exception;
	
	// r_tag2 중 선택률이 가장 높은 태그 값 받아오기
    String bestTag2() throws Exception;
	
	// r_tag3 중 선택률이 가장 높은 태그 값 받아오기
    String bestTag3() throws Exception;
	
	// r_tag4 중 선택률이 가장 높은 태그 값 받아오기
    String bestTag4() throws Exception;
	
	
    // ************* 마이페이지에서 필요한 기능
    // 선택한 아이디의 레시피 모두 불러오기 
    List<RecipeVO> myBoardList(String r_id) throws Exception;
    
    // 선택한 아이디의 모든 게시물 불러오기
    List myBoardAll(String r_id, int displayPost, int postNum) throws Exception;
	
    // 선택한 아이디의 모든 게시물 수
    int myBoardAllCount(String r_id) throws Exception;
    
}
