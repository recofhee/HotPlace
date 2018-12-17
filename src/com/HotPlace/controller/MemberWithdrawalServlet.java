package com.HotPlace.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.jar.JarException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.aso.a;

import org.json.simple.JSONArray;

import com.HotPlace.dao.BookmarkDao;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.dao.PcDao;
import com.HotPlace.util.SHA256;
import com.HotPlace.vo.MemberVo;


@WebServlet("/memberWithdrawal")
public class MemberWithdrawalServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		HttpSession session =req.getSession();
		String email = "";
		String url= "memberWithdrawal.jsp";
		if(session.getAttribute("loginUser")!= null) {
			MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
			email = vo1.getEmail();
			url="memberWithdrawal.jsp";
		}
		
		MemberDao dao = MemberDao.getInstance();
		MemberVo vo = dao.getMember(email);
		req.setAttribute("vo", vo);
		//System.out.println(vo);
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
		String email = "";
		String url= "memberWithdrawal.jsp";
		if(session.getAttribute("loginUser")!= null) {
			MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
			email = vo1.getEmail();
		}
		//String url= "memberWithdrawal.jsp";
		req.setCharacterEncoding("UTF-8");
		SHA256 sha = new SHA256();
		//String email = req.getParameter("email");
		String pw = sha.testSHA256(req.getParameter("pw"));
		
		System.out.println("pw ::"+pw);
		System.out.println("email::" +email);
		
		MemberDao dao = MemberDao.getInstance();
		PcDao pcdao = PcDao.getInstance();
		BookmarkDao bdao = BookmarkDao.getInstance();
		MemberVo vo = dao.getMember(email);
		int result = dao.userCheck(email, pw);
        /*  
          resp.setContentType("application/json");
          resp.setCharacterEncoding("utf-8");
          PrintWriter out = resp.getWriter();

          JsonObject json = new JsonObject();

          json.addProperty("result", result);
          out.print(json.toString());*/
		
		
		
		if(result ==1) {
//			JSONArray array = pcdao.selectResvByNum(email);
//			int a = array.size();
//			System.out.println("a :: "+ a);
//			System.out.println("array :: "+ array);
//			if(a != 0) {
//				System.out.println("vo:::"+vo);
//				req.setAttribute("vo", vo);
//				req.setAttribute("message", "예약 정보가 있습니다.");
				bdao.deleteAllBookMarkLike(email);
				dao.deleteMember(email);
				session.invalidate();
				url = "main";
				resp.sendRedirect(url);
//				req.getRequestDispatcher(url).forward(req, resp);
//				
//			}else if(a == 0){
//				System.out.println(email);
				
//				resp.sendRedirect("main");
//				System.out.println("뭐지");
//			}
		}else if(result ==0){
			req.setAttribute("vo", vo);
			req.setAttribute("message" , "비밀번호가 맞지 않습니다.");
			url = "memberWithdrawal.jsp";
			req.getRequestDispatcher(url).forward(req, resp);
		}
	}
}
