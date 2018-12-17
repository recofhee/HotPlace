package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.MemberVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/boardUpdate.g")	
public class BoardUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("넘버" + num);

		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.selectBoardByNum(num);
		
		
		String email= null;
		HttpSession session =req.getSession();
		MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
		email = vo1.getEmail();
		req.setAttribute("email", email);
		

		req.setAttribute("board", vo);
		RequestDispatcher dispatcher = req.getRequestDispatcher("boardUpdate.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletContext context = getServletContext();
		
	
		String path = context.getRealPath("upload");
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(req, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String title = multi.getParameter("title");
		String file_modi = multi.getFilesystemName("file_modi");
		String content = multi.getParameter("content");
		String category_num = multi.getParameter("category_num");
		
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setTitle(title);
		vo.setFile_modi(file_modi);
		vo.setContent(content);
		
		
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateBoard(vo);
		
		resp.sendRedirect("boardList.g?category_num="+category_num);
		 
	}

}
