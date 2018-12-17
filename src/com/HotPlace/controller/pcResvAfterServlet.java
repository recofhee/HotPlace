package com.HotPlace.controller;
import java.io.IOException;
import java.lang.reflect.Array;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.DecodeException;
import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.PaymentVo;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.ResvVo;

@WebServlet("/pcResvAfter")
public class pcResvAfterServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String resvNum = req.getParameter("resv_num");
		ResvVo rVo = new ResvVo();
		PcDao dao = PcDao.getInstance();

		rVo = dao.selectOneResvViewNum(Integer.parseInt(resvNum));
		req.setAttribute("resv", rVo);
		req.setAttribute("resv_num", resvNum);
		req.getRequestDispatcher("pcResvAfter.jsp").forward(req, resp);
		
	}
}
