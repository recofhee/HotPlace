package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.ReplyVo;


@WebServlet("/replyWrite")
public class ReplyWriteServlet extends HttpServlet{

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int cbNum = Integer.parseInt(req.getParameter("cb_num"));
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String content = req.getParameter("content");
		
		ReplyVo rVo = new ReplyVo();
		rVo.setCbNum(cbNum);
		rVo.setEmail(email);
		rVo.setName(name);
		rVo.setContent(content);
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.insertReply(rVo);
		
		ReplyVo oneRVo = bDao.selectOneReplyByNum(cbNum);
		
		JSONArray array = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("reNum", oneRVo.getReNum());
		jsonObject.put("cbNum", oneRVo.getCbNum());
		jsonObject.put("email", oneRVo.getEmail());
		jsonObject.put("name", oneRVo.getName());
		jsonObject.put("writeDate", oneRVo.getWriteDate());
		jsonObject.put("content", oneRVo.getContent());
		
		array.add(jsonObject);
		
		resp.getWriter().print(array);
	}
	
}
