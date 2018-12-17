package com.HotPlace.controller;
import java.io.IOException;
import java.lang.reflect.Array;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.DecodeException;
import com.HotPlace.dao.PcDao;
import com.HotPlace.vo.PaymentVo;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.ResvVo;

@WebServlet("/pcResv")
public class pcResvServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		ResvVo rVo = new ResvVo();
		PaymentVo pVo = new PaymentVo();
		PcDao dao = PcDao.getInstance();
		
		String email = req.getParameter("email");
		String pc_num = req.getParameter("pc_num");
		String hours = req.getParameter("hours");
		String startDt = req.getParameter("startDt");
		String endDt = req.getParameter("endDt");
		String generation = req.getParameter("generation");
		String price = req.getParameter("price");
		String maxLen = req.getParameter("maxLen");
		String[] seat = req.getParameterValues("seats");
		int resv_num = dao.select();
		
		// 결제 방법
		String payHow = req.getParameter("payHow");
		
		// 결제 방법 : 카드
		String cardNum1 = req.getParameter("cardNum1");
		String cardNum2 = req.getParameter("cardNum2");
		String cardNum3 = req.getParameter("cardNum3");
		String cardNum4 = req.getParameter("cardNum4");
		String cardNum = null;
		if(cardNum1 != null && cardNum2 != null && cardNum3 != null && cardNum4 != null) {
			cardNum = cardNum1 + "-" + cardNum2 + "-" + cardNum3 + "-" + cardNum4;
		}
		String validMM = req.getParameter("validMM");
		String validYY = req.getParameter("validYY");
		String cardCheck = null;
		if(validMM != null && validYY != null) {
			cardCheck = validMM + "/" + validYY;
		}

		// 결제 방법 : 무통장
		String depositor = req.getParameter("depositor");
		String bank = req.getParameter("bank");
		
		pVo.setEmail(email);
		pVo.setResvNum(resv_num);
		pVo.setPayHow(payHow);
		pVo.setCardNum(cardNum);
		pVo.setCardCheck(cardCheck);
		pVo.setDepositor(depositor);
		pVo.setBank(bank);
		dao.insertPayment(pVo, Integer.parseInt(price));
		
		// 좌석별 저장
		for(int i = 0; i < seat.length; i++) {
			rVo.setResv_email(email);
        	rVo.setPc_num(pc_num);
			rVo.setResv_start(startDt);
			rVo.setResv_end(endDt);
			rVo.setSeat_idx(dao.selectOneSeatIdxByNum(pc_num, seat[i]));
			rVo.setResv_price(price);
			rVo.setGeneration(generation);
			rVo.setResv_hours(hours);
			rVo.setSeat_num(seat[i]);
			rVo.setResv_num(resv_num);
			rVo.setMaxLen(maxLen);
			rVo.setPayment(payHow);
			dao.insertReservation(rVo);
			dao.updateSeatStateOne(pc_num, seat[i]);
		}

		resp.getWriter().println(resv_num);
		
	}
}
