package com.luvit.service;

import com.luvit.domain.UserVO;
import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;

public interface UserService {
    // 서비스 계층

    // 회원 가입 (일반 회원가입/ SNS 계정- 간단회원가입)
    void insertUser(UserVO vo);

    // 회원 로그인 체크
    UserVO loginMember(UserVO vo);

    // ID를 사용해서 회원정보 가져오는 동작
    UserVO readMember(String id) throws Exception;

    void updateMember(UserVO vo);

    void deleteMember(UserVO vo);

    // 회원 목록
    List<UserVO> userList();

    // 임시 비밀번호
    void tempPw(UserVO vo) throws Exception;

    // sns 가입
    void snsInsertUser(UserVO vo) throws Exception;

    // nickname check
    int nickNameCheck(String nickname) throws Exception;

    // email check
    int emailCheck(String email) throws Exception;

    // id check
    int idCheck(String id) throws Exception;

    // change password
    void changePw(UserVO vo) throws Exception;
    // findmyid - by email
    UserVO findmyid(String email) throws Exception;
    
    //**********관리자페이지에서 필요한 기능
    // userNum으로 회원 삭제
    void deleteUser(int user_num) throws Exception;
    
    // 유저리스트 + 페이징 + 검색
    List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;

    // 유저 총 갯수 + 검색 적용
    int searchCount(String searchType, String keyword) throws Exception;

    public String getNickName(String id) throws Exception;

}
