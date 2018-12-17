package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;

@WebServlet("/replyDelete")
public class ReplyDeleteServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int reNum = Integer.parseInt(req.getParameter("reNum"));
		int cbNum = Integer.parseInt(req.getParameter("cbNum"));
		
		System.out.println("reNum : "+reNum);
		System.out.println("cbNum : "+cbNum);
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.deleteReply(reNum);

		//resp.sendRedirect("cardBoardServlet?command=board_view&cb_num="+cbNum);
		resp.getWriter().print("success");
	}
	
}
