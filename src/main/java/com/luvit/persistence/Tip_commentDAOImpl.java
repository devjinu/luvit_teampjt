package com.luvit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.luvit.domain.Recipe_commentVO;
import com.luvit.domain.Tip_commentVO;

@Repository
public class Tip_commentDAOImpl implements Tip_commentDAO {

	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlsession;

	private static final String namespace = "com.luvit.mapper.Tip_commentMapper";

	
		
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

	
	/////////////////////////////// 팁 댓글 ///////////////////////////////////
	// 댓글 갯수
	@Override
	public int cntReply() throws Exception {
		
		int result = sqlsession.selectOne(namespace+".cntReply");
		
		return result;
	}

	// 댓글 목록
	@Override
	public List<Tip_commentVO> listReply(Tip_commentVO vo) throws Exception {
		return sqlsession.selectList(namespace+".listReply", vo);
	}

	// 댓글 작성
	@Override
	public int insertReply(Tip_commentVO vo) throws Exception {
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO : " +vo.getT_c_bno() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return sqlsession.insert(namespace+".inReply", vo);
	}

	// 댓글 수정
	@Override
	public int updateReply(Tip_commentVO vo) throws Exception {
		return sqlsession.update(namespace+".upReply", vo);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int t_c_cno) throws Exception {
		return sqlsession.delete(namespace+".delReply", t_c_cno);
	}
	
	// 평균평점
	@Override
	public int avgRating(int t_c_rating) throws Exception {
		return sqlsession.update(namespace+".avgRating", t_c_rating);
	}
	
	/////////////////////////////////// 레시피 댓글 //////////////////////////////////
	


		// 댓글 갯수
		@Override
		public int rcntReply() throws Exception {
			
			int result = sqlsession.selectOne(namespace+".rcntReply");
			
			return result;
		}

		// 댓글 목록
		@Override
		public List<Recipe_commentVO> rlistReply(Recipe_commentVO vo) throws Exception {
			return sqlsession.selectList(namespace+".rlistReply", vo);
		}

		// 댓글 작성
		@Override
		public int rinsertReply(Recipe_commentVO vo) throws Exception {
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAO : " +vo.getR_c_bno() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			return sqlsession.insert(namespace+".rinReply", vo);
		}

		// 댓글 수정
		@Override
		public int rupdateReply(Recipe_commentVO vo) throws Exception {
			return sqlsession.update(namespace+".rupReply", vo);
		}

		// 댓글 삭제
		@Override
		public int rdeleteReply(int t_c_cno) throws Exception {
			return sqlsession.delete(namespace+".rdelReply", t_c_cno);
		}
		
		
		
	
	
	

}
