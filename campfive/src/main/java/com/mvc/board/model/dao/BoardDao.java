package com.mvc.board.model.dao;

import static com.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.board.model.vo.Board;
import com.mvc.board.model.vo.Board1;
import com.mvc.common.util.PageInfo;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM REVIEW WHERE STATUS = 'Y'";
		
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
		String query = 
				"SELECT RNUM, NO, ID, TITLE, CONTENT, CREATE_DATE, MODIFY_DATE, HIT, STATUS " +
						"FROM ( " +
						"  SELECT ROWNUM AS RNUM, NO, ID, TITLE, CONTENT, CREATE_DATE, MODIFY_DATE, HIT, STATUS " +
						"  FROM ( " +
						"    SELECT ROWNUM, R.NO, M.ID, R.TITLE, R.CONTENT, R.CREATE_DATE, R.MODIFY_DATE, R.HIT, R.STATUS " +
						"    FROM REVIEW R JOIN MEMBER M ON(R.WRITE_NO = M.NO) " +
						"    WHERE R.STATUS = 'Y' ORDER BY R.NO DESC " +
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

	public int insertBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, board.getWrite_no());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFileName());
			pstmt.setString(5, board.getRenamedFileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
		return result;
	}

	public List<Board1> findAll1(Connection connection, PageInfo pageInfo) {
		List<Board1> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 

				"   SELECT RNUM, NO, WRITE_NO, CEO_NAME, CAMP_NAME, ADDRESS, PHONE, ENV, TYPE ,OPERATING_SEASON ,OPERATING_DAYS , HOMPAGE , RESERV , ABOUT  " +
						"       FROM (  " +
						"        SELECT ROWNUM AS RNUM, NO, WRITE_NO, CEO_NAME, CAMP_NAME, ADDRESS, PHONE, ENV, TYPE ,OPERATING_SEASON ,OPERATING_DAYS , HOMPAGE , RESERV , ABOUT  " +
						"         FROM (  " +
						"           SELECT ROWNUM, C.NO, C.WRITE_NO, C.CEO_NAME, C.CAMP_NAME, C.ADDRESS, C.PHONE, C.ENV, C.TYPE ,C.OPERATING_SEASON ,C.OPERATING_DAYS , C.HOMPAGE , C.RESERV , C.ABOUT   " +
						"           FROM CAMPING_INFO C JOIN MEMBER M ON(C.WRITE_NO = M.NO)  " +
						"        WHERE M.STATUS = 'Y' ORDER BY M.NO DESC " +
						"          ) " +
						"       ) " +
						"       WHERE ROWNUM BETWEEN ? and ? " ;
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList()); //占쎈땾占쎌젟?
			
			rs = pstmt.executeQuery();
			
			
			System.out.println("占쎄쉐�⑨옙");
			while(rs.next()) {
				Board1 board = new Board1();
				
				
				board.setRnum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NO"));
				board.setWrite_No(rs.getInt("WRITE_NO"));
				board.setCeoName(rs.getString("CEO_NAME"));
				board.setCampName(rs.getString("CAMP_NAME"));
				board.setAddress(rs.getString("ADDRESS"));
				board.setPhone(rs.getString("PHONE"));
				board.setEnv(rs.getString("ENV"));
				board.setType(rs.getString("TYPE"));
				board.setOperating_Season(rs.getString("OPERATING_SEASON"));
				board.setOperating_Days(rs.getString("OPERATING_DAYS"));
				board.setHompage(rs.getString("HOMPAGE"));
				board.setReserv(rs.getString("RESERV"));
				board.setAbout(rs.getString("ABOUT"));
				
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
	
public Board1 findBoardNo(Connection connection, int no) {
		
		Board1 board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"   SELECT C.NO, C.WRITE_NO, C.CEO_NAME, C.CAMP_NAME, C.ADDRESS, C.PHONE, C.ENV, C.TYPE ,C.OPERATING_SEASON ,C.OPERATING_DAYS , C.HOMPAGE , C.RESERV ,C.ABOUT " +
						"FROM CAMPING_INFO C JOIN MEMBER M ON(C.WRITE_NO = M.NO)  " +
						"WHERE M.STATUS = 'Y' AND M.NO =? ";

		try {
			pstmt = connection.prepareStatement(query);
			

			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board1();
				
				board.setNo(rs.getInt("NO"));
				board.setWrite_No(rs.getInt("WRITE_NO"));
				board.setCeoName(rs.getString("CEO_NAME"));
				board.setCampName(rs.getString("CAMP_NAME"));
				board.setAddress(rs.getString("ADDRESS"));
				board.setPhone(rs.getString("PHONE"));
				board.setEnv(rs.getString("ENV"));
				board.setType(rs.getString("TYPE"));
				board.setOperating_Season(rs.getString("OPERATING_SEASON"));
				board.setOperating_Days(rs.getString("OPERATING_DAYS"));
				board.setHompage(rs.getString("HOMPAGE"));
				board.setReserv(rs.getString("RESERV"));
				board.setAbout(rs.getString("ABOUT"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
		return board;

	}
}
