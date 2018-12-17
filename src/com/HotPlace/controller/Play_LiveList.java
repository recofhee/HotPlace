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

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.HotPlace.dao.PlayDao;
import com.HotPlace.dao.Play_ReviewDao;
import com.HotPlace.vo.PlayVo;
import com.HotPlace.vo.Play_ReviewVo;

@WebServlet("/live")
public class Play_LiveList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 모든 것을 utf- 8로 처리
		req.setCharacterEncoding("utf-8");
		// 크롤링을 할 위치
		String url = "https://www.youtube.com/gaming/trending";
		//log, 어디로 접속하는지 알기 위함
		System.out.println(url + "::live");
		
		// 크롤링할 HTML을 가져온다.
		org.jsoup.Connection.Response html = Jsoup.connect(url).method(org.jsoup.Connection.Method.GET).execute();
		// 작업을 실행할 dao 생성
		PlayDao Dao = PlayDao.getInstance();
		// 객체 담을 vo 생성
		PlayVo Vo = null;
		// 모든 html 중 화면에 나오는 html 가져온다
		Document doc = html.parse();
		//html 중 필요한 데이터를 가진 요소를 선택한다.
		Elements els = doc.select("li.channels-content-item");

		int i = 0;
		// 일정 횟수 만큼 요소를 처리하여 vo객체에 담아 dao로 처리 한다.
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
				// 특정 위치 부터 vo에 담고 처리 한다.
				if (i >= 3 && i <= 14) {
					Vo = new PlayVo(i - 2, title, href.substring(9), imgUrl);
					Dao.updateVideo(Vo);
					//System.out.println(Vo);
				}
				if (i >= 15 && i <= 26) {
					Vo = new PlayVo(i - 2, title, href.substring(9), imgUrl);
					Dao.updateVideo(Vo);
					//System.out.println(Vo);
				}
				// 일정량 담으면 정지 한다.
				if (i == 26) {
					break;
				}
				// 진행 정도를 나타 낸다.
				i++;
			}
		}
		// 생성된 객체를 화면에 출력하기 위해 리스트에 담는다
		List<PlayVo> List = new ArrayList<>(Dao.liveList());
		// 세션에 담아 다음 페이지로 보낸다.
		req.setAttribute("List", List);
		
		// 여기서 처음 화면에 나타낼 랜덤의 동영상을 가져온다
		int r = (int)(Math.random()*12);
		PlayVo one = List.get(r);
		req.setAttribute("one", one);
		
		// 화면에 나타낼 댓글 목록을 세션에 담는다
		Play_ReviewDao RDao = Play_ReviewDao.getInstance();
		List<Play_ReviewVo> reply = RDao.replyList(one.getVideo_url());
		req.setAttribute("replyList", reply);
		
		RequestDispatcher dis = req.getRequestDispatcher("video/Live.jsp");
		dis.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 모든 처리를 get방식으로 한다
		doGet(req, resp);
	}
}
