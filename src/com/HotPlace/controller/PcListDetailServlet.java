package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.BookmarkDao;
import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.BookmarkVo;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.PcVo;

import sun.swing.SwingUtilities2.Section;
@WebServlet("/detail")
public class PcListDetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pc_num = Integer.parseInt(req.getParameter("pc_num"));
		BookmarkVo bvo = new BookmarkVo();
		BookmarkDao bdao = BookmarkDao.getInstance();
		
		//String email = req.getParameter("email");
		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginUser")!=null) {
			MemberVo vo1 = (MemberVo)session.getAttribute("loginUser");
			String email = vo1.getEmail();
			bvo = bdao.selectOneBookmarkByNum(email, pc_num);
		}
		
		//System.out.println("이메일 확인 ::::: "+vo1.getEmail());
		
		//vo1.setEmail((String) session.getAttribute("loginUser"));
		//System.out.println("와우"+vo1.getEmail());
		

		PcDao dao = PcDao.getInstance();
		PcVo vo = dao.selectOnePcByNum(pc_num);
		
		
		System.out.println("세션 시간 확인 : " + session.getMaxInactiveInterval());
		
		

		//System.out.println("pcDetail pc_num : " + pc_num);
		
		req.setAttribute("like", bvo);
		req.setAttribute("pc", vo);
		req.getRequestDispatcher("detail.jsp").forward(req, resp);
	}
}
