package com.luvit.controller;

import java.sql.Array;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;
import com.luvit.domain.Recipe_reviewPage;
import com.luvit.domain.Recipe_reviewVO;
import com.luvit.service.FridgeService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/recipe/*") // 모든주소 맵핑
public class FridgeController {


    // 서비스 처리 객체를 주입(DI)
    @Inject
    private FridgeService service;

    private static final Logger logger = LoggerFactory.getLogger(FridgeController.class);


    @ResponseBody
    @RequestMapping(value = "/searchIngreds", method = RequestMethod.GET)
    public List<FridgeVO> searchIngreds(@RequestParam("data") String column) {
        List list = null;
        switch (column) {
            case "1":
                column = "grain";
                break;
            case "2":
                column = "meat";
                break;
            case "3":
                column = "fish";
                break;
            case "4":
                column = "veg";
                break;
            case "5":
                column = "bread";
                break;
            case "6":
                column = "fruit";
                break;
            case "7":
                column = "dairy";
                break;
            case "8":
                column = "nuts";
                break;
            case "9":
                column = "spice";
                break;
        }
        try {
            list = service.searchFridge(column);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(list);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/choice", produces = "application/text; charset=utf8", method = RequestMethod.GET)
    public String choice(@RequestParam("data") String data) throws Exception {

        return data;
    }

    @RequestMapping(value = "/getRecipe", method = RequestMethod.GET)
    public void selectResult(HttpServletRequest request, Model model) throws Exception {
    	
        String[] result = request.getParameterValues("result");

        List list = new ArrayList();

        for(int i =0; i<result.length; i++){
            list.add(result[i]);
        }

        List searchRecipe = service.searchRecipe(list);
        model.addAttribute("searchRecipe", searchRecipe);
        
     // 랜덤 썸네일 이미지 출력용 랜덤함수
		Random random = new Random();
		int randomNum = random.nextInt(4)+1;
		model.addAttribute("random", randomNum);


    }

}
