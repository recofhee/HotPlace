package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.action.Action;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.vo.MemberVo;

@WebServlet("/cardBoardServlet")
public class CardBoardServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String command = req.getParameter("command");
		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command);

		String email = req.getParameter("email");
		MemberDao dao = MemberDao.getInstance();
		MemberVo vo = dao.getMember(email);

		if(vo != null && action != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", vo);
			action.execute(req, resp);
		} else if(action != null) {
			action.execute(req, resp);
		}
	}

}

