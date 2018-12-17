package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.ContactDao;
import com.HotPlace.vo.ContactVo;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("contact.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String company = req.getParameter("company");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String content = req.getParameter("content");
		
		ContactVo vo = new ContactVo();
		vo.setCompany(company);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setContent(content);
		System.out.println(vo);
		
		// DB에 저장
		ContactDao dao = ContactDao.getInstance();
		dao.saveContact(vo);
		
		
		// 이메일 전송
		ContactMailing mailing = new ContactMailing();
		mailing.service(req, resp);
		
		
		resp.getWriter().print("1");
		
		//req.setAttribute("loginUser", nick_name);
		//resp.sendRedirect("contact");
		
	}
	
	
	
}
