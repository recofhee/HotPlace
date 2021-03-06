package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.MemberVo;
@WebServlet("/PcResvJson")
public class PcMainResvServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PcDao dao = PcDao.getInstance();
		if(session.getAttribute("loginUser") != null){
			MemberVo vo1 = (MemberVo)session.getAttribute("loginUser");
			String email = vo1.getEmail();
			JSONArray pcResv = dao.selectResvByNum(email);
			resp.setContentType("text/html; charset=utf-8");
			req.setAttribute("resv", pcResv);
			resp.getWriter().println(pcResv);
		}
		  //String email = "a519486@naver.com";
	}
}
