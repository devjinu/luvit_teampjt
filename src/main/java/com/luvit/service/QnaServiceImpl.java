package com.luvit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.luvit.domain.QnaVO;
import com.luvit.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	// DB처리하기 위한 객체 주입
	@Inject
	private QnaDAO mdao;
	
	
	@Override
	public int getBoardBnoCount() {
		System.out.println("S : getBoardBnoCount() 호출");
		System.out.println("S : DAO - 게시판 글 Max(q_bno) 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		int count = mdao.getBoardBnoCount();
		
		System.out.println("S : DAO 처리 완료 ");
		System.out.println("S : " + count);
		
		return count;
	}


	@Override
	public void insertBoard(QnaVO vo) {
		// TODO Auto-generated method stub
		
		System.out.println("Service : 게시판 글 입력 동작");
		
		if(vo == null) {
			// 처리 
			return;
		}
		
		mdao.insertBoard(vo);
	}

	
	@Override
	public void updateReadCount(int q_bno) {
		
		System.out.println("Service : 게시판 글 Count Update 동작");
		
		mdao.updateReadCount(q_bno);
	}


	@Override
	public QnaVO getBoard(int q_bno) {
		
		System.out.println("Service : 게시판 글 가져오기 동작");
		
		QnaVO vo = mdao.getBoard(q_bno);
		
		return vo;
	}

	@Override
	public String updateCheck(QnaVO vo) {
		System.out.println("Service : 게시판 글 삭제 비밀번호 확인 동작");
		
		String q_pw = mdao.updateCheck(vo);
		
		return q_pw;
	}

	@Override
	public void updateBoard(QnaVO vo) {
		System.out.println("Service : 게시판 글 수정 동작");
		
		mdao.updateBoard(vo);
	}

	@Override
	public String deleteCheck(QnaVO vo) {
		System.out.println("Service : 게시판 글 삭제 비밀번호 확인 동작");
		
		String q_pw = mdao.deleteCheck(vo);
		
		return q_pw;
	}


	@Override
	public void deleteBoard(QnaVO vo) {
		System.out.println("Service : 게시판 글 삭제 동작");
		
		mdao.deleteBoard(vo);
	}


	@Override
	public List<QnaVO> getBoardList() {
		System.out.println("S : getBoardList() 호출");
		System.out.println("S : DAO - 게시판 글 정보 리스트 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		List<QnaVO> boardList = mdao.getBoardList();
		
		System.out.println("S : DAO 처리 완료 ");
		//System.out.println("S : " + boardList);
		
		return boardList;
	}


	@Override
	public List<QnaVO> getBoardList(int startRow, int pageSize) {
		System.out.println("S : getBoardList() 호출");
		System.out.println("S : DAO - 게시판 글 정보 리스트 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		List<QnaVO> boardList = mdao.getBoardList(startRow, pageSize);
		
		System.out.println("S : DAO 처리 완료 ");
		//System.out.println("S : " + count);		
		
		return boardList;
	}


	@Override
	public List<QnaVO> getBoardList(String check, int startRow, int pageSize) {
		System.out.println("S : getBoardList() 호출");
		System.out.println("S : DAO - 게시판 비밀글 해제 정보 리스트 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		List<QnaVO> boardList = mdao.getBoardList(check, startRow, pageSize);
		
		System.out.println("S : DAO 처리 완료 ");
		//System.out.println("S : " + count);		
		
		return boardList;
	}


	@Override
	public int getBoardCount() {
		System.out.println("S : getBoardCount() 호출");
		System.out.println("S : DAO - 게시판 글 Count 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		int count = mdao.getBoardCount();
		
		System.out.println("S : DAO 처리 완료 ");
		System.out.println("S : " + count);
		
		return count;
	}

    // test
	@Override
	public String getBoardNickName(int q_bno) {
		System.out.println("S : getBoardNickName() 호출");
		System.out.println("S : DAO - 게시판 글 NickName 가져오기 동작 호출");
		
		// DAO객체(DI) - 해당 동작 메서드 호출 
		String q_nickname = mdao.getBoardNickName(q_bno);
		
		System.out.println("S : DAO 처리 완료 ");
		System.out.println("S : " + q_nickname);
		
		return q_nickname;
	}

    // test
	@Override
	public QnaVO getBoardData(int q_bno) {
		System.out.println("Service : 게시판 글 DATA 가져오기 동작");
		
		QnaVO vo = mdao.getBoardData(q_bno);
		
		return vo;
	}


	@Override
	public void reWriteUpdate(QnaVO vo) {
		System.out.println("Service : 게시판 답글 정보 업데이트 동작");
		
		mdao.reWriteUpdate(vo);
	}


	@Override
	public void reWrite(QnaVO vo) {
		System.out.println("Service : 게시판 답글 입력 동작");
		
		mdao.reWrite(vo);
	}

	
	
	


}
