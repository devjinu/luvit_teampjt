package com.luvit.service;


// @Service : 해당 클래스를 서비스 객체로 처리 하겠다.(스프링에서 인식)

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.luvit.domain.UserVO;
import com.luvit.persistence.UserDAO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    // DB 처리하기위한 객체 주입
    @Inject
    private UserDAO udao;

    // 깡통 객체
    private UserVO returnVO;

    @Inject
    private HttpSession session;

    @Override
    public void insertUser(UserVO vo) {

        // 컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
        System.out.println("Service : 회원 가입 동작");

        if (vo == null) {
            // 처리
            return;
        }

        udao.insertMember(vo);
    }

    @Override
    public UserVO loginMember(UserVO vo) {

        System.out.println("S : 컨트롤러에서 호출");
        System.out.println("S : 필요한 정보를 받아서 DAO 전달");
        UserVO returnVO = null;


        try {
            // DAO 객체 생성 (DI)
            returnVO =
                    udao.readMemberWithIDPW(vo.getId(), vo.getPw());
        } catch (Exception e) {
            e.printStackTrace();
            returnVO = null;
        }
        System.out.println(returnVO);
        return returnVO;
    }


    @Override
//    @Select("select * from user where id = #{id}")
    public UserVO readMember(String id) {
        System.out.println("S : readMember(id) 호출");
        System.out.println("S : DAO 객체 생성(DI) - 메소드 호출");

        UserVO vo = null;

        try {
            vo = udao.readMember(id);
            System.out.println("S : DAO 처리 완료, 정보 리턴");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    @Override
    public void updateMember(UserVO vo) {

        System.out.println("S : updateMember(vo) 호출");
        System.out.println("S : DAO 객체 생성후 메소드 호출");


        try {
            udao.updateMember(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("S : 수정완료");
    }

    @Override
    public void deleteMember(UserVO vo) {
        try {
            udao.deleteMember(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<UserVO> userList() {

        List<UserVO> userList = null;

        try {
            userList = udao.getMemberList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }


    @Override
    public void tempPw(UserVO vo) throws Exception {
        udao.tempPw(vo);
    }

    @Override
    public void snsInsertUser(UserVO vo) {

        System.out.println("Service : sns 회원 가입 동작");

        if (vo == null) {
            // 처리
            return;
        }

        try {
            udao.snsInsertUser(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int nickNameCheck(String nickname) throws Exception {
        int result = udao.nickNameCheck(nickname);

        return result;
    }

    @Override
    public int emailCheck(String email) throws Exception {
        int result = udao.emailCheck(email);

        return result;
    }

    @Override
    public int idCheck(String id) throws Exception {
        int result = udao.idCheck(id);

        return result;
    }

    @Override
    public void changePw(UserVO vo) throws Exception {
        System.out.println("service >>>>"+vo.getPw());
        udao.changePw(vo);
    }
    @Override
    public UserVO findmyid(String email) throws Exception {
        UserVO vo = udao.findmyid(email);
        return vo;
    }
    
    @Override
	public void deleteUser(int user_num) throws Exception {
		udao.deleteUser(user_num);		
	}

	@Override
	public List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
			
		return udao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return udao.searchCount(searchType, keyword);
	}


    @Override
    public String getNickName(String id) throws Exception {

        String nickname = udao.getNickName(id);

        return nickname;
    }


}


