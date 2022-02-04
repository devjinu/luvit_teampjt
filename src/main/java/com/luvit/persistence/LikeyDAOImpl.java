package com.luvit.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.LikeyVO;
import com.luvit.domain.RlikeyVO;
import com.luvit.domain.TlikeyVO;

@Repository
public class LikeyDAOImpl implements LikeyDAO {

	// DAO 동작

	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlSession;
	// -> Mapper가 있는 위치까지 접근

	// Mapper를 구분하는 값
	private static final String namespace = "com.luvit.mapper.LikeyMapper";


//	  @Override
//	  public int countbyLike(HashMap hashMap){
//	    int count = sqlSession.selectOne(namespace+".countbyLike", hashMap);
//	    return count;
//	  }
//	  
//	  @Override
//	  public int create(HashMap hashMap){
//	    int count = sqlSession.insert(namespace+".create", hashMap);
//	    return count;
//	  }
//	  
//	  @Override
//	  public int like_check(HashMap hashMap) {
//	    int count = sqlSession.update(namespace+".like_check", hashMap);
//	    return count;
//	  }
//
//	  @Override
//	  public int like_check_cancel(HashMap hashMap) {
//	    int count = sqlSession.update(namespace+".like_check_cancel", hashMap);
//	    return count;
//	  }
//	  
//	  @Override
//	  public LikeyVO read(HashMap hashMap) {
//	    LikeyVO vo = sqlSession.selectOne(namespace+".read", hashMap);
//	    return vo;
//	  }
//
//	  @Override
//	  public int deletebyBoardno(int l_t_bno) {
//	    int count = sqlSession.delete(namespace+".deletebyBoardno", l_t_bno);
//	    return count;
//	  }
//	  
//	  @Override
//	  public String deletebyMno(String l_id) {
//	    
//	    return sqlSession.delete(namespace+".deletebyMno", l_id);
//	  }

}
