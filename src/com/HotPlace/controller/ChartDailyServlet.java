package com.HotPlace.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet("/chartDaily")
public class ChartDailyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/chart").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		//String year = req.getParameter("nowYear");
		//String month = req.getParameter("month");
		
		Calendar cal = Calendar.getInstance();
		
		System.out.println(cal.get(Calendar.YEAR));
		System.out.println(cal.get(Calendar.MONTH) + 1);
		
		//int year = new Date().getYear();
		//int month = new Date().getMonth() + 1;
		
		int year = cal.get(Calendar.YEAR);
		int month = Integer.parseInt(req.getParameter("month"));
		
		ChartDao cDao = ChartDao.getInstance();
		
		List<ChartVo> cVo = cDao.getResvCntByDay(year, month);
		List<ChartVo> cVo2 = cDao.getJoinCntByDay(year, month);
		
		JSONArray array = new JSONArray();
		for(ChartVo c : cVo) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("date", c.getDate());
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
