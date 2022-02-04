package com.luvit.persistence;

import com.github.scribejava.core.builder.api.DefaultApi20;
import com.luvit.domain.UserVO;

import java.util.List;

public interface UserDAO {
    // 해당 도메인에 관련된 기능 선언(추상메소드) -> 구현

    // DB서버의 시간정보를 가져오기
    String getTime();

    // 회원가입(C create)
    void insertMember(UserVO vo);


    // 회원 정보 조회 - 사용자 ID에 해당하는 정보 (R read)
    UserVO readMember(String id) throws Exception;

    // 회원 정보 조회 - ID, PW 정보에 해당하는 사용자 정보
    UserVO readMemberWithIDPW(String id, String pw) throws Exception;

    // 회원정보 수정 - (U update)
    void updateMember(UserVO vo) throws Exception;

    // 회원정보 삭제 - (D delete)
    void deleteMember(UserVO vo) throws Exception;

    // 회원정보 + List
    List<UserVO> getMemberList() throws Exception;

    // 임시 비밀번호 발급
    void tempPw(UserVO vo) throws Exception;

    // sns 회원가입
    void snsInsertUser(UserVO vo);

    // nickmame check
    int nickNameCheck(String nickname);

    // email check
    int emailCheck(String email);

    // id check
    int idCheck(String id);

    // change password
    void changePw(UserVO vo);

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
