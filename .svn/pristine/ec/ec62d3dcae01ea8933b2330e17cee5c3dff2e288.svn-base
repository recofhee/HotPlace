package com.HotPlace.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.MemberDao;
import com.HotPlace.util.SHA256;
import com.HotPlace.vo.GameVO;
import com.HotPlace.vo.MemberVo;

import sun.security.provider.SHA;
@WebServlet("/Join2")
public class JoinServlet2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("join_2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		SHA256 sha = new SHA256();
		
		String email = req.getParameter("email");
		String pw = sha.testSHA256(req.getParameter("pw"));
		String nick_name = req.getParameter("nick_name");;
		String phone = req.getParameter("phone");
		String game_genre = req.getParameter("game_genre");
		String[] game_name = req.getParameterValues("game_name");
		System.out.println("game_name : " + game_name);
		
		
		MemberVo mVo = new MemberVo();
		mVo.setEmail(email);
		mVo.setPw(pw);
		mVo.setNick_name(nick_name);
		mVo.setPhone(phone);
		mVo.setGame_genre(game_genre);
		mVo.setGame_name(game_name);
		
		
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.insertMember(mVo);
		
		HttpSession session = req.getSession();
		
		if(result == 1) {
			session.setAttribute("email", mVo.getEmail());
			req.setAttribute("message", "회원가입 성공!");
			resp.sendRedirect("Login");
		} else {
			req.setAttribute("message", "회원가입 실패");
			RequestDispatcher dispatcher = req.getRequestDispatcher("join_2.jsp");
			dispatcher.forward(req, resp);
		}
		
	}

}
