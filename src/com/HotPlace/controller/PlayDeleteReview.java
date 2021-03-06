package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.PlayDao;
import com.HotPlace.dao.Play_ReviewDao;
import com.HotPlace.vo.PlayVo;
import com.HotPlace.vo.Play_ReviewVo;


@WebServlet("/reviewdelete")
public class PlayDeleteReview extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(req.getParameter("re_num"));
		
		Play_ReviewDao dao = Play_ReviewDao.getInstance();
		int result = dao.deleteReply(num);
		
		resp.getWriter().println(result);
		
		/*req.setAttribute("link", req.getParameter("link"));*/
		
		/*if (loc.equals("utube")) {
			RequestDispatcher dis = req.getRequestDispatcher("/utubeview");
			dis.forward(req, resp);
		}else if(loc.equals("live")){
			RequestDispatcher dis = req.getRequestDispatcher("/liveview");
			dis.forward(req, resp);
		}else if(req.getParameter("re_num") == null){
			RequestDispatcher dis = req.getRequestDispatcher("/main");
			dis.forward(req, resp);
		}else {
			RequestDispatcher dis = req.getRequestDispatcher("/main");
			dis.forward(req, resp);
		}*/
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
