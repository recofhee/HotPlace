package com.HotPlace.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;

public class CardBoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cbNum = req.getParameter("cb_num");
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.deleteBoard(cbNum);
		bDao.deleteBoardReplies(cbNum);
		bDao.deleteBoardGalleries(cbNum);

		resp.sendRedirect("cardBoardList");
	}
	
}
