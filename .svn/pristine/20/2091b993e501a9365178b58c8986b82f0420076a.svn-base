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

@WebServlet("/id_pw3")
public class Id_Pw3Servlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "";
		String email = req.getParameter("email");
		
		
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.findPass(email);
		
		if(result==1) {
			MemberVo vo = dao.getMember(email);
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
			req.setAttribute("message", "회원가입에 성공했습니다.");
			url = "id_pw3.jsp";
		}else if(result ==0) {
			req.setAttribute("message", "비밀번호가 맞지 않습니다");
			url = "id_pw2.jsp";
		}else if(result==-1) {
			req.setAttribute("message", "존재하지 않는 회원입니다.");
			url = "id_pw2.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
		
	}
	
}
