package com.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.member.model.service.MemberService;
import com.mvc.member.model.vo.Member;

@WebServlet(name="enrollBusiness", urlPatterns="/member/enrollBusiness")
public class EnrollBusinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();

    public EnrollBusinessServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/enrollBusiness.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		
		member.setId(request.getParameter("userId"));
		member.setPassword(request.getParameter("userPwd"));
		member.setName(request.getParameter("userName"));
		member.setNickname(request.getParameter("userNickname"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setBusinessNo(request.getParameter("businessNo"));
		
		System.out.println(member);
		
		int result = 0;
		
		result = service.save(member);
		
		if(member.getBusinessNo() == null) {
			request.setAttribute("msg", "사업자등록번호를 확인해주세요.");
			request.setAttribute("location", "/member/enrollBusiness");
		} else {
			
			if(result > 0) {
				request.setAttribute("msg", "회원 가입이 완료되었습니다.");
				request.setAttribute("location", "/");
			} else {
				request.setAttribute("msg", "회원 가입에 실패하였습니다.");
				request.setAttribute("location", "/member/enrollBusiness");
			}
		}
		
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

}
