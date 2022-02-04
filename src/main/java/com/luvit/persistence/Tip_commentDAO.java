package com.luvit.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.luvit.domain.Recipe_commentVO;
import com.luvit.domain.TipVO;
import com.luvit.domain.Tip_commentVO;

public interface Tip_commentDAO {
	
	// DB서버의 시간정보를 가져오기
    String getTime();
	
	
	/////////////////////////////// 팁 댓글 ///////////////////////////////////
	// 댓글 개수
    int cntReply() throws Exception;
 
    // 댓글 목록
    List<Tip_commentVO> listReply(Tip_commentVO vo) throws Exception;
 
    // 댓글 작성
    int insertReply(Tip_commentVO vo) throws Exception;
    
    // 댓글 수정
    int updateReply(Tip_commentVO vo) throws Exception;
 
    // 댓글 삭제
    int deleteReply(int t_c_cno) throws Exception;
    
    // 평균평점
    int avgRating(int t_c_rating) throws Exception;
    
    /////////////////////////////////// 레시피 댓글 //////////////////////////////////
    
    // 댓글 개수
    int rcntReply() throws Exception;
 
    // 댓글 목록
    List<Recipe_commentVO> rlistReply(Recipe_commentVO vo) throws Exception;
 
    // 댓글 작성
    int rinsertReply(Recipe_commentVO vo) throws Exception;
    
    // 댓글 수정
    int rupdateReply(Recipe_commentVO vo) throws Exception;
 
    // 댓글 삭제
    int rdeleteReply(int r_c_cno) throws Exception;
    
    


	

}
