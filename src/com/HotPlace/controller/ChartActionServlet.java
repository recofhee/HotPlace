package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.HotPlace.dao.ChartDao;
import com.HotPlace.vo.ChartVo;
@WebServlet("/chart")
public class ChartActionServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		ChartDao cDao = ChartDao.getInstance();
		
		int memberCnt = cDao.getMemberCnt();
		int pcCnt = cDao.getPcCnt();
		
		req.setAttribute("memberCnt", memberCnt);
		req.setAttribute("pcCnt", pcCnt);
		
		req.getRequestDispatcher("chart.jsp").forward(req, resp);
	}

}
