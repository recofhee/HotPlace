package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.Play_ReviewDao;
import com.HotPlace.vo.Play_ReviewVo;


@WebServlet("/playreview")
public class PlayInsertReview extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String url = req.getParameter("play_url");
		String user_id = req.getParameter("user_id");
		String content = req.getParameter("re_content");

		Play_ReviewVo vo = new Play_ReviewVo();
		vo.setVideo_url(url);
		vo.setUser_id(user_id);
		vo.setRe_content(content);
		
		Play_ReviewDao dao = Play_ReviewDao.getInstance();
		dao.insertReply(vo);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
