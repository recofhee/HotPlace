package com.HotPlace.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.Paging;

@WebServlet("/boardList.g")
public class BoardListServlet extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      BoardDAO dao = BoardDAO.getInstance();
      
      String keyWord = req.getParameter("keyWord");
      String keyField = req.getParameter("keyField");
      System.out.println("req.getParameter(\"category_num\")" + req.getParameter("category_num") );
      int category_num = req.getParameter("category_num") == null || req.getParameter("category_num").equals("") ? 0 :Integer.parseInt(req.getParameter("category_num"));
      System.out.println("카테고리값 : " + category_num);
      
      int totalCount = dao.getBoardCnt(category_num ,keyField ,keyWord);
      int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
      
      
      
      Paging paging = new Paging();
      
      paging.setPageNo(page); // get방식의 parameter값으로 받은 page변수, 현재 페이지 번호
      paging.setPageSize(10); // 한 페이지에 불러낼 게시물의 개수 지정
      paging.setTotalCount(totalCount);
      page = (page - 1) * 10; // select해 오는 기준을 구한다.
      
      String email= null;
      HttpSession session =req.getSession();
      MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
      if(vo1 == null) {
         email = "guest";
      } else {
         email = vo1.getEmail();
      }
      req.setAttribute("email", email);
      
      
      List<BoardVO> vo = dao.gameBoardList(category_num, keyField, keyWord, page+1, page+paging.getPageSize());
      
      
      req.setAttribute("boardList", vo);
      req.setAttribute("paging", paging);
      
      
      System.out.println("투스티링" + paging.toString());
      
      
      req.getRequestDispatcher("boardList.jsp").forward(req, resp);

   }
   
   
}
