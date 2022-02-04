package com.luvit.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;

@Repository
public class FridgeDAOImpl implements FridgeDAO {

	// DAO 동작

	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlSession;
	// -> Mapper가 있는 위치까지 접근

	// Mapper를 구분하는 값
	private static final String namespace = "com.luvit.mapper.FridgeMapper";

	@Override
	public List<FridgeVO> searchFridge(String column) throws Exception {

		return sqlSession.selectList(namespace + ".searchFridge", column);
	}

	@Override
	public List<RecipeVO> searchRecipe(List list) throws Exception {
		System.out.println("dao list >>>>" + list);
		List<RecipeVO> result = sqlSession.selectList(namespace + ".searchRecipe", list);
		System.out.println("dao result >>>>" + result);

		return result;
	}


}
