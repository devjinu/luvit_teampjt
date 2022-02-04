package com.luvit.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.LikeyVO;
import com.luvit.domain.RlikeyVO;
import com.luvit.domain.TlikeyVO;
import com.luvit.persistence.LikeyDAO;

@Service
public class LikeyServiceImpl implements LikeyService {
	
	// DB처리하기위한 객체 주입
		@Inject
		private LikeyDAO ldao;

		
//		 @Override
//		  public int countbyLike(HashMap hashMap){
//		    int count = ldao.countbyLike(hashMap);
//		    return count;
//		  }
//		  
//		  @Override
//		  public int create(HashMap hashMap){
//		    int count = ldao.create(hashMap);
//		    return count;
//		  }
//		  
//		  @Override
//		  public int like_check(HashMap hashMap) {
//		    int count = ldao.like_check(hashMap);
//		    return count;
//		  }
//
//		  @Override
//		  public int like_check_cancel(HashMap hashMap) {
//		    int count = ldao.like_check_cancel(hashMap);
//		    return count;
//		  }
//		  
//		  @Override
//		  public LikeyVO read(HashMap hashMap) {
//		    LikeyVO vo = ldao.read(hashMap);
//		    return vo;
//		  }
//
//		  @Override
//		  public int deletebyBoardno(int l_t_bno) {
//		    int count = ldao.deletebyBoardno(l_t_bno);
//		    return count;
//		  }
//
//		  @Override
//		  public String deletebyMno(String l_id) {
//		    
//		    return ldao.deletebyMno(l_id);
//		  }
//		
//		


}
