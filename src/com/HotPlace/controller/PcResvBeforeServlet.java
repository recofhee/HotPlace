package com.HotPlace.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.SeatVo;

@WebServlet("/pcResvBefore")
public class PcResvBeforeServlet extends HttpServlet {
	  @Override 
	  protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException { 
		req.setCharacterEncoding("UTF-8"); 
		PcDao dao = PcDao.getInstance();
		int pc_num = Integer.parseInt(req.getParameter("pc_num")); 
		PcVo vo = dao.selectOnePcByNum(pc_num);
		
		String email = req.getParameter("email");
		
		// 생일과 닉네임을 비교하여 0,1 표시
		MemberDao mdao = MemberDao.getInstance();
		int result = mdao.userInform(email);
		if(result == 0) {
			req.setAttribute("pc", vo);
			req.getRequestDispatcher("pcResvBefore.jsp").forward(req, resp);
		}
		else if(result == 1){
			// 예약일 지나 있으면 좌석 선택 가능하게 변경
			dao.updateSeatStateZero();
			
			// 생일을 가져온 dao
			req.setAttribute("pc", vo);
			MemberVo birth = dao.checkBirth(email);
			System.out.println("생일::"+birth.getBirth());
			req.setAttribute("birth", birth.getBirth());
			
			List<SeatVo> sList = dao.selectAllSeatsByPcNum(pc_num);
			req.setAttribute("seatList", sList);
			System.out.println("sList : " + sList);
			
			req.getRequestDispatcher("pcResv.jsp").forward(req, resp);
		} 
/*		else {
			// 생일을 가져온 dao
			req.setAttribute("pc", vo);
			MemberVo birth = dao.checkBirth(email);
			req.setAttribute("birth", birth);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} 
*/		else {
			req.getRequestDispatcher("main").forward(req, resp);
			//System.out.println("회원가입을해주세용");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		PcDao dao = PcDao.getInstance();
		
		// 예약일 지나 있으면 좌석 선택 가능하게 변경
		dao.updateSeatStateZero();
					
		int pc_num = Integer.parseInt(req.getParameter("pc_num")); 
		System.out.println(pc_num);
		
		String email = req.getParameter("email");
		System.out.println("이메일 : " + email);
		// 입력받은 값을 업데이트
		MemberDao mdao = MemberDao.getInstance();

		String birthY = req.getParameter("birthY");
		String birthM = req.getParameter("birthM");
		String birthD = req.getParameter("birthD");
		String birth = birthY + birthM + birthD;
		String gender = req.getParameter("gender");			 
		
		MemberVo vo = new MemberVo();
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setEmail(email);
		mdao.updateDetailMember(vo);
		PcVo pcvo = dao.selectOnePcByNum(pc_num);
		System.out.println(pcvo);
		
		List<SeatVo> sList = dao.selectAllSeatsByPcNum(pc_num);
		
		req.setAttribute("seatList", sList);
		
		System.out.println("sList : " + sList);
		
		req.setAttribute("pc", pcvo);
		req.setAttribute("birth", birth);
		req.getRequestDispatcher("pcResv.jsp").forward(req, resp);
		}
	}