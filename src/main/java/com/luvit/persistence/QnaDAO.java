package com.luvit.persistence;

import com.luvit.domain.QnaVO;

import java.util.List;


public interface QnaDAO {

	int getBoardBnoCount();
	
	void insertBoard(QnaVO vo);
	
	int getBoardCount();
	
    String getBoardNickName(int q_bno);
	// test
    QnaVO getBoardData(int q_bno);
	
	List<QnaVO> getBoardList();
	
	List<QnaVO> getBoardList(int startRow, int pageSize);

	List<QnaVO> getBoardList(String check, int startRow, int pageSize);
	
	void updateReadCount(int q_bno);

	QnaVO getBoard(int q_bno);
	
	String updateCheck(QnaVO vo);
	
	void updateBoard(QnaVO vo);

	String deleteCheck(QnaVO vo);
	
	void deleteBoard(QnaVO vo);

	void reWriteUpdate(QnaVO vo);
	
	void reWrite(QnaVO vo);
	
	
}
