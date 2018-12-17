package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.MemberDao;
import com.HotPlace.util.SHA256;
import com.HotPlace.vo.MemberVo;

@WebServlet("/memberUpdate")
public class MemberUpdateServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		MemberDao dao = MemberDao.getInstance();
		
		MemberVo vo = dao.getMember(email);
		req.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("memberUpdate.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		SHA256 sha = new SHA256();
		String email = req.getParameter("email");
		String pw = sha.testSHA256(req.getParameter("pw"));
		String nick_name = req.getParameter("nick_name");
		String phone = req.getParameter("phone");
		
		MemberVo vo = new MemberVo();
		vo.setEmail(email);
		vo.setPw(pw);
		vo.setNick_name(nick_name);
		vo.setPhone(phone);
		System.out.println(vo);
		MemberDao dao = MemberDao.getInstance();
		
		dao.updateMember(vo);
		resp.sendRedirect("login.jsp");
	}
	
	
}
