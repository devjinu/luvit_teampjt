package com.luvit.persistence;

import com.luvit.domain.QnaVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class QnaDAOImpl implements QnaDAO {

	// DAO 동작 
	
	// 디비 연결 (의존 주입)
	@Inject
	private SqlSession sqlSession;
	// -> Mapper가 있는 위치까지 접근 
	
	// Mapper를 구분하는 값 
	private static final String namespace 
	 = "com.luvit.mapper.QnaMapper";
	
	@Override
	public int getBoardBnoCount() {
	
		System.out.println("DAO : DB접근 sqlSession 객체를 주입");
		System.out.println("DAO : 게시판 글번호 Count 확인");
		
		Integer result = sqlSession.selectOne(namespace+".getBoardBnoCount");
		
		if( result == null)
			result = 0;
		
		return result;
	}

	@Override
	public void insertBoard(QnaVO vo) {
		
		System.out.println("DAO : 게시판 글쓰기 확인");
		System.out.println("DAO : +==========="+vo);
		
		vo.setQ_bno( getBoardBnoCount()+1);
		vo.setQ_re_ref( getBoardBnoCount()+1);
		vo.setQ_re_lev(0);
		vo.setQ_re_seq(0);
		
		sqlSession.insert(namespace+".insertBoard",vo);
	}

	@Override
	public int getBoardCount() {
		
		System.out.println("DAO : 게시판 글 Count 확인");
		
		int count = sqlSession.selectOne(namespace+".getBoardCount");
		
		return count;
	}

	@Override
	public String getBoardNickName(int q_bno) {
		System.out.println("DAO : 게시판 글 NickName 확인");
		
		String q_nickname = sqlSession.selectOne(namespace+".getBoardNickName", q_bno);
		
		return q_nickname;
	}

	// test
	@Override
	public QnaVO getBoardData(int q_bno) {
		System.out.println("DAO : 게시판 글 DATA 가져오기 확인");
		
		QnaVO vo = sqlSession.selectOne(namespace+".getBoardData", q_bno);
		return vo;
	}
	
	@Override
	public List<QnaVO> getBoardList() {
		System.out.println("DAO: getBoardList() 호출");
		System.out.println("DAO: mapper 사용 해당 동작 호출");
		
		List<QnaVO> boardList = sqlSession.selectList(namespace+".getBoardList1");
		
		System.out.println("DAO : SQL 실행완료");
		System.out.println("DAO : boardList : " + boardList);
		
		return boardList;
	}

	@Override
	public List<QnaVO> getBoardList(int startRow, int pageSize) {
				
		HashMap data = new HashMap();
		
		data.put("startRow", startRow);
		data.put("pageSize", pageSize);
		
		List<QnaVO> vo = sqlSession.selectList(namespace+".getBoardList", data);
		
		return vo;
	}

	@Override
	public List<QnaVO> getBoardList(String check, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap data = new HashMap();
		
		data.put("check", check);
		data.put("startRow", startRow);
		data.put("pageSize", pageSize);
		
		List<QnaVO> vo = sqlSession.selectList(namespace+".getBoardListCheck", data);
		
		return vo;
	}

	@Override
	public void updateReadCount(int q_bno) {
		
		System.out.println("DAO : 게시판 글 Count Update 확인");
		
		sqlSession.update(namespace+".updateReadCount", q_bno);
	}

	@Override
	public QnaVO getBoard(int q_bno) {
		System.out.println("DAO : 게시판 글 가져오기 확인");
		
		QnaVO vo = sqlSession.selectOne(namespace+".getBoard", q_bno);
		return vo;
	}

	@Override
	public String updateCheck(QnaVO vo) {
		
		System.out.println("DAO : 게시판 글 수정 비밀번호 확인");
		String q_pw = sqlSession.selectOne(namespace+".updateCheck", vo);
		
		return q_pw;
	}

	@Override
	public void updateBoard(QnaVO vo) {
		System.out.println("DAO : 게시판 글 수정 확인");
		sqlSession.update(namespace+".updateBoard", vo);
	}

	@Override
	public String deleteCheck(QnaVO vo) {
		
		System.out.println("DAO : 게시판 글 삭제 비밀번호 확인");
		String q_pw = sqlSession.selectOne(namespace+".deleteCheck", vo);
		
		return q_pw;
	}

	@Override
	public void deleteBoard(QnaVO vo) {
		System.out.println("DAO : 게시판 글 수정 확인");
		sqlSession.delete(namespace+".deleteBoard", vo);
	}

	@Override
	public void reWriteUpdate(QnaVO vo) {
		System.out.println("DAO : 게시판 답글정보 업데이트 확인");
		sqlSession.update(namespace+".reWriteUpdate", vo);
	}

	@Override
	public void reWrite(QnaVO vo) {
		System.out.println("DAO : 게시판 답글쓰기 확인");
		vo.setQ_bno( getBoardBnoCount()+1);

		sqlSession.insert(namespace+".reWrite",vo);
	}



	
}
