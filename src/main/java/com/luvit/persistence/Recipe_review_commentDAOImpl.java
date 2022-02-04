package com.luvit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.Recipe_review_commentVO;

@Repository
public class Recipe_review_commentDAOImpl implements Recipe_review_commentDAO {
	
	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlsession;

	private static final String namespace = "com.luvit.mapper.Recipe_review_commentMapper";

	
		
	// 시간정보추가
	@Override
	public String getTime() {
			System.out.println("DAO : DB접근 sqlSession객체를 주입!");
			System.out.println("DAO : TEST에서 해당메서드 호출!!! ");
			System.out.println("DAO : memberMapper.xml 이동");
			System.out.println("DAO : Select구문을 실행하는 메서드를 실행해서 SQL구문 실행");
			// "com.itwillbs.mapper.MemberMapper.getTime";
			String result = sqlsession.selectOne(namespace + ".getTime");
			System.out.println("DAO : SQL 구문 실행완료! 값 리턴 후 테스트로 이동");
			return result;
	}

	// 댓글 갯수
	@Override
	public int cntComment() throws Exception {
		
		int result = sqlsession.selectOne(namespace+".cntComment");
		
		return result;
	}

	// 댓글 목록
	@Override
	public List<Recipe_review_commentVO> listComment(Recipe_review_commentVO vo) throws Exception {
		return sqlsession.selectList(namespace+".listComment", vo);
	}

	// 댓글 작성
	@Override
	public int insertComment(Recipe_review_commentVO vo) throws Exception {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO : " +vo.getR_r_c_bno() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return sqlsession.insert(namespace+".inComment", vo);
	}

	// 댓글 수정
	@Override
	public int updateComment(Recipe_review_commentVO vo) throws Exception {
		return sqlsession.update(namespace+".upComment", vo);
	}

	// 댓글 삭제
	@Override
	public int deleteComment(int r_r_c_cno) throws Exception {
		return sqlsession.delete(namespace+".delComment", r_r_c_cno);
	}
}
