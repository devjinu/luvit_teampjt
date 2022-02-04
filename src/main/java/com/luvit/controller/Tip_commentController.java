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

import com.luvit.domain.Recipe_commentVO;
import com.luvit.domain.Tip_commentVO;
import com.luvit.service.Tip_commentService;


@Controller
@RequestMapping(value = "/comment")
public class Tip_commentController {
	
	// 서비스 처리 객체를 주입(DI)
		@Inject
		private Tip_commentService service;

		private static final Logger logger 
			= LoggerFactory.getLogger(Tip_commentController.class);
	
		
		////////////////////////////////팁 댓글////////////////////////////////////////
		
	@RequestMapping(value = "/list") //댓글 리스트
    @ResponseBody
    private List<Tip_commentVO> listReply(Tip_commentVO vo, Model model) throws Exception{
    	
//		int avg = service.avgRating(t_c_rating);
//		
//		System.out.println("@@@@@@@@@@@@avg : " + avg);
    	
        return service.listReply(vo);
    }
    
    @RequestMapping(value = "/insert") //댓글 작성 
    @ResponseBody
    private int insertReply(@RequestParam int t_c_bno, 
    						@RequestParam String t_c_content, 
    						@RequestParam String t_c_nickname,
    						@RequestParam int t_c_rating) throws Exception{
        
    	Tip_commentVO vo = new Tip_commentVO();
    	vo.setT_c_bno(t_c_bno);
    	vo.setT_c_content(t_c_content);
    	vo.setT_c_nickname(t_c_nickname);
    	vo.setT_c_rating(t_c_rating);
    	
//    	int avg = service.avgRating(t_c_rating);
//
//    	System.out.println("@@@@@@@@@@@@avg : " + avg);
    	
       return service.insertReply(vo);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int updateReply(Tip_commentVO vo) throws Exception{
        
               
        return service.updateReply(vo);
    }
    
    @RequestMapping(value = "/delete/{t_c_cno}")
    @ResponseBody
    private int deleteReply(@PathVariable int t_c_cno) throws Exception{
        
        return service.deleteReply(t_c_cno);
    }
    
    //////////////////////////////레시피댓글////////////////////////////////////////
    
    @RequestMapping(value = "/rlist") //댓글 리스트
    @ResponseBody
    private List<Recipe_commentVO> rlistReply(Recipe_commentVO vo, Model model) throws Exception{
    	
        return service.rlistReply(vo);
    }
    
    @RequestMapping(value = "/rinsert") //댓글 작성 
    @ResponseBody
    private int rinsertReply(@RequestParam int r_c_bno, 
    						@RequestParam String r_c_content, 
    						@RequestParam String r_c_nickname,
    						@RequestParam int r_c_rating) throws Exception{
        
    	Recipe_commentVO vo = new Recipe_commentVO();
    	vo.setR_c_bno(r_c_bno);
    	vo.setR_c_content(r_c_content);
    	vo.setR_c_nickname(r_c_nickname);
    	vo.setR_c_rating(r_c_rating);
    	
       return service.rinsertReply(vo);
    }
    
    @RequestMapping("/rupdate") //댓글 수정  
    @ResponseBody
    private int rupdateReply(Recipe_commentVO vo) throws Exception{
        
               
        return service.rupdateReply(vo);
    }
    
    @RequestMapping(value = "/rdelete/{r_c_cno}")
    @ResponseBody
    private int rdeleteReply(@PathVariable int r_c_cno) throws Exception{
        
        return service.rdeleteReply(r_c_cno);
    }
    
}
