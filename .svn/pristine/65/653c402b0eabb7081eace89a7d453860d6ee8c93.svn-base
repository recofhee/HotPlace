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
import com.HotPlace.vo.MemberVo;

@WebServlet("/id_pw")
public class Id_Pw1Servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("id_pw.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String url = "";
		String email = req.getParameter("email");
		String sendAuth = req.getParameter("sendAuth");
		System.out.println("sendAuth 값 : " + sendAuth);

		MemberVo mvo = new MemberVo();
		mvo.setEmail(email);
		
		MemberDao dao = MemberDao.getInstance();
		
		int result = dao.findPass(email);
		
		HttpSession session = req.getSession();
		
		if(result == 1) {
			session.setAttribute("email", mvo.getEmail());
			req.setAttribute("message", "email 정보를 찾았습니다.");
			session.setAttribute("sendAuth", sendAuth);
			
			url = "id_pw2";
		} else  {
			req.setAttribute("message", "일치하는 정보가 없습니다.");
			url = "id_pw.jsp";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
		
		
	}

}
