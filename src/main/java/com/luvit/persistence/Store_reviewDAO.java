package com.luvit.persistence;

import java.util.List;
import java.util.Map;

import com.luvit.domain.QnaVO;
import com.luvit.domain.StoreVO;
import com.luvit.domain.Store_reviewVO;

public interface Store_reviewDAO {
	// 해당 도메인에 관련된 기능 선언(추상메서드) -> 구현
	
	// 후기 조회
    List<Store_reviewVO> list_store_review() throws Exception;
	
	// DB서버의 시간정보를 가져오기
    String getTime() throws Exception;
	
	// 리뷰 등록 (C create)
    void insertReview(Store_reviewVO vo) throws Exception;
	
	// 후기 정보 가져오기
    Store_reviewVO getStore_review(int s_r_bno) throws Exception;
	
	// 리뷰 수정 - (U update)
    void updateReview(Store_reviewVO vo) throws Exception;
	
	//리뷰 삭제 -(D delete) 
    void deleteReview(int s_r_bno);
	
	// 후기 갯수 
    int count() throws Exception;
	
	// 후기 조회수 
    void storeReviewHit(int s_r_bno) throws Exception;
	 
	// 게시물 목록 + 페이징 (전체)
    List listAll2(int displayPost3, int postNum3) throws Exception;
	
	// 게시물 목록 + 페이징 
    List listPage(int displayPost, int postNum, int s_r_pno) throws Exception;
	
	// 게시물 목록 + 페이징 (카테고리)
    List catePage(int displayPost1, int postNum1, String s_r_cate) throws Exception;

	// 후기 추천여부 검사
    int srlCheck(Map<String, Object> m) throws Exception;
	
	// 후기 추천
    void srlUpdate(Map<String, Object> m) throws Exception;
	
	// 후기 추천 제거
    void srlDelete(Map<String, Object> m) throws Exception;
	
	// 후기 추천수
    int srlCount(int s_r_bno) throws Exception;
	
	// 상품 이름 조회 
    StoreVO productName(int s_r_pno) throws Exception;
	
	
}
