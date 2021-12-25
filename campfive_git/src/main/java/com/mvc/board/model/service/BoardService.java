package com.mvc.board.model.service;

import static com.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.mvc.board.model.dao.BoardDao;
import com.mvc.board.model.vo.Board;
import com.mvc.common.util.PageInfo;

public class BoardService {

	private BoardDao dao = new BoardDao();
	
	public int getBoardCount() {
		int count = 0;
		Connection connection = getConncetion();
		
		count = dao.getBoardCount(connection);
		
		close(connection);
		
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		Connection connection = getConncetion();
		
		list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConncetion();
		
		if (board.getNo() != 0) {
//			result = dao.updateBoard(connection, board);
		} else {
			result = dao.insertBoard(connection, board);
			
		}
		
		if(result > 0) {
			commit(connection);	
		} else {
			rollback(connection);
			
		}
		
		close(connection);
		return result;
	}


}
