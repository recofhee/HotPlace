package com.HotPlace.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.CardBoardLikeVo;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;

public class CardBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "cardBoardDetail.jsp";
		
		int cbNum = Integer.parseInt(req.getParameter("cb_num"));
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.updateReadCount(cbNum);

		CardBoardVo bVo = bDao.selectOneBoardByNum(cbNum);
		req.setAttribute("board", bVo);
		
		List<GalleryVo> gVo = bDao.selectAllGalleries(cbNum);
		req.setAttribute("galleryList", gVo);
		
		CardBoardLikeVo lVo = bDao.selectOneCardBoardLikeByNum(cbNum);
		req.setAttribute("like", lVo);
		
		int replyCnt = bDao.getReplyCnt(cbNum);
		req.setAttribute("replyCnt", replyCnt);
		
		int page = Integer.parseInt(req.getParameter("page"));
		req.setAttribute("page", page);

		int prevPage = bDao.getCardBoardPrevNum(cbNum);
		req.setAttribute("prevPage", prevPage);
		int nextPage = bDao.getCardBoardNextNum(cbNum);
		req.setAttribute("nextPage", nextPage);
		
		System.out.println("cbNum : "+cbNum);
		System.out.println("prevPage : "+prevPage);
		System.out.println("nextPage : "+nextPage);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}