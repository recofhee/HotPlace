package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.MemberDao;
import com.HotPlace.vo.MemberVo;

@WebServlet("/cardBoardWriteForm")
public class CardBoardWriteFormServlet extends HttpServlet{

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		
		MemberDao dao = MemberDao.getInstance();
		
		int result = dao.userCheck(email, pw);
		
		if(result == 1) {
			MemberVo vo = dao.getMember(email);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
		}
		
		req.setAttribute("page", page);
		req.getRequestDispatcher("cardBoardWrite.jsp").forward(req, resp);
	}
	
}
