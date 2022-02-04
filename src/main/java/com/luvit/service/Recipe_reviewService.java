package com.luvit.service;

import java.util.List;

import com.luvit.domain.Recipe_reviewVO;
import com.luvit.domain.Recipe_review_commentVO;

public interface Recipe_reviewService {
	
	// 레시피_리뷰 번호
    int cntBno(Recipe_reviewVO vo) throws Exception;
	
	// 레시피_리뷰 목록
    List<Recipe_reviewVO> list() throws Exception;
	
	// 레시피_리뷰 작성
    void write(Recipe_reviewVO vo) throws Exception;
	
	// 레시피_리뷰 조회
    Recipe_reviewVO view(int r_r_bno) throws Exception;
	
	// 레시피_리뷰 수정
    void modify(Recipe_reviewVO vo) throws Exception;
	
	// 레시피_리뷰 삭제
    void delete(int r_r_bno) throws Exception;
	
	// 레시피_리뷰 총 수
    int count() throws Exception;

	// 레시피_리뷰 목록 + 페이징 + 검색
    List<Recipe_reviewVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;

	// 레시피_리뷰 총 수 + 검색 적용
    int searchCount(String searchType, String keyword) throws Exception;

}
