package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.CardBoardLikeVo;
import com.HotPlace.vo.CardBoardVo;

@WebServlet("/cardBoardIncrLike")
public class CardBoardIncrLikeServlet extends HttpServlet{

		@Override
		public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("UTF-8");
			
			int cbNum = Integer.parseInt(req.getParameter("cb_num"));
			String email = req.getParameter("email");
			
			System.out.println("cbNum : "+cbNum);
			System.out.println("email : "+email);
			
			CardBoardLikeVo lVo = new CardBoardLikeVo();
			lVo.setCbNum(cbNum);
			lVo.setEmail(email);
	        
			CardBoardDao bDao = CardBoardDao.getInstance();
			bDao.updateIncrLikeCnt(cbNum);
			bDao.insertCardBoardLike(lVo);
			
			CardBoardVo bVo = bDao.selectOneBoardByNum(cbNum);
			req.setAttribute("board", bVo);
			System.out.println(bVo.getLikeCnt());
			
			resp.getWriter().print(bVo.getLikeCnt());
	}
	
}
