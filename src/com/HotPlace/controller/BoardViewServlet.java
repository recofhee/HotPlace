package com.HotPlace.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.vo.BoardCommentVO;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.MemberVo;


@WebServlet("/boardView.g")
public class BoardViewServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String url = "boardView.jsp";
		int num = Integer.parseInt(req.getParameter("num"));
		BoardDAO dao = BoardDAO.getInstance();

		dao.updateReadCount(num);
		BoardVO vo = dao.selectBoardByNum(num);
		
		
		String email= null;
		HttpSession session =req.getSession();
		MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
		if(vo1 == null) {
			email = "guest";
		} else {
			email = vo1.getEmail();
		}
		req.setAttribute("email", email);
		
		req.setAttribute("board", vo);

		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);

	}

}
