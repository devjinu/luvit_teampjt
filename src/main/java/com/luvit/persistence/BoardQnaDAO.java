package com.luvit.persistence;

import java.util.ArrayList;

import com.luvit.domain.BoardQnaVO;

public interface BoardQnaDAO {

	int insertBoard(BoardQnaVO bdto);
	
	int getBoardCount();
	
	ArrayList<BoardQnaVO> getBoardList();
	
	ArrayList<BoardQnaVO> getBoardList(int startRow, int pageSize);

	void updateReadCount(int bno);

	BoardQnaVO getBoard(int bno);
	
	int updateBoard(BoardQnaVO bdto);

	int deleteBoard(int bno, String passwd);

	void reInsertBoard(BoardQnaVO dto);

}
