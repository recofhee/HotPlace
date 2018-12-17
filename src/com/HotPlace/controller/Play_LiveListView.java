package com.HotPlace.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.PlayDao;
import com.HotPlace.dao.Play_ReviewDao;
import com.HotPlace.vo.PlayVo;
import com.HotPlace.vo.Play_ReviewVo;

@WebServlet("/liveview")
public class Play_LiveListView extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 넘어올 객체를 utf-8 방식으로 처리한다.
		req.setCharacterEncoding("utf-8");
		// 전 화면에서 넘어온 값을 문자열로 담는다
		String link = req.getParameter("link");
		// 문자열에 담은 것을 다음 페이지로 넘겨 주기위해 세션에 담는다
		req.setAttribute("link", link);
		// 목록에 출력하기위해 이전에 있던것을 새로 리스트에 담아서 - 세션 처리 해준다.
		PlayDao Dao = PlayDao.getInstance();
		List<PlayVo>List = Dao.liveList();
		req.setAttribute("List", List);
		
		// 선택한 동영상에 댓글을 세션에 담는다 - 없다면 여기는 null로 처리를 안한다.
		Play_ReviewDao RDao = Play_ReviewDao.getInstance();
		List<Play_ReviewVo> reply = RDao.replyList(link);
		req.setAttribute("replyList", reply);
		
		// 선택한 동영상과 페이지를 이동 시킨다.
		RequestDispatcher dis = req.getRequestDispatcher("video/LiveView.jsp");
		dis.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 모든 처리를 get방식으로 한다
		doGet(req, resp);
	}
}