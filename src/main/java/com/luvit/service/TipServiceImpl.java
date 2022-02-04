package com.luvit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.TipVO;
import com.luvit.domain.Tip_commentVO;
import com.luvit.persistence.TipDAO;

@Service
public class TipServiceImpl implements TipService {

	// DB처리하기위한 객체 주입
	@Inject
	private TipDAO tdao;
	
	// 글번호 계산
	@Override
	public int cntBno(TipVO vo) throws Exception {
		return tdao.cntBno(vo);
	}
	
	
	// 글쓰기
	@Override
	public void insertTip(TipVO vo) throws Exception {
		tdao.insertTip(vo);
	}


	// 글목록
	@Override
	public List<TipVO> listAll() throws Exception {
		return tdao.listAll();
	}

	// 글읽기
	@Override
	public TipVO readTip(int t_bno) throws Exception {
		
		tdao.hitTip(t_bno);
		
		return tdao.readTip(t_bno);
	}

	// 글삭제
	@Override
	public void deleteTip(int t_bno) throws Exception {
		tdao.deleteTip(t_bno);
	}

	// 글수정
	@Override
	public void updateTip(TipVO vo) throws Exception {
		tdao.updateTip(vo);
	}

	// 글 총 갯수
	@Override
	public int count() throws Exception {
		return tdao.count();
	}
	
//	// 글목록 + 페이징
//	@Override
//	public List listPage(int displayPost, int postNum) throws Exception {
//	 return tdao.listPage(displayPost, postNum);
//	}

	// 팁 목록 + 페이징 + 검색
	@Override
	public List<TipVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return tdao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 팁 총 수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return tdao.searchCount(searchType, keyword);
	}

//	// 좋아요
//	@Override
//	public int like_cnt_up(int t_bno) throws Exception {
//		
//		return tdao.like_cnt_up(t_bno);
//	}
//
//	@Override
//	public int like_cnt_down(int t_bno) throws Exception {
//		return tdao.like_cnt_down(t_bno);
//	}
	
	// 평균 평점
	@Override
	public int avgRating(int t_c_rating) throws Exception {
		return tdao.avgRating(t_c_rating);
	}
	

	
	
	
	

}
