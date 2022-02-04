package com.luvit.service;

import java.util.List;

import com.luvit.domain.Recipe_commentVO;
import com.luvit.domain.Tip_commentVO;

public interface Tip_commentService {
	
	/////////////////////////////// 팁 댓글 ///////////////////////////////////
	
	List<Tip_commentVO> listReply(Tip_commentVO vo) throws Exception;
	
	int insertReply(Tip_commentVO vo) throws Exception;
	
	int updateReply(Tip_commentVO vo) throws Exception;
	
	int deleteReply(int t_c_cno) throws Exception;
	
	// 평균평점
    int avgRating(int t_c_rating) throws Exception;
	

	/////////////////////////////////// 레시피 댓글 //////////////////////////////////
	
	List<Recipe_commentVO> rlistReply(Recipe_commentVO vo) throws Exception;
	
	int rinsertReply(Recipe_commentVO vo) throws Exception;
	
	int rupdateReply(Recipe_commentVO vo) throws Exception;
	
	int rdeleteReply(int r_c_cno) throws Exception;

	
	
	
	
	
	
}
