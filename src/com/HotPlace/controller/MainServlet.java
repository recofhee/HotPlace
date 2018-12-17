package com.HotPlace.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.HotPlace.dao.BoardDAO;
import com.HotPlace.dao.BookmarkDao;
import com.HotPlace.dao.MemberDao;
import com.HotPlace.dao.PcDao;
import com.HotPlace.dao.PlayDao;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.BookmarkVo;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.PcVo;
import com.HotPlace.vo.PlayVo;
import com.HotPlace.vo.ResvVo;
import com.HotPlace.vo.TokenVo;
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String email = null;
		String url ="section.jsp";
		HttpSession session =req.getSession();
		
		/*//다음 auoth 닉네임과 아디디 가져옴
		String s = req.getParameter("str");
		String[] aouth = s.split(",");
		int id = Integer.parseInt(aouth[0]);
		String nick_name = aouth[1];
		MemberDao mDao = MemberDao.getInstance();
		TokenVo tVo = new TokenVo();
		tVo.setNick_name(nick_name);
		tVo.setId(id);
		//tVo.setEmail(email);
		//tVo.setGender(gender);
		//tVo.setBirthdate(birthdate);
		mDao.insertTokenMember(tVo);
		System.out.println(aouth);*/

		if(session.getAttribute("loginUser")!= null) {
			MemberVo vo1 = (MemberVo) session.getAttribute("loginUser");
			email = vo1.getEmail();
			url="section.jsp";
		}
		/*else {
			email = req.getParameter("email");
		}*/
		//String authObj = req.getParameter("authObj");
		//System.out.println(authObj);
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> vo = dao.gameBoardList();
		req.setAttribute("boardList", vo);
		
		String play = "https://www.youtube.com/gaming/trending";
		org.jsoup.Connection.Response html = Jsoup.connect(play).method(org.jsoup.Connection.Method.GET).execute();

		PlayDao pDao = PlayDao.getInstance();
		PlayVo pVo = null;
		Document doc = html.parse();
		Elements els = doc.select("li.channels-content-item");
		int i = 0;
		for (Element e : els) { // 74
			String imgUrl = e.select("img").attr("data-thumb");
			if (imgUrl.length() > 0) {
				imgUrl = imgUrl.substring(0, imgUrl.indexOf("?"));
				Elements elements = e.select(".yt-uix-sessionlink.yt-uix-tile-link");
				Element element = null;
				String title = ""; 
				String href = "";
				element = elements.first();
				title = element.text();
				href = element.attr("href");
				if (i >= 3 && i <= 14) {
					pVo = new PlayVo(i - 2, title, href.substring(9), imgUrl);
					pDao.updateVideo(pVo);
				}
				if (i >= 15 && i <= 26) {
					pVo = new PlayVo(i - 2, title, href.substring(9), imgUrl);
					pDao.updateVideo(pVo);
				}
				if (i == 26) {
					break;
				}
				i++;
			}
		}
		
		List<PlayVo> List = new ArrayList<>(pDao.videoList3());
		List<PlayVo> Live = new ArrayList<>(pDao.liveList3());
		req.setAttribute("List", List);
		req.setAttribute("Live", Live);
		
		BookmarkDao markdao = BookmarkDao.getInstance();
		List<BookmarkVo> markVo = markdao.selectBookMarkByNum(email);
		req.setAttribute("markVo", markVo);
		req.getRequestDispatcher(url).forward(req, resp);
	}
}
