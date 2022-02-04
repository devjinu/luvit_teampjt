package com.luvit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;


import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
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

import com.luvit.domain.FridgeVO;
import com.luvit.domain.RecipeVO;
import com.luvit.domain.Recipe_reviewPage;
import com.luvit.domain.UserVO;
import com.luvit.service.FridgeService;
import com.luvit.service.RecipeService;
import com.luvit.service.UserService;
import com.luvit.utils.SearchCriteria;


@Controller
@RequestMapping(value="/recipe/*")
public class RecipeController {
	// ******************* 서비스 처리 객체 주입
	@Inject
	private RecipeService service;
	
	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);
	
	//http://localhost:8088/recipe/create
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String recipeCreateGET(RecipeVO vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("컨트롤러: /recipe/create - GET");
		logger.info("컨트롤러: 레시피 쓰기 페이지로 이동");
		// 로그인 한 아이디만 글 쓸 수 있도록 처리 
		String id = (String)session.getAttribute("id");
		logger.info("@@@@@@@@@@@@세션에서 넘어온 아이디:"+id);
	
//		if(id==null) {
//			rttr.addFlashAttribute("msg","IdNull");
//			return "redirect:/user/login";
//		}
		
		// 세션에서 넘어온 아이디값 vo에 넣기 
//		session.setAttribute("id", vo.getR_id());
		
		UserVO user = null;
		user = userService.readMember(id);
		model.addAttribute("user", user);
		
		
		
		return "/recipe/recipeCreate";
	}
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public String recipeCreatePOST(RecipeVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		logger.info("컨트롤러: /recipe/create - POST");
		logger.info("컨트롤러: 글쓰기 완료 후 뷰페이지로 이동");

		
		String pathImg=vo.getR_content();
		
		if(pathImg.indexOf("src=")!=-1) { // content 영역에 'src=' 가 포함되어 있을 경우  
			
            logger.info("이미지가 존재함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            String[] result = pathImg.split("upload/");
    		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@이미지 스플릿0"+result[0]);
    		String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setR_file(resultTwoPath[0]);
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setR_thumbnail(thumbName);
			
			logger.info("작성글내용 파싱1:"+resultTwoPath[0]);
			logger.info("작성글내용:"+vo);
			
        }else { // 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
        	String defaultImg = "defaultImg.jpg"; 
			vo.setR_file(defaultImg);
			vo.setR_thumbnail(defaultImg);
        	
        }
		

		service.create(vo);		
		
		rttr.addFlashAttribute("msg","성공");
		return "redirect:/recipe/recipeListSearch?num=1";
	}

	
	// 레시피 조회
	@RequestMapping(value="/recipeDetail", method=RequestMethod.GET)
	public void detailGET(@RequestParam("r_bno") int r_bno, Model model)throws Exception{		
		// 배열에 저장되어 있는 정보들 잘라서 뿌려주기
		String[] tagList1 = service.readTag(r_bno).getR_tag1().split(",");
		model.addAttribute("tag1", tagList1);
		
		String[] tagList2 = service.readTag(r_bno).getR_tag2().split(",");
		model.addAttribute("tag2", tagList2);
		
		String[] tagList3 = service.readTag(r_bno).getR_tag3().split(",");
		model.addAttribute("tag3", tagList3);
		
		String[] tagList4 = service.readTag(r_bno).getR_tag4().split(",");
		model.addAttribute("tag4", tagList4);		
		
		logger.info("글번호 "+r_bno+"의 상세내용 페이지 보기");
		model.addAttribute("rvo", service.read(r_bno));
		
	}
	
	// 레시피 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("r_bno") int r_bno, Model model)throws Exception {
		logger.info("컨트롤러: 레시피 수정 요청을 받았습니다.");
		RecipeVO vo = service.read(r_bno);
		model.addAttribute("rvo", vo);
		return "/recipe/recipeModify";
	}
	
	// 레시피 수정 - PRO
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(RecipeVO vo)throws Exception{
		
		String pathImg=vo.getR_content();
		
		if(pathImg.indexOf("src=")!=-1) { // content 영역에 'src=' 가 포함되어 있을 경우
			String[] result = pathImg.split("upload/");
			String resultTwo = result[1];
			String[] resultTwoPath = resultTwo.split("\" title");
			// 여기에서 r_content 안의 img를 split이나 substring으로 꺼내서
			// vo.setR_file(r_file) 안에 넣어주면 vo에 들어감. 
			vo.setR_file(resultTwoPath[0]);
			
			// 썸네일은 thumbnail.파일명 으로 저장되게 해뒀으므로
			String thumbName = "thumbnail."+resultTwoPath[0];
			vo.setR_thumbnail(thumbName);
		
			logger.info("수정글내용 파싱1:"+resultTwoPath[0]);
			logger.info("수정글내용:"+vo);
		}else { // 컨텐츠에 이미지가 없을 경우 미리 지정해 둔 이미지를 썸네일로 사용
        	String defaultImg = "defaultImg.jpg"; 
			vo.setR_file(defaultImg);
			vo.setR_thumbnail(defaultImg);
        	
        }
		service.update(vo);
		logger.info("레시피 수정동작@@@@@@@@@@@@@@@@"+vo);
		return "redirect:/recipe/recipeDetail?r_bno="+vo.getR_bno();
	}
	
	// 레시피 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("r_bno") int r_bno)throws Exception{
		service.delete(r_bno);
		return "redirect:/recipe/recipeListSearch?num=1";
	}
	
	// 레시피 목록 + 페이징 추가(+ 베스트 태그 뿌리기)
	@RequestMapping(value="/recipeList", method = RequestMethod.GET)
	public void listPageGET(Model model, @RequestParam("num") int num) throws Exception{
		logger.info("컨트롤러: 페이징 처리가 끝난 레시피 목록 조회");
		// 게시물 총 갯수
		//int count = service.count();		
		
		// 한 페이지에 출력할 게시물 갯수
		//int postNum = 9;
		
		// 하단 페이징 번호([게시물 총 갯수/한페이지에 출력할 갯수]의 올림)
		//int pageNum = (int)Math.ceil((double)count/postNum);
		
		// 출력할 게시물
		//int displayPost = (num - 1) * postNum;
		
		// 한 번에 표시할 페이지 번호 갯수
		//int pageNum_cnt = 10;
		
		// 표시되는 페이지 번호 중 마지막 번호
		//int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		// 마지막 페이지 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의 갯수)) * 한번에 표시할 페이지 번호의 갯수
		
		// 표시되는 페이지 번호 중 첫번째 번호
		//int startPageNum = endPageNum - (pageNum_cnt - 1);
		// 마지막 페이지 번호에서 한번에 표시할 번호의 갯수를 빼면,
		// 마지막 페이지 번호가 50일 경우 40
		// 여기에 1을 더하면 각 페이지의 시작 번호
		// 시작 페이지 번호  = 마지막 페이지 번호 - 한번에 표시할 페이지 번호의 갯수 + 1
		
		// 마지막 번호 재계산
		//int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		 
		//if(endPageNum > endPageNum_tmp) {
		// endPageNum = endPageNum_tmp;
		//}
		
		//List<RecipeVO> list = null;
		//list = service.listPage(displayPost, postNum);
		
		//model.addAttribute("rvo", list);
		//model.addAttribute("pageNum",pageNum);
		
		//boolean prev = startPageNum == 1 ? false : true;
		//boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		// 시작 및 끝 번호
		//model.addAttribute("startPageNum", startPageNum);
		//model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		//model.addAttribute("prev", prev);
		//model.addAttribute("next", next);
		
		// ******** 페이징 처리
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		page.setCount(service.count());
		List<RecipeVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		model.addAttribute("list", list);
		
		/*
		model.addAttribute("pageNum", page.getPageNum());
		
		model.addAttribute("startPageNum", page.getStartPageNum());
		model.addAttribute("endPageNum", page.getEndPageNum());
		
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next",page.getNext());
		
		이 코드 전체를 아래 코드로 받아감
		*/
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		// 랜덤 썸네일 이미지 출력용 랜덤함수
		Random random = new Random();
		int randomNum = random.nextInt(4)+1;
		model.addAttribute("random", randomNum);
		
		// 각 컬럼에 해당하는 베스트 태그 출력
		String bestTag2 = service.bestTag2();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그:"+bestTag2);
		model.addAttribute("bestTag2", bestTag2);
		
	}
	// 레시피 목록 + 페이징 추가(+ 베스트 태그 뿌리기) + 검색
	@RequestMapping(value="/recipeListSearch", method = RequestMethod.GET)
	public void recipeListSearchGET(Model model, @RequestParam(value = "num", required=false, defaultValue="1" ) int num,
			@RequestParam(value="searchType",required=false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword",required=false, defaultValue="") String keyword) throws Exception{
		logger.info("컨트롤러: 페이징 처리가 끝난 레시피 목록 조회");
		
		// ******** 페이징 처리
		Recipe_reviewPage page = new Recipe_reviewPage();
		page.setNum(num);
		// page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<RecipeVO> list = null;
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list", list);
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		// 랜덤 썸네일 이미지 출력용 랜덤함수
		Random random = new Random();
		int randomNum = random.nextInt(4)+1;
		model.addAttribute("random", randomNum);
		
		// 각 컬럼에 해당하는 베스트 태그 출력
		String bestTag2 = service.bestTag2();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그2:"+bestTag2);
		model.addAttribute("bestTag2", bestTag2);
		
		String bestTag3 = service.bestTag3();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그3:"+bestTag3);
		model.addAttribute("bestTag3", bestTag3);
		
		String bestTag4 = service.bestTag4();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그4:"+bestTag4);
		model.addAttribute("bestTag4", bestTag4);
		
	}
	
	// 선택한 태그가 포함되어 있는 글 목록 출력 + 페이징 처리 
		@RequestMapping(value ="/search", method=RequestMethod.GET)
		public void tagSearchGET(Model model, @RequestParam("tag") String tag, @RequestParam("num") int num) {
			
			logger.info("태그가 포함된 글 찾기");
			logger.info(tag+":태그는 이거");
			
			try {
				
				// ******** 페이징 처리
				Recipe_reviewPage page = new Recipe_reviewPage();
				page.setNum(num);
				page.setCount(service.tagCount(tag)); // 이 태그가 포함된 게시물 갯수 
				List<RecipeVO> list = null;
				// 검색 결과에 따른 리스트 출력
				list = service.tagResult(tag, page.getDisplayPost(), page.getPostNum());
				model.addAttribute("list", list);
				model.addAttribute("page", page);
				model.addAttribute("select", num);

				// 랜덤 썸네일 이미지 출력용 랜덤함수
				Random random = new Random();
				int randomNum = random.nextInt(4)+1;
				model.addAttribute("random", randomNum);
				
				// 검색어 전달
				model.addAttribute("tag", tag);
				
				// 각 컬럼에 해당하는 베스트 태그 출력
				String bestTag2 = service.bestTag2();
				logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그2:"+bestTag2);
				model.addAttribute("bestTag2", bestTag2);
				
				String bestTag3 = service.bestTag3();
				logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그3:"+bestTag3);
				model.addAttribute("bestTag3", bestTag3);
				
				String bestTag4 = service.bestTag4();
				logger.info("@@@@@@@@@@@@@@@@@@@@@@베스트 태그4:"+bestTag4);
				model.addAttribute("bestTag4", bestTag4);

				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		
}
