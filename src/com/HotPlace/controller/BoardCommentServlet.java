package com.HotPlace.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.HotPlace.vo.BoardCommentVO;

@WebServlet("/commnet.g")
public class BoardCommentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		int exe = Integer.parseInt(req.getParameter("exe"));
		int coNum = Integer.parseInt(req.getParameter("coNum"));
		int parentNum = Integer.parseInt(req.getParameter("parentNum"));
		String coId = req.getParameter("coId");
		String coContent = req.getParameter("coContent");
		
		int currentPage = Integer.parseInt(req.getParameter("page"));
		BoardCommentVO vo = new BoardCommentVO();
		vo.setCoNum(coNum);
		vo.setParentNum(parentNum);
		vo.setCoContent(coContent);
		vo.setCoId(coId);
		
		BoardCommentService comment = BoardCommentService.getInstance();
		
		out.print("<script>");
		if(exe == 1) {
			comment.insert(vo);
		} else if (exe == 2) {
			boolean res = comment.update(vo);
			if(res) {
				out.print("alert('댓글 수정 완료!');");
			} 
		} else {
			boolean res = comment.delete(coNum);
			if(res) {
				out.print("alert('댓글 수정 완료!');");
		} 
		out.print("location.href = 'boardView.g?num=" + parentNum + "&page=" + currentPage + "&exec=comment'");
		out.print("</script>");
			
		}
	}
	
}
