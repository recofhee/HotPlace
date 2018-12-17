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
@WebServlet("/chartOne")
public class ChartOneServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/chart").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		ChartDao cDao = ChartDao.getInstance();
		
		List<ChartVo> cVo = cDao.getGameGenreNBirth();
		
		System.out.println("chart vo : " + cVo);
		
		JSONArray array = new JSONArray();
		for(ChartVo c : cVo) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("genre", c.getGameGenre());
			jsonObject.put("birthdate", c.getBirthdate());
			jsonObject.put("generation", c.getGeneration());
			
			array.add(jsonObject);
		}
		resp.getWriter().print(array);
	}

}
