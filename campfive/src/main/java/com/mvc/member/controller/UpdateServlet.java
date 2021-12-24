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

@WebServlet(name="update", urlPatterns="/member/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();

    public UpdateServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	Member member = null;
    	String hobby = null;
    	int result = 0;
    	
    	if(loginMember != null) {
    		member = new Member();
    		
    		member.setNo(loginMember.getNo());
    		member.setId(request.getParameter("userId"));
    		member.setName(request.getParameter("userName"));
    		member.setNickname(request.getParameter("userNickname"));
    		member.setPhone(request.getParameter("phone"));
    		member.setEmail(request.getParameter("email"));
    		
    		
    		// 3. 회원 정보 수정
    		result = service.save(member);
    		
    		if(result > 0) {
    			// 세션을 갱신한다.
    			session.setAttribute("loginMember", service.findMemberById(loginMember.getId()));
    		
        		request.setAttribute("msg", "회원 정보 수정이 완료되었습니다.");
    			request.setAttribute("location", "/member/myPage");
    		} else {
        		request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
    			request.setAttribute("location", "/member/myPage");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
			request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
