package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.BookmarkDao;
import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.BookmarkVo;
import com.HotPlace.vo.CardBoardLikeVo;
import com.HotPlace.vo.CardBoardVo;

@WebServlet("/bookmarkIns")
public class BookmarkInsServlet extends HttpServlet{

		@Override
		public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("UTF-8");
			
			String email = req.getParameter("email");
			int pc_num = Integer.parseInt(req.getParameter("pc_num"));
			
			System.out.println("pc_num : "+ pc_num);
			System.out.println("email : "+ email);
			
			BookmarkVo bvo = new BookmarkVo();
			bvo.setEmail(email);
			bvo.setPc_num(pc_num);
			
			BookmarkDao bdao = BookmarkDao.getInstance();
			bdao.insertBookmark(bvo);
			
			bvo = bdao.selectOneBookmarkByNum(email);
			req.setAttribute("bookmark", bvo);
			
	}
	
}
