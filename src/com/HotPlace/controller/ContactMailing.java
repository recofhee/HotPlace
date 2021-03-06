package com.HotPlace.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

// 제휴문의 이메일 전송 서블릿

@WebServlet("/ContactMailing")
public class ContactMailing extends HttpServlet{

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
		
		String company = req.getParameter("company");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String content = req.getParameter("content");
//		String from = "rodjfuqek1@gmail.com";
		String to = "rodjfuqek1@gmail.com";
		
		
		Authenticator auth = new MyAuthentication();
		
		//session 생성
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);
		JSONObject object = new JSONObject();
		
		try {
			StringBuffer buffer = new StringBuffer();
/*			buffer.append(" 업체명 : ");
			buffer.append(company + "<br>");
			buffer.append(" 이름 : ");
			buffer.append(name + "<br>");
			buffer.append(" 번호 : ");
			buffer.append(tel + "<br>");
			buffer.append(" 이메일 : ");
			buffer.append(email + "<br>");
			buffer.append(" 문의 내용 : ");
			buffer.append(content + "<br>");*/
			buffer.append("<html>\r\n" + 
					"<head>\r\n" + 
					"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
					"<title>email test</title>\r\n" + 
					"</head>\r\n" + 
					"<body>\r\n" + 
					"<div style=\" height: 800px;\">\r\n" + 
					"<div style=\"box-shadow:5px 5px 15px gray; width: 800px;\">\r\n" + 
					"<div style=\"border: 0px solid gray; vertical-align: middle; margin: 0 auto; padding: 40px; \">\r\n" + 
					"		<div style=\"border-bottom: 1px solid lightgray; font-size: 20px; line-height: 3em; font-weight: bold; text-align: center;\">제휴문의가 도착했습니다!</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">업체명 : "+ company +"</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">이름 : "+ name +"</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">번호 : "+ tel +"</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">이메일 : "+ email+"</div>\r\n" + 
					"		<div style=\"line-height: 3em;\">문의내용 : "+ content+"</div>\r\n" + 
					"		<div style=\"line-height: 3em; text-align: center;\"><img src=\"https://a519486.com/images/icon/HotPlace.png\" style=\"width: 40px\"></div>\r\n" + 
					"</div>\r\n" + 
					"</div>\r\n" + 
					"</div>\r\n" + 
					"</body>\r\n" + 
					"</html>");
			
			
//			javax.mail.Address fromAddr = new InternetAddress("rodjfuqek1@gmail.com");
			msg.setFrom(new InternetAddress("rodjfuqek1@gmail.com", "핫플레이스", "utf-8"));		
			javax.mail.Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setSubject("[핫플레이스] 제휴 문의가 도착했습니다.", "UTF-8");
			
			msg.setContent(buffer.toString(), "text/html; charset=UTF-8");
			Transport.send(msg);
			
			
			
			session.setDebug(true);
		} catch(Exception e) {
			e.printStackTrace();
			return;
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
}
