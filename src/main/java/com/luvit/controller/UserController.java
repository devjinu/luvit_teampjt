package com.luvit.controller;

import com.luvit.domain.UserVO;
import com.luvit.persistence.UserDAO;
import com.luvit.service.UserService;
import com.luvit.service.UserServiceImpl;
import com.luvit.snslogin.NaverLoginBO;
import com.luvit.snslogin.kakao_restapi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(IncludeController.class);

    UserVO returnVO = null;

    @Inject
    private UserDAO udao;
    @Inject
    private UserService service;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Inject
    BCryptPasswordEncoder pwEncoder;

    /* NaverLoginBO */
    @Inject
    private NaverLoginBO naverLoginBO;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;

    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public void infoGET(HttpSession session, Model model) throws Exception {
        model.addAttribute("mvo", service.readMember((String) session.getAttribute("id")));
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String userMain() throws Exception {

        return "/home";
    }

    @RequestMapping(value = "/user/userList", method = RequestMethod.GET)
    public String userListGET(HttpSession session, Model model) throws Exception {

        if (!session.getAttribute("id").equals("admin")) {
            return "/user/main";
        }

        model.addAttribute("userList", service.userList());
        return "/user/userList";
    }

    @RequestMapping(value = "/searchUser", method = RequestMethod.POST)
    public String searchUserPOST(UserVO vo, Model model) {
//        String[] str1 = vo.getId().split("\"");
//        String str2=vo.getId().replaceAll("\"","");

        try {
            returnVO = service.readMember(vo.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(vo.getId());
        System.out.println(returnVO);
        model.addAttribute("returnvo", returnVO);

        return "/user/userList";
    }

    // 더미 생성 http://localhost:8088/user/dummyGET?char=a
    @RequestMapping(value = "/dummyGET", method = RequestMethod.GET)
    public String dummyGET(HttpServletRequest request) throws Exception {
        final String initChar = request.getParameter("char");

        final UserVO vo = new UserVO();

        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {

                for (int i = 0; i < 100; i++) {

                    String id = initChar + i;
                    String pw = initChar + i;

                    vo.setId(id);
                    vo.setPw(pwEncoder.encode(pw));
                    vo.setEmail(id + pw + i);
                    vo.setNickname(pw + id);
                    service.insertUser(vo);
                }
            }
        });
        t.start();
        return "/user/info";

    }

    // http://localhost:8088/user/insertUser
    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insertUserGET() throws Exception {
        return "/user/insertUserForm";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insertUserPOST(UserVO vo, HttpSession session) throws Exception {
        if (vo.equals(null)) {
            return "redirect:/user/login";
        }
        vo.setPw(pwEncoder.encode(vo.getPw()));
        service.insertUser(vo);

        return "redirect:/user/login";
    }

    @RequestMapping(value = "/snsInsertUser", method = RequestMethod.GET)
    public String snsInsertUserGET() throws Exception {
        return "/user/snsInsertUser";
    }

    @RequestMapping(value = "/snsInsertUser", method = RequestMethod.POST)
    public String snsInsertUserPOST(UserVO vo, HttpSession session) throws Exception {
        logger.info("C: 가입 POST");
        if (vo.equals(null)) {
            return "redirect:/user/login";
            // alert 정상적이지 않은 탈퇴 접근
        }
        vo.setPw(pwEncoder.encode(vo.getPw()));
        service.snsInsertUser(vo);

        return "redirect:/user/main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginGET(HttpSession session) throws Exception {
        logger.info("C : 로그인 GET");

        ModelAndView mav = new ModelAndView();

        /* 구글code 발행 */
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

        /* 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        String kakaoUrl = kakao_restapi.getAuthorizationUrl(session);
        String googleurl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

        /* 생성한 인증 URL을 View로 전달 */
        mav.setViewName("/user/loginForm");

        // 네이버 로그인
        mav.addObject("naver_url", naverAuthUrl);
        // 카카오 로그인
        mav.addObject("kakao_url", kakaoUrl);
        // 구글 로그인
        mav.addObject("google_url", googleurl);

        return mav;

    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    private String loginPOST(UserVO vo, HttpSession session, RedirectAttributes rrtr, HttpServletRequest request, Model model) throws Exception {
        UserVO returnVO2 = service.readMember(vo.getId());

        if (returnVO2==null){
//            return "redirect:/user/login";
            rrtr.addFlashAttribute("result","fail");
            return "redirect:/user/login";
        }
        if (!returnVO2.getId().equals(vo.getId())) {
            rrtr.addFlashAttribute("result","fail");
            return "redirect:/user/login";
        }


        if (pwEncoder.matches(vo.getPw(), returnVO2.getPw())) {
            UserVO returnVO = service.loginMember(returnVO2);
            session.setAttribute("id", returnVO.getId());
            session.setAttribute("nickname", returnVO.getNickname());
            rrtr.addFlashAttribute("mvo", returnVO);
            return "redirect:/";
        } else {
            rrtr.addFlashAttribute("result","fail");
            return "redirect:/user/login";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteUserGET(HttpSession session, Model model, UserVO vo) throws Exception {

        System.out.println("C: deleteUser GET");
        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/user/login";
        }
        model.addAttribute("vo", service.readMember(id));
        return "/user/deleteUserForm";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteUserPOST(HttpSession session, UserVO vo) throws Exception {
        if (session.getAttribute("id").equals(null)) {
            return "redirect:/user/login";
        }

        service.deleteMember(vo);
        session.invalidate();
        return "redirect:/user/main";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateGET(HttpSession session, Model model) {
        String id = (String) session.getAttribute("id");

        if (id.equals(null)) {
            return "redirect:/user/main";
        }

        try {
            UserVO vo = service.readMember(id);
            model.addAttribute("vo", vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/user/updateForm";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(UserVO vo, HttpSession session) {

        service.updateMember(vo);
        session.setAttribute("id", vo.getId());
        session.setAttribute("nickname", vo.getNickname());

        return "/user/main";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutUserGET(HttpSession session) throws Exception {
        String id = (String) session.getAttribute("id");

        session.invalidate();

        return "redirect:/user/main";
    }

    @RequestMapping(value = "/nicknameCheck", method = RequestMethod.POST)
    public String nicknameCheckPOST(@RequestParam("nickname") String nickname, HttpServletResponse response) throws Exception {

        int result = service.nickNameCheck(nickname);

        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();

        return null;
    }

    @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
    public String emailCheckPOST(String email, HttpServletResponse response) throws Exception {

        int result = service.emailCheck(email);
        if (email == "") {
            result = 2;
        }
        if (!email.contains("@") && email.contains(".")) {
            result = 3;
        }

        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();

        return null;
    }

    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public String idCheckPOST(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
        int result = service.idCheck(id);
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(value = "/checkPw", method = RequestMethod.GET)
    public void checkPwGET() throws Exception {

    }

    @RequestMapping(value = "/checkPw", method = RequestMethod.POST)
    public String checkPwPOST(UserVO vo, HttpSession session, @RequestParam("pw") String pw, @RequestParam("id") String id, HttpServletResponse response) throws Exception {
        int result = 0;
        vo.setId(id);
        System.out.println("pw >>>>" + vo.getPw());
        UserVO returnVO2 = service.readMember(vo.getId());
        if (pwEncoder.matches(vo.getPw(), returnVO2.getPw())) {
            UserVO returnVO = service.loginMember(returnVO2);
            session.setAttribute("id", returnVO.getId());
            result = 1;
        } else if (vo.getPw() == "") {
            result = 0;
        } else {
            result = 2;
        }
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(value = "/changePw", method = RequestMethod.GET)
    public void changePwGET() throws Exception {

    }

    // change password
    @RequestMapping(value = "/changePw", method = RequestMethod.POST)
    public void changePwPOST(@RequestParam("id") String id, @RequestParam("pw") String pw, UserVO vo, HttpServletResponse response) throws Exception {

        vo.setId(id);
        vo.setPw(pwEncoder.encode(pw));

        service.changePw(vo);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.print("<script>");
        out.print(" alert('변경하신 비밀번호로 다시 로그인 해주세요'); ");
        out.println("location.href='/user/logout'");
        out.print("</script>");
        out.close();

    }

    @RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
    public String checkPw(@RequestParam("pw") String pw, @RequestParam("pw2") String pw2, HttpServletResponse response) throws Exception {
        int result = 0;

        if (pw.equals(pw2)) {
            result = 1;
        } else {
            result = 0;
        }
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();
        return null;
    }


}


