package com.luvit.service;

import java.util.List;

import com.luvit.domain.QnaVO;

public interface QnaService {

	// 서비스 계층
	
	int getBoardCount();
	
	int getBoardBnoCount();
	
	//회원 가입 ( 일반회원가입 / SNS 계정-간단회원가입 )
    void insertBoard(QnaVO vo);
	
	void updateReadCount(int q_bno);
	
	QnaVO getBoard(int bno);
	
	String updateCheck(QnaVO vo);
	
	void updateBoard(QnaVO vo) ;

	String deleteCheck(QnaVO vo);
	
	void deleteBoard(QnaVO vo) ;
	
	List<QnaVO> getBoardList();
	
	List<QnaVO> getBoardList(int startRow, int pageSize);
	
	List<QnaVO> getBoardList(String check, int startRow, int pageSize);
	
	// test
    String getBoardNickName(int q_bno);
	// test
    QnaVO getBoardData(int q_bno);
	
	void reWriteUpdate(QnaVO vo);
	
	void reWrite(QnaVO vo);
	
}

