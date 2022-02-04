package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.Recipe_commentVO;
import com.luvit.domain.Tip_commentVO;
import com.luvit.persistence.Tip_commentDAO;

@Service
public class Tip_commentServiceImpl implements Tip_commentService{
	
	@Inject
	private Tip_commentDAO tcdao;
	
	/////////////////////////////// 팁 댓글 ///////////////////////////////////

	@Override
	public List<Tip_commentVO> listReply(Tip_commentVO vo) throws Exception {
		return tcdao.listReply(vo);
	}

	@Override
	public int insertReply(Tip_commentVO vo) throws Exception {
		return tcdao.insertReply(vo);
	}

	@Override
	public int updateReply(Tip_commentVO vo) throws Exception {
		return tcdao.updateReply(vo);
	}

	@Override
	public int deleteReply(int t_c_cno) throws Exception {
		return tcdao.deleteReply(t_c_cno);
	}
	
	// 평균 평점
	@Override
	public int avgRating(int t_c_rating) throws Exception {
		return tcdao.avgRating(t_c_rating);
	}
	
	
	/////////////////////////////////// 레시피 댓글 //////////////////////////////////
	

	@Override
	public List<Recipe_commentVO> rlistReply(Recipe_commentVO vo) throws Exception {
		return tcdao.rlistReply(vo);
	}

	@Override
	public int rinsertReply(Recipe_commentVO vo) throws Exception {
		return tcdao.rinsertReply(vo);
	}

	@Override
	public int rupdateReply(Recipe_commentVO vo) throws Exception {
		return tcdao.rupdateReply(vo);
	}

	@Override
	public int rdeleteReply(int r_c_cno) throws Exception {
		return tcdao.rdeleteReply(r_c_cno);
	}
	
	
	
	

	

}
