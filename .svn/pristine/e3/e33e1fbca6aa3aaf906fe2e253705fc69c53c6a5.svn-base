package com.HotPlace.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HotPlace.dao.BoardCommentDAO;
import com.HotPlace.util.DBManager;
import com.HotPlace.vo.BoardCommentVO;

public class BoardCommentService {
	private static BoardCommentService service = new BoardCommentService();
	private BoardCommentService() {}
	
	public static BoardCommentService getInstance() {
		return service;
	}
	
	public boolean update(BoardCommentVO cvo) {
		Connection conn = DBManager.getConnection();
		BoardCommentDAO dao = BoardCommentDAO.getInstance();
		
		boolean flag = false;
		
		try {
			BoardCommentVO res = dao.getOne(cvo.getCoNum());
			dao.update(cvo);
			flag = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		DBManager.close(conn);
		return flag;
	}
	
	public boolean delete(int coNum) {
		Connection conn = DBManager.getConnection();
		BoardCommentDAO dao = BoardCommentDAO.getInstance();
		
		boolean flag = false;
		
		try {
			BoardCommentVO res = dao.getOne(coNum);
			dao.delete(coNum);
			flag = true;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		DBManager.close(conn);
		return flag;
	}
	
	
	public void insert(BoardCommentVO cvo) {
		Connection conn = DBManager.getConnection();
		BoardCommentDAO dao = BoardCommentDAO.getInstance();
		dao.setCon(conn);
		
		try {
			dao.insert(cvo);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		DBManager.close(conn);
	}
	
	public int getCount(int coNum) {
		Connection conn = DBManager.getConnection();
		BoardCommentDAO dao = BoardCommentDAO.getInstance();
		dao.setCon(conn);
		
		int cnt = 0;
		try {
			cnt = dao.getCount(coNum);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		DBManager.close(conn);
		return cnt;
	}
	
	public ArrayList<BoardCommentVO> getList(int coNum) {
		ArrayList<BoardCommentVO> list = null;
		Connection conn = DBManager.getConnection();
		BoardCommentDAO dao = BoardCommentDAO.getInstance();
		dao.setCon(conn);
		
		try {
			list = dao.getList(coNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBManager.close(conn);
		return list;
	}
	
}
