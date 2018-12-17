package com.HotPlace.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.dao.CardBoardDao;

@WebServlet("/galleryDelete")
public class GalleryDeleteServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int gNum = Integer.parseInt(req.getParameter("galley_num"));
		
		System.out.println("gNum : " + gNum);
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		bDao.deleteGallery(gNum);
		
		resp.getWriter().print("success");
	}
	
}
