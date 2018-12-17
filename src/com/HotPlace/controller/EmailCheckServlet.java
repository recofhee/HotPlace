package com.HotPlace.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


// 회원가입용 인증번호 이메일 전송 서블릿
@WebServlet("/send.do")
public class EmailCheckServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "rodjfuqek1");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new MyAuthentication();
		
		//session 생성
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		JSONObject object = new JSONObject();
		try {
			// 편지 보낸 시간
			msg.setSentDate(new Date());
			
			
			
			// 이메일 발신자
			msg.setFrom(new InternetAddress("rodjfuqek1@gmail.com", "핫플레이스", "utf-8"));
			
			
			// 이메일 수신자
			String email = req.getParameter("receiver");
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			// 이메일 제목
			msg.setSubject("[핫플레이스] 인증번호 입니다.", "UTF-8");
			
			
			// 이메일 내용
			String codeCheck = "" + getRandom();
			msg.setText(
					"<html>\r\n" + 
					"<head>\r\n" + 
					"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
					"<title>email test</title>\r\n" + 
					"</head>\r\n" + 
					"<body>\r\n" + 
					"<div style=\"box-shadow:5px 5px 15px gray; width: 800px;\">\r\n" + 
					"<div style=\"border: 0px solid gray; vertical-align: middle; margin: 0 auto; text-align: center; padding: 40px; \">\r\n" + 
					"		<div style=\"border-bottom: 1px solid lightgray; font-size: 20px; line-height: 3em; font-weight: bold; \">핫플레이스 회원가입용 인증번호 안내</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">안녕하세요! 저희 핫플레이스에 보내주신 관심에 감사드립니다.</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">저희 핫플레이스에서는 무분별한 회원가입을 방지하기 위해</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">이메일로 보내드린 인증코드를 입력해주셔야 가입이 진행 가능하답니다~</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">번거로우시더라도 회원가입을 위해 이메일에 함께 보내드린 코드를 꼭 입력해주세요!</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">감사합니다 ^^</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">코드 번호 : <strong style=\"line-height: 3em; font-size: 25px;  \">"+codeCheck+"</strong></div>\r\n" + 
					"		<div style=\"line-height: 3em; text-align: center;\"><img src=\"https://a519486.com/images/icon/HotPlace.png\" style=\"width: 40px\"></div>\r\n" + 
					"</div>\r\n" + 
					"</div>\r\n" + 
					"</body>\r\n" + 
					"</html>"
					, "UTF-8");
			
			
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			
			// 메일 보내기
			javax.mail.Transport.send(msg);
			System.err.println("보냄!");
			
			object.put("code", 1);
			object.put("code_check", codeCheck);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			object.put("code", 2);
			
		} finally {
			resp.getWriter().println(object.toJSONString());
		}
	}
	
	
	class MyAuthentication extends Authenticator {
		
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			String id = "rodjfuqek1";
			String pw = "dmfktckck!1";
			
			pa = new PasswordAuthentication(id,	pw);
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	
	private int getRandom(){
		int random = 0;
		random = (int) Math.floor((Math.random()*(99999-10000+1)))+10000;
		return random;
	}
	
}
