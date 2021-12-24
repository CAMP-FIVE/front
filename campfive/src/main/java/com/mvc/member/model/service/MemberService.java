package com.mvc.member.model.service;

import com.mvc.member.model.dao.MemberDao;
import com.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	

	public Member login(String id, String password) {
		Member member = dao.findMemberById(id);
		
			System.out.println(member);
			
		if(member != null && member.getPassword().equals(password)) {
			
			
			return member;
		}else {
			return null;
		}
	}
	
	}
