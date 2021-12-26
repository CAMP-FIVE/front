package com.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.model.service.BoardService;
import com.mvc.board.model.vo.Board1;
import com.mvc.common.util.PageInfo;




@WebServlet("/board/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService service = new BoardService();
	
    public ListServlet() {
      
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Board1> list = null;
    	
    	System.out.println("boardlist");
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page=1;
		}
    	
    	listCount = service.getBoardCount();
    	pageInfo = new PageInfo(page, 4, listCount, 3);
    	list = service.getBoardList1(pageInfo);
    	
    	System.out.println(listCount);
    	System.out.println(list);
    	System.out.println("리스트숫자");
		
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);
	
	}

}