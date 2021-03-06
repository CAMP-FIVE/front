package com.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.board.model.vo.Board;
import com.mvc.common.util.PageInfo;

import static com.mvc.common.jdbc.JDBCTemplate.*;

public class NoticeDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM NOTICE WHERE STATUS = 'Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return count;
	}

	public List<Board> findAll(Connection connection, PageInfo pageInfo) {

		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 	"SELECT RNUM, NO, ID, TITLE, CONTENT, CREATE_DATE, MODIFY_DATE, HIT, STATUS " +
				"FROM ( " +
				"  SELECT ROWNUM AS RNUM, NO, ID, TITLE, CONTENT, CREATE_DATE, MODIFY_DATE, HIT, STATUS " +
				"  FROM ( " +
				"    SELECT ROWNUM, N.NO, M.ID, N.TITLE, N.CONTENT, N.CREATE_DATE, N.MODIFY_DATE, N.HIT, N.STATUS " +
				"    FROM NOTICE N JOIN MEMBER M ON(N.WRITE_NO = M.NO) " +
				"    WHERE N.STATUS = 'Y' ORDER BY N.NO DESC " +
				"  ) " +
				") " +
				"WHERE RNUM BETWEEN ? AND ?";
				
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setRnum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NO"));
				board.setId(rs.getString("ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				board.setCreate_date(rs.getDate("CREATE_DATE"));
				board.setModify_date(rs.getDate("MODIFY_DATE"));
				board.setHit(rs.getInt("HIT"));
				board.setStatus(rs.getString("STATUS"));
			
				list.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return list;
	}

}
