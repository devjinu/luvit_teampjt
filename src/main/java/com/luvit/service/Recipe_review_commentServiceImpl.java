package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.Recipe_review_commentVO;
import com.luvit.persistence.Recipe_review_commentDAO;

@Service
public class Recipe_review_commentServiceImpl implements Recipe_review_commentService {
	
	@Inject
	private Recipe_review_commentDAO rrcdao;

	// 댓글 목록
	@Override
	public List<Recipe_review_commentVO> listComment(Recipe_review_commentVO vo) throws Exception {
		return rrcdao.listComment(vo);
	}

	// 댓글 작성
	@Override
	public int insertComment(Recipe_review_commentVO vo) throws Exception {
		return rrcdao.insertComment(vo);
	}

	// 댓글 수정
	@Override
	public int updateComment(Recipe_review_commentVO vo) throws Exception {
		return rrcdao.updateComment(vo);
	}

	// 댓글 삭제
	@Override
	public int deleteComment(int r_r_c_cno) throws Exception {
		return rrcdao.deleteComment(r_r_c_cno);
	}
}
