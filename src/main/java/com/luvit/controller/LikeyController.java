package com.luvit.controller;


import com.luvit.domain.LikeyVO;
import com.luvit.domain.TipVO;
import com.luvit.service.LikeyService;
import com.luvit.service.TipService;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/likey") // 모든주소 맵핑
public class LikeyController {
	
	@Inject
	private LikeyService service;

	@Inject
	private TipService tservice;
	
	private static final Logger logger 
		= LoggerFactory.getLogger(LikeyController.class);
	
//	@ResponseBody
//	  @RequestMapping(value="/likeyUp", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
//	  public String like(int l_t_bno, HttpSession session) throws Exception{
//	    //System.out.println("--> like() created");
//	    int id = (Integer)session.getAttribute("id");
//	    JSONObject obj = new JSONObject();
//
//	    ArrayList<String> msgs = new ArrayList<String>();
//	    HashMap<String, Object> hashMap = new HashMap<String, Object>();
//	    hashMap.put("boardno", l_t_bno);
//	    hashMap.put("id", id);
//	    LikeyVO likeyvo = service.read(hashMap);
//	    
//	    TipVO tipvo = tservice.readTip(l_t_bno);
//	    int like_cnt = tipvo.getT_like_count();     //게시판의 좋아요 카운트
//	    int like_check = 0;
//	    like_check = likeyvo.getLikey_check();    //좋아요 체크 값
//	    
//	    if(service.countbyLike(hashMap)==0){
//	    	service.create(hashMap);
//	    }
//	      
//	    if(like_check == 0) {
//	      msgs.add("좋아요!");
//	      service.like_check(hashMap);
//	      like_check++;
//	      like_cnt++;
//	      tservice.like_cnt_up(l_t_bno);   //좋아요 갯수 증가
//	    } else {
//	      msgs.add("좋아요 취소");
//	      service.like_check_cancel(hashMap);
//	      like_check--;
//	      like_cnt--;
//	      tservice.like_cnt_down(l_t_bno);   //좋아요 갯수 감소
//	    }
//	    obj.put("bno", likeyvo.getL_t_bno());
//	    obj.put("like_check", like_check);
//	    obj.put("like_cnt", like_cnt);
//	    obj.put("msg", msgs);
//	    
//	    return obj.toString();
//	  }
	

}
