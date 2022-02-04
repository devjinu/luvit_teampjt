package com.luvit.persistence;

import java.util.List;

import org.springframework.ui.Model;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;

public interface FridgeDAO {
	
	// 냉장고 리스트
    List<FridgeVO> searchFridge(String column) throws Exception;
    
    // 검색된 레시피가져오기
    List<RecipeVO> searchRecipe(List<RecipeVO> list) throws Exception;
	

}
