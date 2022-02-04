package com.luvit.controller;

import com.luvit.domain.DownloadView;
import com.luvit.domain.QnaVO;
import com.luvit.service.QnaService;
import com.luvit.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;


@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	//  서비스 처리 객체를 주입(DI)
	@Inject
	private QnaService service;
	
	@Inject
	private UserService userservice;
	
	private static final Logger logger =
			LoggerFactory.getLogger(QnaController.class);
	
	// http://localhost:8088/qna/insert
	// 게시판 글올리기 처리 동작
	@RequestMapping(value ="/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		
		logger.info("C: 게시판 페이지(정보입력)");
		logger.info("C : /qna/insert -> qna/insertBoard.jsp 페이지 이동");
        
		return "/qna/insertBoard";
	}
	
	// http://localhost:8088/qna/insert
	@RequestMapping(value ="/insert", method = RequestMethod.POST )
	public String insertPOST(QnaVO vo) throws Exception {
		
		logger.info("C: 게시판 글쓰기 처리 페이지 ");
		logger.info("C: /qna/insertBoard.jsp -> 처리");
		
		// 0. 한글처리 (web.xml) 
		// 1. 전달되는 정보 저장하기(파라미터값)
		logger.info("C : "+vo);
		
		// 2. 서비스 객체 생성(의존주입)
		// 3. 서비스 게시판 글쓰기 동작 호출
		service.insertBoard(vo);
		
		logger.info("C : 게시판 글올리기 완료!");
		
		return "redirect:/qna/listpage";
	}


	
	
	// http://localhost:8088/qna/finsert
	// 게시판 글올리기 처리 동작
	@RequestMapping(value ="/finsert", method = RequestMethod.GET)
	public String finsertGET() throws Exception {
		
		logger.info("C: 게시판 페이지(정보입력)");
		logger.info("C : /qna/insert -> qna/finsertBoard.jsp 페이지 이동");
        
		return "/qna/finsertBoard";
	}
	
	// http://localhost:8088/qna/listpage
	// http://localhost:8088/qna/finsert
	// 파일 업로드 처리 
	@RequestMapping(value ="/finsert", method = RequestMethod.POST )
	public String finsertPOST(QnaVO vo, @RequestParam("uploadFile") MultipartFile q_file, MultipartHttpServletRequest request) throws Exception {
	
		logger.info("C: 게시판 파일업로드 글쓰기 처리 페이지 ");
		logger.info("C: /qna/finsertBoard.jsp -> 처리");
	
		//q_file = (MultipartFile)vo.getQ_file();
		String fileName = null;
		
		// 파일 업로드 처리 참고 싸이트 
		// https://ming9mon.tistory.com/66
        // https://okky.kr/article/482386
		MultipartFile uploadFile = vo.getUploadFile();
		
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
						
			/*
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			*/
			String path2 = request.getSession().getServletContext().getRealPath("resources/upload/");
			fileName = originalFileName;
			
		//	uploadFile.transferTo(new File("C:\\upfile\\" + fileName));
			uploadFile.transferTo(new File(path2 + fileName));
		}
		vo.setQ_file(fileName);
		
		// 0. 한글처리 (web.xml) 
		// 1. 전달되는 정보 저장하기(파라미터값)
		logger.info("C : "+vo);
		
		// 2. 서비스 객체 생성(의존주입)
		// 3. 서비스 게시판 글쓰기 동작 호출
		service.insertBoard(vo);
		
		logger.info("C : 게시판 파일업로드 글올리기 완료!");
		
		return "redirect:/qna/listpage";
	}	
	
	// http://localhost:8088/qna/listpage	
	// 파일 다운로드 처리 
	// 추가 class : domain -> DownloadView
	@RequestMapping(value ="/file_down", method = RequestMethod.GET)
	public void  file_downGET(@RequestParam("file_name") String  file_name , HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		logger.info("C: 게시판 파일 다운로드 받기 (정보입력)");
		
		logger.info("C: file_name : "+ file_name);

		// 참고 싸이트 https://happy-hs.tistory.com/23
		
		try {
			DownloadView fileDown = new DownloadView(); //파일다운로드 객체생성
			String path = req.getSession().getServletContext().getRealPath("resources/upload/");
			fileDown.filDown(req, res, path + "/" , file_name, file_name); //파일다운로드 
			//fileDown.filDown(req, res, "C:\\upfile\\" + "/" , file_name, file_name); //파일다운로드 

			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString());
		}
	}	
	
	// http://localhost:8088/qna/main
	// main 페이지 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainGET() throws Exception {
		
		logger.info("C : 메인 페이지");
		logger.info("C : /qna/main -> /qna/main.jsp 이동");
		
	}
	
	// http://localhost:8088/qna/update
	@RequestMapping(value ="/update", method = RequestMethod.GET)
	public String updateGET(Model model, int q_bno, @ModelAttribute("pageNum") String pageNum) throws Exception {
		
		logger.info("C: updateGET() 호출");
		logger.info("C: /update -> (GET)");
		
		// 뷰 페이지로 전달 
		QnaVO vo = service.getBoard(q_bno);
		
		// 정보 저장후 페이지 이동 
		model.addAttribute("qnaVO", vo);
		model.addAttribute("pageNum", pageNum);
		
		return "/qna/updateBoard";
	}
	
	// 회원 정보 수정 처리(update)
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public String updatePOST(QnaVO vo, @ModelAttribute("pageNum") String pageNum, Model model) throws Exception {
		
		logger.info("C: updatePOST() 호출");
		logger.info("C: /updateBoard.jsp -> /main");
		
		// 1. 전달된 파라미터값 저장 
		logger.info("C: 수정할 정보 -> "+vo);
		// 2. 정보를 가지고 수정하기 위해 이동 (서비스 객체)
		// 3. 서비스 -> DAO 호출 -> Mapper 호출
		
		String q_pw = service.updateCheck(vo);
		
		String result = null;
		
		if(vo.getQ_pw().equals(q_pw)) {
			service.updateBoard(vo);
			logger.info("C : 정보 수정 완료!");
			// 4. 정보수정 완료 후 메인페이지 이동 
			
			result = "redirect:/qna/listpage";
		} else {
			model.addAttribute("updateCheck", 1);
			result = "/qna/updateBoard";
		}
			
		return result;
	}
	
	
	// http://localhost:8088/qna/delete
	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public String deleteGET(Model model, int q_bno,@ModelAttribute("pageNum") String pageNum) throws Exception {
		
		logger.info("C: deleteGET() 호출");
		logger.info("C: /delete -> (GET)");

		// 뷰 페이지로 전달 
		QnaVO vo = service.getBoard(q_bno);
		
		// 정보 저장후 페이지 이동 
		model.addAttribute("qnaVO", vo);
		model.addAttribute("pageNum", pageNum);
		
		return "/qna/deleteBoard";
	}	
	
	// 글정보 삭제 처리(delete)
	@RequestMapping(value ="/delete", method = RequestMethod.POST)
	public String deletePOST(QnaVO vo, @ModelAttribute("pageNum") String pageNum, Model model) throws Exception {
		
		logger.info("C: deletePOST() 호출");
		logger.info("C: /deleteBoard.jsp -> /main");
		
		// 1. 전달된 파라미터값 저장 
		logger.info("C: 삭제할 정보 -> "+vo);
		// 2. 정보를 가지고 삭제하기 위해 이동 (서비스 객체)
		// 3. 서비스 -> DAO 호출 -> Mapper 호출
		
		String q_pw = service.deleteCheck(vo);
		
		String result = null;
		
		if( vo.getQ_pw().equals(q_pw)) {
			service.deleteBoard(vo);
			logger.info("C : 정보 삭제 완료!");
			// 4. 정보수정 완료 후 메인페이지 이동 
			
			result = "redirect:/qna/listpage";	
		} else {
			model.addAttribute("deleteCheck", 1);
			result = "/qna/deleteBoard";
		}
		
		return result;
	}	
	
	// 게시판 정보 리스트(GET)
	// http://localhost:8088/qna/list
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String listGET(Model model) throws Exception {
		// 관리자만 사용기능
		// 1. 관리자 세션 제어 
		// 2. 서비스 - 회원 목록 가져오는 동작 
		// 3. 정보 저장 -> 뷰(/member/memberlist.jsp) 
		//  (Model 객체 ) 
		
		// 2. 서비스 - 회원 목록 가져오는 동작
		List<QnaVO> boardList = service.getBoardList();
		
		logger.info("C : " + boardList);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		model.addAttribute("boardList", boardList);
		
		return "/qna/listBoard";
	}	
	
	// http://localhost:8088/qna/listpage
	@RequestMapping(value ="/listpage", method = RequestMethod.GET)
	public String listpageGET(HttpSession session, Model model, @RequestParam(value="pageNum", required=false) String pageNum) throws Exception {
		
		String id = (String)session.getAttribute("id");
		
		//id= "admin1";
		
		int pageSize = 5;  
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
	    // 시작 행번호 계산 1...10 / 11...20 / 21...30 / 31...40
	    int currentPage = Integer.parseInt(pageNum);
	    
	    int startRow = (currentPage-1) * pageSize + 1;
	    
	    // 끝 행번호 계산 
	    int endRow = currentPage * pageSize;
	    
	    
		int boardCount = service.getBoardCount();
		
    	// 전체 페이지수 - 글 50 / 화면 10씩 출력  => 5페이지 
    	//          - 글 56 / 화면 10씩 출력  => 6페이지		
    	
    	int pageCount = boardCount/pageSize +(boardCount % pageSize == 0 ? 0 : 1);
    	
    	// 한 화면에 보여줄 페이지 번호 개수 
    	int pageBlock = 5;//2, 10;
    	
    	// 페이지 블럭의 시작 페이지 번호  1...10/11...20/21...30/31...40
    	int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
    	
    	// 페이지 블럭의 끝 페이지 번호
    	int endPage = startPage + pageBlock-1;
    	
    	if(endPage > pageCount) {
    		endPage = pageCount;
    	}	    
	    
	    // 페이징 처리 **************************************************************		
    	List<QnaVO> boardList = null;
    	
    	if( boardCount > 0) {
    		// 2. 서비스 - 회원 목록 가져오는 동작
    		if(id != null) {
        		if(id.equals("admin")) {
        			
        			boardList = service.getBoardList(startRow-1, pageSize);  
        		} else if(!id.equals("admin")) {

        			String  check = "0";
        			boardList = service.getBoardList(check, startRow-1, pageSize); 
        		}	
    		} else if(id == null ) {
    			
    			String  check = "0";
    			boardList = service.getBoardList(check, startRow-1, pageSize); 
    		} 
    	}
	
		// 3. 정보저장 -> 뷰 (/qna/listBoardPage.jsp)
		// (Model 객체)
    	
    	int nid = 0;
    	if(id == null) {
    		nid = 0;
    	} else if(id != null) {
    	    nid = 1;	
    	}
    	model.addAttribute("nid", nid);
		model.addAttribute("boardList", boardList);
		
		model.addAttribute("cnt", boardCount);
		
		// 정보 추가 저장 (페이징 처리 필요한 정보)
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "/qna/listBoardPage";
	}	
	
	
	// 게시판 글정보 리스트(GET)
	// http://localhost:8088/qna/board
	@RequestMapping(value ="/board", method = RequestMethod.GET)
	public String boardGET(HttpSession session, Model model, int q_bno, @ModelAttribute("pageNum") String pageNum) throws Exception {

		String id = (String)session.getAttribute("id");
		
		service.updateReadCount(q_bno);
		
		QnaVO board = service.getBoard(q_bno);
		
		String nickname = service.getBoardNickName(q_bno);
		
		String usernickname = userservice.getNickName(id);
		
		int nicknameCheck = 0;
		
		if(id == null) {
			nicknameCheck = 0;
		} else if(id != null ) {
			if(nickname.equals(usernickname) || id.equals("admin")) {
				nicknameCheck = 2;
			} else {
				nicknameCheck = 1;
			}
		}
		
		logger.info("C : " + board);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		
		model.addAttribute("nicknameCheck", nicknameCheck);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		
		return "/qna/board";
	}	
	
	// 게시판 글정보 리스트(GET)
	// http://localhost:8088/qna/count
	@RequestMapping(value ="/count", method = RequestMethod.GET)
	public String countGET(Model model) throws Exception {

		int count = service.getBoardCount();
		
		logger.info("C : " + count);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		model.addAttribute("count", count);
		
		return "/qna/count";
	}	
	
	// test
	// 게시판 글정보 리스트(GET)
	// http://localhost:8088/qna/main
	// http://localhost:8088/qna/nickname
	@RequestMapping(value ="/nickname", method = RequestMethod.GET)
	public String nicknameGET(Model model, int q_bno) throws Exception {


		
		String q_nickname = service.getBoardNickName(q_bno);
		
		logger.info("C : " + q_nickname);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		model.addAttribute("q_nickname", q_nickname);
		
		return "/qna/nickname";
	}
	
	// test
	// 게시판 글정보 리스트(GET)
	// http://localhost:8088/qna/data
	@RequestMapping(value ="/data", method = RequestMethod.GET)
	public String boarddataGET(Model model, int q_bno) throws Exception {

		QnaVO data = service.getBoardData(q_bno);
		
		logger.info("C : " + data);
		
		// 3. 정보저장 -> 뷰 (/member/memberlist.jsp)
		// (Model 객체)
		model.addAttribute("data", data);
		
		return "/qna/data";
	}	
	
	// http://localhost:8088/qna/listpage
	// 게시판 글올리기 처리 동작
	@RequestMapping(value ="/rewrite", method = RequestMethod.GET)
	public String rewrite(Model model, QnaVO vo, @ModelAttribute("pageNum") String pageNum) throws Exception {
		
		logger.info("C: 게시판 페이지(정보입력)");
		logger.info("C : /qna/rewrite -> qna/reWriteBoard.jsp 페이지 이동");
  
		service.reWriteUpdate(vo);
		
		model.addAttribute("rewrite", vo);
		
		return "/qna/rewriteBoard";
	}
	
	// http://localhost:8088/qna/listpage
	@RequestMapping(value ="/rewrite", method = RequestMethod.POST )
	public String rewritePOST(QnaVO vo,  @ModelAttribute("pageNum") String pageNum) throws Exception {
		
		logger.info("C: 게시판 답글쓰기 처리 페이지 ");
		logger.info("C: /qna/reWriteBoard.jsp -> 처리");
		
		// 1. 전달되는 정보 저장하기(파라미터값)
		logger.info("C : "+vo);
		
		// 2. 서비스 객체 생성(의존주입)
		// 3. 서비스 게시판 글쓰기 동작 호출
		service.reWrite(vo);
		
		logger.info("C : 게시판 답글올리기 완료!");
		
		return "redirect:/qna/listpage";
	}	
}
