package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.Paging;
import com.HotPlace.vo.ReplyVo;

@WebServlet("/replyList")
public class ReplyListServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html; charset=UTF-8");
		int cbNum = Integer.parseInt(req.getParameter("cb_num"));
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		
		int totalCount = bDao.getReplyCnt(cbNum);
		int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int more = req.getParameter("more") == null ? 10 : Integer.parseInt(req.getParameter("more"));
		
		Paging paging = new Paging();
		paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한 페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10; // select해 오는 기준을 구한다.
		
		System.out.println(paging.toString());
		//req.setAttribute("paging", paging);
		
		List<ReplyVo> rVo = bDao.selectAllReplies(cbNum, page+1, page+paging.getPageSize());
		//req.setAttribute("replyList", rVo);
		
		//int replyCnt = bDao.getReplyCnt(cbNum);
		//req.setAttribute("replyCnt", replyCnt);
		
		System.out.println("cbNum : "+cbNum);
		System.out.println("page : "+page);
		System.out.println("more : "+more);
		
		JSONArray array = new JSONArray();
		for(ReplyVo r : rVo) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("pageNo", paging.getPageNo());
			jsonObject.put("pageSize", paging.getPageSize());
			jsonObject.put("pageTotalCount", paging.getTotalCount());
			jsonObject.put("startPageNo", paging.getStartPageNo());
			jsonObject.put("endPageNo", paging.getEndPageNo());
			jsonObject.put("prevPageNo", paging.getPrevPageNo());
			jsonObject.put("nextPageNo", paging.getNextPageNo());
			//jsonObject.put("replyCnt", replyCnt);
			jsonObject.put("reNum", r.getReNum());
			jsonObject.put("cbNum", r.getCbNum());
			jsonObject.put("email", r.getEmail());
			jsonObject.put("name", r.getName());
			jsonObject.put("writeDate", r.getWriteDate().toString());
			jsonObject.put("content", r.getContent());
			
			array.add(jsonObject);
		}
		resp.getWriter().print(array);
	}
	
}
