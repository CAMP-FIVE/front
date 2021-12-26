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

@WebServlet(name="findId", urlPatterns = "/member/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MemberService service = new MemberService();
	
    public FindIdServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/findId.jsp").forward(request, response);
    }	

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userName = request.getParameter("userName");
    	String phone = request.getParameter("phone");
    	Member member = service.findId(userName, phone);
    	
    	System.out.println("member : " + member);
    	
    	if(member != null) {
    		request.setAttribute("member", member);
    		request.setAttribute("msg", userName + "님의 아이디는 " + member.getId() + "입니다.");
    	} else {
    		request.setAttribute("msg", "정보를 입력해주세요.");
    		request.setAttribute("location", "/");    		
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}
