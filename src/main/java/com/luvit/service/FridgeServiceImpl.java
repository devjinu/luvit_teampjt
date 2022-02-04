package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;
import com.luvit.persistence.FridgeDAO;

@Service
public class FridgeServiceImpl implements FridgeService {
	
	@Inject
	private FridgeDAO fdao;

	@Override
	public List<FridgeVO> searchFridge(String column) throws Exception {

		return fdao.searchFridge(column);
	}
	
	@Override

	public List<RecipeVO> searchRecipe(List list) throws Exception {

		System.out.println("service list >>>>"+list);
		List<RecipeVO> result2 = fdao.searchRecipe(list);
		System.out.println("service result>>>>"+result2);

		return result2;
	}


	
	
	

}
