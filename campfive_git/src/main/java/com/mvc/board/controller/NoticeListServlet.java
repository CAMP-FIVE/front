package com.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.board.model.service.NoticeService;
import com.mvc.board.model.vo.Board;
import com.mvc.common.util.PageInfo;

@WebServlet("/board/notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NoticeService service = new NoticeService();

    public NoticeListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		listCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list = service.getBoardList(pageInfo);
		
		System.out.println(listCount);
		System.out.println(list);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
	}

}
