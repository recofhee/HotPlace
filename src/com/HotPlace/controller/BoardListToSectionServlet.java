package com.HotPlace.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.vo.BoardVO;

@WebServlet("/mainBoardList.g")
public class BoardListToSectionServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> vo = dao.gameBoardList();
		req.setAttribute("boardList", vo);
	
		
		req.getRequestDispatcher("section.jsp").forward(req, resp);

	}
	
	
}

