package com.HotPlace.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;

public class CardBoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String url = "cardBoardUpdate.jsp";
		
		int cbNum = Integer.parseInt(req.getParameter("cb_num"));
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.updateReadCount(cbNum);
		
		CardBoardVo bVo = bDao.selectOneBoardByNum(cbNum);
		req.setAttribute("board", bVo);
		
		List<GalleryVo> gVo = bDao.selectAllGalleries(cbNum);
		req.setAttribute("galleryList", gVo);
		
		int page = Integer.parseInt(req.getParameter("page"));
		req.setAttribute("page", page);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
}
