package com.mvc.board.model.service;

import static com.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.mvc.board.model.dao.QnaDao;
import com.mvc.board.model.vo.Board;
import com.mvc.common.util.PageInfo;

public class QnaService {

	private QnaDao dao = new QnaDao();
	
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


}
