package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;
import com.luvit.persistence.RecipeDAO;

//@Service 해당 클래스를 서비스 객체로 처리하겠다
@Service
public class RecipeServiceImpl implements RecipeService{
	
	// DB 처리하기 위한 객체 주입
	@Inject //의존 주입
	private RecipeDAO rdao;
	
	@Override
	public void create(RecipeVO vo) throws Exception {
		rdao.create(vo);
		
	}

	@Override
	public List<RecipeVO> listAll() throws Exception {
		
		return rdao.listAll();
	}

	@Override
	public RecipeVO read(int r_bno) throws Exception {
		rdao.recipeHit(r_bno); // 조회수 증가
		return rdao.read(r_bno);
	}
	
	@Override
	public RecipeVO readTag(int r_bno) throws Exception {
		return rdao.read(r_bno);
	}
	
	
	@Override
	public void delete(int r_bno) throws Exception {
		rdao.delete(r_bno);
		
	}

	@Override
	public void update(RecipeVO vo) throws Exception {
		rdao.update(vo);
		
	}

	@Override
	public int count() throws Exception {
		return rdao.count();
	}

	@Override
	public List<RecipeVO> listPage(int displayPost, int postNum) throws Exception {
		return rdao.listPage(displayPost, postNum);
	}

	@Override
	public List<RecipeVO> tagResult(String tag, int displayPost, int postNum) throws Exception {
		return rdao.tagResult(tag, displayPost, postNum);
	}

	@Override
	public int tagCount(String tag) throws Exception {
		return rdao.tagCount(tag);
	}

	@Override
	public List<RecipeVO> readRecipeAmount(int hopeAmount) throws Exception {
		return rdao.readRecipeAmount(hopeAmount);
	}

	@Override
	public List<RecipeVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return rdao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return rdao.searchCount(searchType, keyword);
	}

	@Override
	public String bestTag2() throws Exception {

		return rdao.bestTag2();
	}

	@Override
	public String bestTag3() throws Exception {
		return rdao.bestTag3();
	}

	@Override
	public String bestTag4() throws Exception {
		return rdao.bestTag4();
	}

	@Override
	public List<RecipeVO> myBoardList(String r_id) throws Exception {

		System.out.println("서비스에 넘어온 아이디:"+r_id);
		return rdao.myBoardList(r_id);
		
	}

	@Override
	public List myBoardAll(String r_id, int displayPost, int postNum) throws Exception {
		return rdao.myBoardAll(r_id, displayPost, postNum);
	}

	@Override
	public int myBoardAllCount(String r_id) throws Exception {

		return rdao.myBoardAllCount(r_id);
	}


	
}
