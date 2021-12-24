package com.mvc.board.model.service;

import static com.mvc.common.jdbc.JDBCTemplate.JDBCTemplate.close;
import static com.mvc.common.jdbc.JDBCTemplate.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.mvc.board.model.dao.NoticeDao;
import com.mvc.board.model.vo.Board;
import com.mvc.common.util.PageInfo;

public class NoticeService {

	private NoticeDao dao = new NoticeDao();
	
	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = dao.getBoardCount(connection);
		
		close(connection);
		
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}


}
