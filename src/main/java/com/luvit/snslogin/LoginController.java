package com.luvit.snslogin;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.luvit.domain.UserVO;
import com.luvit.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    // 깡통vo
    UserVO emptyVO = new UserVO();

    /* NaverLoginBO */
    @Inject
    private NaverLoginBO naverLoginBO;

    private String apiResult = null;

    @Inject
    private UserService service;


    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;

    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/snslogin/callback", method = {RequestMethod.GET, RequestMethod.POST})
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, UserVO vo)
            throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);

        //로그인 사용자 정보
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);

        // 데이터 파싱
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;

        JSONObject response_obj = (JSONObject) jsonObj.get("response");
        String nickname = (String) response_obj.get("nickname");
        String id = "N" + response_obj.get("id");

        session.setAttribute("login", true);
        session.setAttribute("id", id);

        model.addAttribute("result", apiResult);

        vo.setId(id);
        vo.setPw(id + nickname);

        UserVO returnVO2 = service.readMember(vo.getId());
        if (returnVO2 == null) {
            return "/user/snsinsertUser";
        } else {
            return "redirect:/user/main";
        }

    }

    // 카카오 로그인
    @RequestMapping(value = "/snslogin/kakao", produces = "application/json", method = RequestMethod.GET)
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session, UserVO vo) throws Exception {

        kakao_restapi kr = new kakao_restapi();
        //결과값을 node에 담아줌
        JsonNode node = kakao_restapi.getAccessToken(code);

        JsonNode userInfo = kakao_restapi.getKakaoUserInfo(node.get("access_token"));

        // Get id
        String id = userInfo.path("id").asText();

        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");

        String nickname = properties.path("nickname").asText();
        String email = kakao_account.path("email").asText();


        session.setAttribute("id", "K" + id);
        session.setAttribute("loginKakao", true);

        vo.setId("K" + id);
        vo.setPw(id + nickname);
        vo.setNickname(nickname);
        vo.setEmail(email);

        UserVO returnVO2 = service.readMember(vo.getId());
        if (returnVO2 == null) {
            return "/user/snsinsertUser";
        } else {
            return "redirect:/user/main";
        }

    }


    // 카카오 로그아웃
    @RequestMapping(value = "/kakao/logout", produces = "application/json", method = RequestMethod.GET)
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
        kakao_restapi kr = new kakao_restapi();
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = kr.Logout(session.getAttribute("loginid").toString());

        //결과 값 출력
        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));

        return "redirect:/user/login";
    }


    // 구글 Callback
    @RequestMapping(value = "/google/callback", produces = "application/json;charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
    public String googleCallback(@RequestParam String code, HttpSession session, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);

        String accessToken = accessGrant.getAccessToken();
        emptyVO = GoogleLogin.getGoogleUserInfo(accessToken);

        String id = emptyVO.getId();
        String nickname = emptyVO.getNickname();

        UserVO vo = new UserVO();

        vo.setId(id);
        vo.setPw(id + nickname);

        // 파싱 세션에 저장
        session.setAttribute("login", true);
        session.setAttribute("id", id);
        session.setAttribute("nickname", nickname);

        UserVO returnVO2 = service.readMember(vo.getId());
        if (returnVO2 == null) {
            return "/user/snsinsertUser";
        } else {
            return "redirect:/user/main";
        }

    }
}
