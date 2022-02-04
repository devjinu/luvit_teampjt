package com.luvit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import com.luvit.service.Recipe_reviewService;
import com.luvit.service.Store_reviewService;
import com.luvit.service.TipService;
import com.luvit.service.UserService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	
	@Inject
	private UserService userService;
	
	@Inject
	private RecipeService recipeService;
	
	@Inject
	private Recipe_reviewService RreviewService;
	
	@Inject
	private TipService tipService;
	
	@Inject
	private Store_reviewService SreviewService;
	
	private static final Logger logger =
			LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/main")
	public void myPageGET(Model model) throws Exception{
		
		logger.info("C: 유저 메인페이지 호출");
		Date now = new Date();
		model.addAttribute("now", now);
		
	}
	
	@RequestMapping(value="/boardList")
	public void boardListGET(Model model, HttpSession session, @RequestParam("num") int num, 
			@RequestParam(value="searchType",required=false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword",required=false, defaultValue="") String keyword)throws Exception{
		logger.info("C: 마이페이지>레시피 목록 호출");
		
		String r_id = (String)session.getAttribute("id");
		logger.info("세션에 있는 아이디:"+r_id);
		
		// ******** 페이징 처리
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		page.setCount(recipeService.myBoardAllCount(r_id));
		
						
		List<HashMap<String, Object>> list = recipeService.myBoardAll(r_id, page.getDisplayPost(), page.getPostNum());
		logger.info("해당 아이디의 게시글 전체 출력:"+list);
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("Bno")int bno, @RequestParam("TblName")String TblName)throws Exception{
		logger.info("C: 해당 카테고리의 해당 글번호에 해당하는 글 삭제");

		
		switch (TblName) {
		case "recipe":
			logger.info("recipe 삭제 실행!");
			recipeService.delete(bno);
			break;
			
		case "recipe_review":
			RreviewService.delete(bno);
			break;
			
		case "tip":
			logger.info("tip 삭제 실행!");
			tipService.deleteTip(bno);
			break;
			
		case "store_review":
			SreviewService.deleteReview(bno);
			break;
			
			
		}
		
		logger.info("글 삭제처리 완료!");
		return "redirect:/mypage/boardList?num=1";
	}
	
	
}
