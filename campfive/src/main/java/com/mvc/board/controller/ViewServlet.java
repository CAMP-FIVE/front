package com.mvc.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.board.model.service.BoardService;
import com.mvc.board.model.vo.Board;

@WebServlet("/board/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private BoardService service = new BoardService();

    public ViewServlet() {
 

    }
    
    
    @Override
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       	int no = Integer.parseInt(request.getParameter("no"));
       	
       
   		Cookie[] cookies = request.getCookies();
   		String boardHistory = ""; 
   		boolean hasRead = false; 
   		
   		if(cookies != null) {
   			String name = null;
   			String value = null;
   			
   			for(Cookie cookie : cookies) {
   				name = cookie.getName();
   				value = cookie.getValue();
   				
   			
   				if("boardHistory".equals(name)) {
   					boardHistory = value;
   					if(value.contains("|" + no + "|")) {
   				
   						hasRead = true;
   						 
   						break;
   					}
   				}
   			}
   		}
   		

   		if(!hasRead) {
   			Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + no + "|");
   			
   			cookie.setMaxAge(-1);
   			response.addCookie(cookie);
   		}
       	
       	Board board = service.findBoardByNo(no, hasRead);
       	
       	System.out.println(board);
       	
       	request.setAttribute("board", board);
       	request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);;
   	}

   }