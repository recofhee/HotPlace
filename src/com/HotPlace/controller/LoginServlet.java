package com.HotPlace.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.HotPlace.dao.BoardDAO;
import com.HotPlace.dao.BookmarkDao;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.dao.PcDao;
import com.HotPlace.dao.PlayDao;
import com.HotPlace.util.SHA256;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.BookmarkVo;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.PlayVo;
import com.HotPlace.vo.ResvVo;
@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 해시 생성기인 sha256 을 생성한다
		SHA256 sha = new SHA256();
		
		String url = "main";
		//로그인시 넘어온 id란의 email을 공백을 지우고 가져온다.
		String email = req.getParameter("email").trim();
		// 로그인에 넘어온 비밀번호를 해시생성기 sha256으로 해시코드를 만든다. 암호화시킨다. 비밀번호 공백을 지운 상태로
		String pw = sha.testSHA256(req.getParameter("pw").trim());
		// 생성된 해시값과 db안에 있는 값과 일치하는지 비교한다
		MemberDao dao = MemberDao.getInstance();
		int result = dao.userCheck(email, pw);
		// 비교 결과 가 같으면 1, 패스워드의 해시값이 다르면 0, id부터 존재 안하면 -1 을 반환하여 처리한다.
		if(result==1) {
			MemberVo vo = dao.getMember(email);
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(60 * 60);	// 세션 유지시간 설정. (초*분)
			session.setAttribute("loginUser", vo);
			resp.sendRedirect(url);
			
		}else if(result ==0) {
			req.setAttribute("message", "비밀번호가 맞지 않습니다");
			url = "login.jsp";
			req.getRequestDispatcher(url).forward(req, resp);
		}else if(result==-1) {
			req.setAttribute("message", "존재하지 않는 회원입니다.");
			url = "login.jsp";
			req.getRequestDispatcher(url).forward(req, resp);
		}
	}
}
