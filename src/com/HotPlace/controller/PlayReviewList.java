package com.HotPlace.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.HotPlace.dao.Play_ReviewDao;
import com.HotPlace.vo.Play_ReviewVo;


@WebServlet("/reviewlist")
public class PlayReviewList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String url = req.getParameter("play_url");
		//System.out.println("decode before ? ::: "+url);
		
		url = URLDecoder.decode(url, "utf-8");
		//System.out.println("after play_url ? ::: "+url);
		
		Play_ReviewDao dao = Play_ReviewDao.getInstance();
		
		List<Play_ReviewVo> reply = dao.replyList(url);
		
		JSONObject object = new JSONObject();
		object.put("id", reply.get(0).getUser_id());
		object.put("content", reply.get(0).getRe_content());
		object.put("date", reply.get(0).getReg_date());
		object.put("re_num", reply.get(0).getRe_num());
		object.put("link", url);
		resp.getWriter().print(object.toJSONString());
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
