package com.luvit.persistence;


// @Repository : DAO 객체를 스프링에서 인식 할 수 있도록 처리
//                DAO 객체를 구현한 객체로 사용하도록 처리

import com.luvit.domain.UserVO;
//import com.sun.media.jfxmedia.logging.Logger;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAOImpl implements UserDAO {
    // DAO 동작
    // Mapper를 구분하는 값
    private static final String namespace
            = "com.luvit.mapper.UserMapper";
    // -> Mapper 가 있는 위치까지 접근
    // 디비 연결 (의존 주입)
    @Inject
    private SqlSession sqlSession;


    @Override
    public String getTime() {
        System.out.println("DAO : TEST에서 해당 메소드 호출@@@");
        System.out.println("DAO : DB접근 sqlSession 객체를 주입@@@");
        System.out.println("DAO : memberMapper.xml 이동");
        System.out.println("DAO : Select 구문을 실행하는 메소드를 실행해서 SQL 구문 실행@@@");


        // "com.itwillbs.mapper.MemberMapper.getTime"
        String result = sqlSession.selectOne(namespace + ".getTime");
        System.out.println("DAO : SQL 구문 실행완료! 값 리턴 후 테스트로 이동");

        return result;
    }


    @Override
    public void insertMember(UserVO vo) {
        sqlSession.insert(namespace + ".insertMember", vo);
    }


    @Override
    public UserVO readMember(String id) throws Exception {
        System.out.println("DAO : readMember(id) 호출");


        // 테스트(컨트롤러) 호출 -> 정보를 저장해서 -> DB
        // DB에 접근 가능하도록 생성한 객체
        UserVO vo = sqlSession.selectOne(namespace + ".readMember", id);

        System.out.println("DAO : readMember 쿼리 실행 완료, 정보 리턴");

        return vo;
    }

    @Override
    public UserVO readMemberWithIDPW(String id, String pw) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("id", id);
        paramMap.put("pw", pw);

        // DB로 정보를 전달하기 위해서는 sqlSession 객체 활용
        // 1개 이상의 정보를 전달할때는 객체 단위로 전달
        // 객체(VO) 안에 저장이 안되는 정보의 경우 Map을 사용
        // key-value : 이때 key 값은 sql구문의 #{ooo} 이름과 같아야함

        UserVO vo = sqlSession.selectOne(namespace + ".readMemberWithIDPW", paramMap);

        System.out.println("dao db 저장된 아이디 : "+vo.getId());
        System.out.println("dao db 저장된 비밀번호 : "+vo.getPw());


        return vo;
//        return sqlSession.selectOne(namespace+".readWithIDPW");
    }


    @Override
    public void updateMember(UserVO vo) throws Exception {
        System.out.println("DAO : updateMember(vo) 호출");
        System.out.println("DAO : 정보가지고 Mapper 이동");

        Map<String, Object> paramMap = new HashMap<String, Object>();

        sqlSession.update(namespace + ".updateMember", vo);
    }

    @Override
    public void deleteMember(UserVO vo) throws Exception {
        Map<String, Object> paramMap = new HashMap<String, Object>();

        sqlSession.update(namespace + ".deleteMember", vo);
    }


    @Override
    public List<UserVO> getMemberList() throws Exception {

        List<UserVO> list = sqlSession.selectList(namespace + ".getMemberList");

//        List<UserVO> list = new ArrayList();
//        ResultSet rs = null;
//        UserVO vo;
//        while (sqlSession.selectOne(namespace + ".getMemberList", null) != null) {
//            list = sqlSession.selectList(namespace + ".getMemberList", null);
//        }

        return list;
    }


    @Override
    public void tempPw(UserVO vo) throws Exception {
        int result = sqlSession.update(namespace + ".tempPw", vo);
        System.out.println("SQL : tempPw 변경 여부" + result);
    }

    @Override
    public void snsInsertUser(UserVO vo) {

        sqlSession.insert(namespace + ".snsInsertUser", vo);
    }

    @Override
    public int nickNameCheck(String nickname) {

        int result = sqlSession.selectOne(namespace+".nickCheck", nickname);
        return result;
    }

    @Override
    public int emailCheck(String email){

        int result = sqlSession.selectOne(namespace+".emailCheck",email);
        return result;
    }

    @Override
    public int idCheck(String id) {
        int result = sqlSession.selectOne(namespace+".idCheck", id);

        return result;
    }

    @Override
    public void changePw(UserVO vo) {
        System.out.println("dao >>>> "+vo.getPw());
        sqlSession.update(namespace+".changePw", vo);

        System.out.println("mapper에서 비밀번호 변경"+vo.getPw());
    }
    @Override
    public UserVO findmyid(String email) throws Exception {
        UserVO vo=sqlSession.selectOne(namespace+".findmyid",email);
        return vo;
    }
    
    @Override
	public void deleteUser(int user_num) throws Exception {
		sqlSession.delete(namespace+".deleteUser",user_num);
		
	}


	@Override
	public List<UserVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectList(namespace+".listPageSearch", data);
	}


	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap data = new HashMap();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sqlSession.selectOne(namespace+".searchCount", data);
	}


    @Override
    public String getNickName(String id) throws Exception {

        String nickname = sqlSession.selectOne(namespace+".getNickName",id);


        return nickname;
    }

}

