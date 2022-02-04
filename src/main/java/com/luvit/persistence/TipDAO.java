package com.luvit.persistence;

import java.util.List;
import java.util.Map;

import com.luvit.domain.TipVO;
import com.luvit.domain.Tip_commentVO;

public interface TipDAO {
	
	// DB서버의 시간정보를 가져오기
    String getTime();
	
	// 글번호 계산
    int cntBno(TipVO vo) throws Exception;
	
	// 글쓰기		
    void insertTip(TipVO vo) throws Exception;
	
	// 글목록
    List<TipVO> listAll() throws Exception;
    
    // 글읽기
    TipVO readTip(int t_bno) throws Exception;
    
    // 글삭제
    void deleteTip(int t_bno) throws Exception;
    
    // 글수정
    void updateTip(TipVO vo) throws Exception;
    
    // 글 총 갯수
    int count() throws Exception;
    
    // 게시물 목록 + 페이징
    // public List listPage(int displayPost, int postNum) throws Exception;
    
    // 게시판 조회수
    void hitTip(int t_bno) throws Exception;
 	
 	// 팁 목록 + 페이징 + 검색
    List<TipVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
 	
 	// 팁 총 수 + 검색 적용
    int searchCount(String searchType, String keyword) throws Exception;
 	
//    // 좋아요
//    int like_cnt_up(int t_bno) throws Exception;
//    
//    int like_cnt_down(int t_bno) throws Exception;
    
    // 평균평점
    int avgRating(int t_c_rating) throws Exception;
    
}
