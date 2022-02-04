package com.luvit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.persistence.Recipe_reviewDAO;
import com.luvit.domain.Recipe_reviewVO;
import com.luvit.domain.Recipe_review_commentVO;

@Service
public class Recipe_reviewServiceImpl implements Recipe_reviewService {

	// DB처리하기위한 객체 주입
	@Inject
	private Recipe_reviewDAO dao;
	
	// 레시피_리뷰 번호
	@Override
	public int cntBno(Recipe_reviewVO vo) throws Exception {
		return dao.cntBno(vo);
	}
	
	// 레시피_리뷰 목록
	@Override
	public List<Recipe_reviewVO> list() throws Exception {
		return dao.list();
	}
	
	// 레시피_리뷰 작성
	@Override
	public void write(Recipe_reviewVO vo) throws Exception {
		dao.write(vo);
	}
	
	// 레시피_리뷰 조회
	@Override
	public Recipe_reviewVO view(int r_r_bno) throws Exception {
		dao.hit(r_r_bno);
		return dao.view(r_r_bno);
	}
	
	// 레시피_리뷰 수정
	@Override
	public void modify(Recipe_reviewVO vo) throws Exception {
		dao.modify(vo);
	}
	
	// 레시피_리뷰 삭제
	public void delete(int r_r_bno) throws Exception {
		dao.delete(r_r_bno);
	}
	
	// 레시피_리뷰 총 수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	// 레시피_리뷰 목록 + 페이징 + 검색
	@Override
	public List<Recipe_reviewVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 레시피_리뷰 총 수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}
}
