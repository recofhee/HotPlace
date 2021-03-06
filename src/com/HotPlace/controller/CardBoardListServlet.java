package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.Paging;

@WebServlet("/cardBoardList")
public class CardBoardListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		/*String email = req.getParameter("email");
		MemberDao dao = MemberDao.getInstance();
		MemberVo vo = dao.getMember(email);
		//MemberVo vo = dao.getMember("email@email.com");
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", vo);*/
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		
		int totalCount = bDao.getCardBoardCnt();
	    int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
	     
	    Paging paging = new Paging();
	    paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
	    paging.setPageSize(9); // 한 페이지에 불러낼 게시물의 개수 지정
	    paging.setTotalCount(totalCount);
	     
	    page = (page - 1) * 9; // select해 오는 기준을 구한다.
	    
	    List<CardBoardVo> bVo = bDao.selectAllBoards(page+1, page+paging.getPageSize());
	    req.setAttribute("boardList", bVo);
	    req.setAttribute("paging", paging);
	    
		req.getRequestDispatcher("cardBoardList.jsp").forward(req, resp);
	}
}
