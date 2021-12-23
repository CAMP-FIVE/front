package com.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.member.model.vo.Member;

public class MemberDao {
	
	public Member findMemberById(String id) {
		Member member = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
		
		System.out.println(id);
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PROJECT", "PROJECT");
			pstm = conn.prepareStatement(query);			
			
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				System.out.println("1234");
				
				
				member = new Member();
				
				member.setNo(rs.getInt("NO"));
				member.setId(rs.getString("ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setRole(rs.getString("ROLE"));
				member.setName(rs.getString("NAME"));
				member.setPhone(rs.getNString("PHONE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setNickname(rs.getString("NICKNAME"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setModifyDate(rs.getDate("MODIFY_DATE"));
				member.setStatus(rs.getString("STATUS"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return member;
		
	}
}
