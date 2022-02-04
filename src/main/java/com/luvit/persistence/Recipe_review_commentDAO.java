package com.luvit.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.luvit.domain.Recipe_reviewVO;
import com.luvit.domain.Recipe_review_commentVO;

public interface Recipe_review_commentDAO {

	// DB서버의 시간정보를 가져오기
    String getTime();
	
	// 댓글 개수
    int cntComment() throws Exception;
 
    // 댓글 목록
    List<Recipe_review_commentVO> listComment(Recipe_review_commentVO vo) throws Exception;
 
    // 댓글 작성
    int insertComment(Recipe_review_commentVO vo) throws Exception;
    
    // 댓글 수정
    int updateComment(Recipe_review_commentVO vo) throws Exception;
 
    // 댓글 삭제
    int deleteComment(int r_r_c_cno) throws Exception;
    
}
