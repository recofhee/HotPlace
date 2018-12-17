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

import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.ReplyVo;
import com.HotPlace.vo.SeatVo;

@WebServlet("/pcSeatList")
public class pcSeatListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int pc_num = Integer.parseInt(req.getParameter("pc_num"));
		String startDt = req.getParameter("start_date");
		String endDt = req.getParameter("end_date");
		
		PcDao dao = PcDao.getInstance();

		List<SeatVo> sList = dao.selectAllSeatsByPcNumNDate(pc_num, startDt, endDt);
		req.setAttribute("seatList", sList);
		System.out.println("sList : " + sList);
		System.out.println("startDt : " + startDt);
		System.out.println("endDt : " + endDt);
		
		JSONArray array = new JSONArray();
		for(SeatVo s : sList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("seatIdx", s.getSeatIdx());
			jsonObject.put("seatNum", s.getSeatNum());
			jsonObject.put("seatType", s.getSeatType());
			jsonObject.put("isChoosen", s.getIsChoosen());
			
			array.add(jsonObject);
		}
		resp.getWriter().print(array);
		
	}
}
