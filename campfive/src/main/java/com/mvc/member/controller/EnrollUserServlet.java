package com.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.member.model.service.MemberService;
import com.mvc.member.model.vo.Member;

@WebServlet(name="enrollUser", urlPatterns="/member/enrollUser")
public class EnrollUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();

    public EnrollUserServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	
    	if(loginMember == null) {    		
    		request.getRequestDispatcher("/views/member/enrollUser.jsp").forward(request, response);
    	} else {
    		request.setAttribute("msg", "로그아웃 후 이용해 주세요.");
			request.setAttribute("location", "/");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		
		member.setId(request.getParameter("userId"));
		member.setPassword(request.getParameter("userPwd"));
		member.setName(request.getParameter("userName"));
		member.setNickname(request.getParameter("userNickname"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
				
		System.out.println(member);
		
		int result = 0;
		
		result = service.save(member);
		
		if(result > 0) {
			request.setAttribute("msg", "회원 가입이 완료되었습니다.");
			request.setAttribute("location", "/");
		} else {
			request.setAttribute("msg", "회원 가입에 실패하였습니다.");
			request.setAttribute("location", "/member/enrollUser");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

}