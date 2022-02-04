package com.luvit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luvit.domain.UserVO;
import com.luvit.service.RecipeService;
import com.luvit.service.UserService;

/**
 * Handles requests for the application home page.
 */
// test
@Controller
public class HomeController {
	@Inject
	private RecipeService service;
	
	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) throws Exception {
		logger.info("Welcome home!");
		int hopeAmount = 6;
		// 출력하고 싶은 레시피 갯수
		model.addAttribute("rvo", service.readRecipeAmount(hopeAmount));

		String id = (String)session.getAttribute("id");
		logger.info("받아온 아이디:"+id);
		UserVO user = null;
		try {
			
			user = userService.readMember(id);
			model.addAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home";
	}
	
}
