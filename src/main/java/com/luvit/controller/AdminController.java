package com.luvit.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luvit.domain.RecipeVO;
import com.luvit.domain.Recipe_reviewPage;
import com.luvit.domain.UserVO;
import com.luvit.service.RecipeService;
import com.luvit.service.UserService;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	@Inject
	private UserService userService;
	
	@Inject
	private RecipeService recipeService;
	
	private static final Logger logger =
			LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/main", method =RequestMethod.GET)
	public void adminMainGET(Model model)throws Exception{
		
		logger.info("C: 어드민 메인페이지 호출");
		Date now = new Date();
		model.addAttribute("now", now);
		
	}
	
	@RequestMapping(value="/userList", method = RequestMethod.GET)
	public void userListGET(Model model, @RequestParam("num") int num, 
			@RequestParam(value="searchType",required=false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword",required=false, defaultValue="") String keyword)throws Exception{
		logger.info("C: 페이징 처리 완료된 회원 목록 조회하기");
		// List<UserVO> list = userService.userList();
		// model.addAttribute("list", list);
		
		// ******** 페이징 처리
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		page.setCount(userService.searchCount(searchType, keyword));
		
		// 검색타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<UserVO> list = null;
		list = userService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list", list);
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
	
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String deleteUserGET(@RequestParam("userNum") int user_num)throws Exception{
		logger.info("C: 유저번호에 해당하는 회원 정보 삭제하기");
		userService.deleteUser(user_num);
		logger.info("C: 글 삭제 처리 완료!");
		return "redirect:/admin/userList?num=1";
	
	}
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public void boardListGET(Model model, @RequestParam("num") int num, 
			@RequestParam(value="searchType",required=false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword",required=false, defaultValue="") String keyword)throws Exception {
		logger.info("C: 게시판 리스트 보여주기");
		
		// ******** 페이징 처리
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		page.setCount(recipeService.searchCount(searchType, keyword));
		
		// 검색타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<RecipeVO> list = null;
		list = recipeService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list", list);
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
	}
	
	@RequestMapping(value="deleteRecipe", method=RequestMethod.GET)
	public String deleteRecipeGET(Model model, @RequestParam("rBno")int r_bno) throws Exception{
		logger.info("C:레시피 번호에 해당하는 레시피 글 삭제하기");
		recipeService.delete(r_bno);
		logger.info("C: 글 삭제처리 완료!");
		return "redirect:/admin/boardList?num=1";
	}

	
	
	
}
