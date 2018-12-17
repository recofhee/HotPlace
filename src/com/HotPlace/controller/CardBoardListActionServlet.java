package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.Paging;
import com.HotPlace.vo.ReplyVo;

@WebServlet("/cardBoardListAction")
public class CardBoardListActionServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		
		int totalCount = bDao.getCardBoardCnt();
	    int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));

	    System.out.println("c page before : " + page);
	     
	    Paging paging = new Paging();
	    paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
	    paging.setPageSize(9); // 한 페이지에 불러낼 게시물의 개수 지정
	    paging.setTotalCount(totalCount);
	     
	    page = (page - 1) * 9; // select해 오는 기준을 구한다.
	    
	    System.out.println("c page after : " + page);
	    
	    List<CardBoardVo> bVo = bDao.selectAllBoards(page+1, page+paging.getPageSize());
	    req.setAttribute("boardList", bVo);
	    req.setAttribute("paging", paging);
	    
	    List<GalleryVo> gVo = bDao.selectAllGallery();
		req.setAttribute("galleryList", gVo);

		JSONArray array = new JSONArray();
		for(CardBoardVo c : bVo) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("pageNo", paging.getPageNo());
			jsonObject.put("pageSize", paging.getPageSize());
			jsonObject.put("pageTotalCount", paging.getTotalCount());
			jsonObject.put("startPageNo", paging.getStartPageNo());
			jsonObject.put("endPageNo", paging.getEndPageNo());
			jsonObject.put("prevPageNo", paging.getPrevPageNo());
			jsonObject.put("nextPageNo", paging.getNextPageNo());
			jsonObject.put("cbNum", c.getCbNum());
			jsonObject.put("email", c.getEmail());
			jsonObject.put("name", c.getName());
			jsonObject.put("title", c.getTitle());
			jsonObject.put("content", c.getContent());
			jsonObject.put("thumbnail", c.getThumbnail());
			jsonObject.put("writeDate", c.getWriteDate().toString());
			jsonObject.put("likeCnt", c.getLikeCnt());
			jsonObject.put("readCnt", c.getReadCnt());
			
			array.add(jsonObject);
		}
		resp.getWriter().print(array);
	}

}
