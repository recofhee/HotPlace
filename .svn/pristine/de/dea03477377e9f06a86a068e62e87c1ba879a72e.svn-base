package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.ResvVo;
@WebServlet("/resvView")
public class PcResvViewServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String resv = req.getParameter("resv");
		int resv_num = Integer.parseInt(resv);
		System.out.println(resv_num);
		PcDao dao = PcDao.getInstance();
		ResvVo vo = dao.selectOneResvViewNum(resv_num);
		req.setAttribute("resv", vo);
		req.setAttribute("resv_num", resv_num);
		req.getRequestDispatcher("pcResvAfter.jsp").forward(req, resp);
		
	}
}
