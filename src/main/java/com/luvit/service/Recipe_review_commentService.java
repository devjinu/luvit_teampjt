package com.luvit.service;

import java.util.List;

import com.luvit.domain.Recipe_review_commentVO;

public interface Recipe_review_commentService {

	// 댓글 목록
    List<Recipe_review_commentVO> listComment(Recipe_review_commentVO vo) throws Exception;
	
	// 댓글 작성
    int insertComment(Recipe_review_commentVO vo) throws Exception;
	
	// 댓글 수정
    int updateComment(Recipe_review_commentVO vo) throws Exception;
	
	// 댓글 삭제
    int deleteComment(int r_r_c_cno) throws Exception;
}
