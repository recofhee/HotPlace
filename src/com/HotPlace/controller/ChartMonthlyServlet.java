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
@WebServlet("/chartMonthly")
public class ChartMonthlyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/chart").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String year = req.getParameter("nowYear");
		ChartDao cDao = ChartDao.getInstance();
		
		List<ChartVo> cVo = cDao.getResvCntByMonth(year);
		List<ChartVo> cVo2 = cDao.getJoinCntByMonth(year);
		
		JSONArray array = new JSONArray();
		for(ChartVo c : cVo) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("resvCnt", c.getCnt());
			
			array.add(jsonObject);
		}
		for(ChartVo c : cVo2) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("joinCnt", c.getCnt());
			
			array.add(jsonObject);
		}
		resp.getWriter().print(array);
	}

}
