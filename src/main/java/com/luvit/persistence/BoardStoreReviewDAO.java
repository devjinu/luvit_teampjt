package com.luvit.persistence;

import java.util.ArrayList;

import com.luvit.domain.BoardStoreReviewVO;


public interface BoardStoreReviewDAO {

	int insertBoard(BoardStoreReviewVO bdto);
	
	int getBoardCount();
	
	ArrayList<BoardStoreReviewVO> getBoardList();
	
	ArrayList<BoardStoreReviewVO> getBoardList(int startRow, int pageSize);

	void updateReadCount(int bno);

	BoardStoreReviewVO getBoard(int bno);
	
	int updateBoard(BoardStoreReviewVO bdto);

	int deleteBoard(int bno, String passwd);

	void reInsertBoard(BoardStoreReviewVO dto);
}
