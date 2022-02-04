package com.luvit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luvit.service.UserService;


@Controller
@RequestMapping(value="/include/*")
public class IncludeController {
private static final Logger logger = LoggerFactory.getLogger(IncludeController.class);
@Inject
UserService userService;

/*
 * @RequestMapping(value="/header", method = RequestMethod.GET) public String
 * headerGET() { logger.info("내용 테스트");
 * 
 * return "/include/header";
 * 
 * }
 */
	
	@RequestMapping(value="/footer", method = RequestMethod.GET)
	public String footerGET() {
		logger.info("푸터 호출했습니다.");
		
		return "/include/footer";
		
	}
	
	@GetMapping("/header")
	public String headerGET(Model model, HttpSession session) {
		logger.info("헤더 호출했습니다.");
		
		return "/include/header";

	}

}
