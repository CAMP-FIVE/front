package com.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LogoutServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	HttpSession session = request.getSession(false); 
    	
    	if(session != null) {
    		session.invalidate();
    	}
    	
    	response.sendRedirect(request.getContextPath() + "/");
    	
    	System.out.println("logout_OK"); // 로그아웃 ok 화면 띄우기
	}
}
       
//    public LogoutServlet() {
//  
//    }
//    
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//		System.out.println("get");
//		HttpSession session = request.getSession();
//		if(session.getAttribute("id") != null) {
//			session.removeAttribute("id");			
//		}
//		if(session.getAttribute("name") != null) {
//		session.removeAttribute("name");
//		}
//		//session.invalidate(); //모든 세션 종료
//		response.sendRedirect("./index.jsp");
//	}
// 
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("post");
//	}
//
//}
