package com.HotPlace.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;

import com.HotPlace.dao.PcDao;
@WebServlet("/pcListJson")
public class PcSearchListServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		      PcDao dao = PcDao.getInstance();
		      String input = req.getParameter("url");
		      JSONArray pcList = dao.selectPcList(input);
		      req.setAttribute("pcList", pcList);
		      resp.setContentType("text/html; charset=utf-8");
		      resp.getWriter().println(pcList);
	}
}
