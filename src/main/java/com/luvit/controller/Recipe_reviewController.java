package com.luvit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.Random;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.luvit.domain.Recipe_reviewVO;
import com.luvit.domain.Recipe_reviewPage;
import com.luvit.domain.UserVO;
import com.luvit.service.Recipe_reviewService;
import com.luvit.service.UserService;
import com.luvit.utils.SearchCriteria;

@Controller
@RequestMapping("/Recipe_review/*")
public class Recipe_reviewController {
	
	// 서비스 처리 객체를 주입(DI)
	@Inject
	Recipe_reviewService service;
	
	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(Recipe_reviewController.class);
	
	// 레시피_리뷰 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Recipe_reviewVO vo, Model model) throws Exception {
		List<Recipe_reviewVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
		// 랜덤 썸네일 이미지 출력용 랜덤함수
		Random random = new Random();
		int randomNum = random.nextInt(4)+1;
		model.addAttribute("random", randomNum);
	}
	
	// 레시피_리뷰 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(Recipe_reviewVO vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		// 로그인 한 아이디만 글 쓸 수 있도록 처리 
		String id = (String)session.getAttribute("id");
		UserVO user = null;
		user = userService.readMember(id);
		model.addAttribute("user", user);
		return "/Recipe_review/write";
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(Recipe_reviewVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		String pathImg=vo.getR_r_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setR_r_file(resultTwoPath[0]);
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setR_r_thumbnail(thumbName);
		}else {// 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setR_r_file(defaultImg);
			vo.setR_r_thumbnail(defaultImg);
		}
		service.write(vo);
		rttr.addFlashAttribute("msg","성공");
		return "redirect:/Recipe_review/listPageSearch?num=1";
	}
	
	// 레시피_리뷰 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("r_r_bno") int r_r_bno, Model model) throws Exception {
		Recipe_reviewVO vo = service.view(r_r_bno);
		model.addAttribute("view", vo);
	}
	
	// 레시피_리뷰 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify(@RequestParam("r_r_bno") int r_r_bno, Model model) throws Exception {
		Recipe_reviewVO vo = service.view(r_r_bno);
		model.addAttribute("view", vo);
		return "/Recipe_review/modify";
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(Recipe_reviewVO vo) throws Exception {
		String pathImg=vo.getR_r_content();
		if(pathImg.indexOf("src=")!=-1) { // content영역에  "src=" 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setR_r_file(resultTwoPath[0]);
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setR_r_thumbnail(thumbName);
		}else {// 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
			String defaultImg = "defaultImg.jpg";
			vo.setR_r_file(defaultImg);
			vo.setR_r_thumbnail(defaultImg);
		}
		service.modify(vo);
		return "redirect:/Recipe_review/view?r_r_bno=" + vo.getR_r_bno();
	}
	
	// 레시피_리뷰 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("r_r_bno") int r_r_bno) throws Exception {
		service.delete(r_r_bno);  
		return "redirect:/Recipe_review/listPageSearch?num=1";
	}
	
	// 레시피_리뷰 목록 + 페이징 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch (Model model,
			@RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "r_r_subject") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<Recipe_reviewVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		// 랜덤 썸네일 이미지 출력용 랜덤함수
		Random random = new Random();
		int randomNum = random.nextInt(4)+1;
		model.addAttribute("random", randomNum);
	}
}
