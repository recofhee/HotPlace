package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.ResvVo;
@WebServlet("/pcResvHistory")
public class PcResvHistoryServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		PcDao dao = PcDao.getInstance();
		if(session.getAttribute("loginUser")!= null){
			String email = null;
			MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
			email = vo1.getEmail();
			List<ResvVo> vo = dao.resvAll(email);
			req.setAttribute("ResvList", vo);
			System.out.println(vo);
			req.getRequestDispatcher("pcResvHistory.jsp").forward(req, resp);
		}
	}
}
