package com.luvit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luvit.domain.Recipe_review_commentVO;
import com.luvit.service.Recipe_review_commentService;


@Controller
@RequestMapping(value = "/rcomment")
public class Recipe_review_commentController {

	// 서비스 처리 객체를 주입(DI)
	@Inject
	private Recipe_review_commentService service;

	private static final Logger logger 
		= LoggerFactory.getLogger(Recipe_review_commentController.class);


	@RequestMapping(value = "/rlist") //댓글 리스트
	@ResponseBody
	private List<Recipe_review_commentVO> listComment(Recipe_review_commentVO vo, Model model) throws Exception{
		
	    return service.listComment(vo);
	}
	
	@RequestMapping(value = "/rinsert") //댓글 작성 
	@ResponseBody
	private int insertComment(@RequestParam int r_r_c_bno, 
							  @RequestParam String r_r_c_content, 
							  @RequestParam String r_r_c_nickname ) throws Exception{
	            
		Recipe_review_commentVO vo = new Recipe_review_commentVO();
    	vo.setR_r_c_bno(r_r_c_bno);
    	vo.setR_r_c_content(r_r_c_content);
    	vo.setR_r_c_nickname(r_r_c_nickname);
    	
       return service.insertComment(vo);
	}
	
	@RequestMapping("/rupdate") //댓글 수정  
	@ResponseBody
	private int updateComment(Recipe_review_commentVO vo) throws Exception{
	    
	           
	    return service.updateComment(vo);
	}
	
	@RequestMapping(value = "/rdelete/{r_r_c_cno}")
	@ResponseBody
	private int deleteComment(@PathVariable int r_r_c_cno) throws Exception{
	    
	    return service.deleteComment(r_r_c_cno);
	}

}