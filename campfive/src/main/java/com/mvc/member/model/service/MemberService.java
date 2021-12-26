package com.mvc.member.model.service;

import java.sql.Connection;

import static com.mvc.common.jdbc.JDBCTemplate.*; 
import com.mvc.member.model.dao.MemberDao;
import com.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	
	public Member login(String id, String password) {
		Member member = this.findMemberById(id);
		
		System.out.println(member);
			
		if(member != null && member.getPassword().equals(password)) {
			return member;
		} else {
			return null;
		}
	}

	public int save(Member member) {
		int result = 0;
		Connection connection = getConncetion();
		
		if(member.getNo() != 0) {
			result = dao.updateMember(connection, member);
		} else {
			result = dao.insertMember(connection, member);
		}
				
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int updatePassword(int no, String password, String newPassword) {
		int result = 0;
		Connection connection = getConncetion();
		
		result = dao.updateMemberPassword(connection, no, password, newPassword);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	public int delete(int no) {
		int result = 0;
		Connection connection = getConncetion();
		
		result = dao.updateMemberStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public boolean isDuplicateID(String id) {
		
		return this.findMemberById(id) != null;
	}
	
	public Member findMemberById(String id) {
		Connection connection = getConncetion();
		Member member = dao.findMemberById(connection, id);
	
		close(connection);
	
		return member;
	
	}

	public Member findId(String userName, String phone) {
		Connection connection = getConncetion();
		Member member = dao.findId(connection, userName, phone);
		
		close(connection);
		
		System.out.println("member : " + member);
		
		return member;
	}

	public Member findPwd(String userName, String userId, String phone) {
		Connection connection = getConncetion();
		Member member = dao.findPwd(connection, userName, userId, phone);
		
		close(connection);
		
		System.out.println("member : " + member);
		
		return member;
	}
	
	

	


}
