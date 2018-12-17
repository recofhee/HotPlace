package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.vo.BoardVO;

@WebServlet("/boardDelete.g")
public class BoardDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		
		int category_num = req.getParameter("category_num") == null || req.getParameter("category_num").equals("") ? 0 :Integer.parseInt(req.getParameter("category_num"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
		
		resp.sendRedirect("boardList.g?category_num=" + category_num);
	}

}
