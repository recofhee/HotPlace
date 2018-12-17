package com.HotPlace.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileDownload")
public class fileDownloadServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		
		String fileName = req.getParameter("file_name");
		//String fileName = "test.txt";
		System.out.println("fileName : " + fileName);
		
		String filePath = getServletContext().getRealPath("/upload/") + fileName;
		System.out.println("filePath : " + filePath);
		
		try {
			System.out.println("indexOf : " + fileName.indexOf("_") + 1);
			int originNameStart =  fileName.indexOf("_") + 1;
			System.out.println("substring : " + fileName.substring(originNameStart));
			File file = new File(filePath);
			//File file = new File(fileName.substring(originNameStart));
	        byte b[] = new byte[(int) file.length()];
	
			// page의 ContentType 등을 동적으로 바꾸기 위해 초기화
			resp.reset();
			resp.setContentType("APPLICATION/OCTET-STREAM");
			
			// 원본 파일명으로 변환 & 한글 인코딩
	        String encoding = new String(fileName.substring(originNameStart).getBytes("UTF-8"),"8859_1");
	        
	        // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리
	        resp.setHeader("Content-Disposition", "attachment; filename="+ encoding);
	        resp.setHeader("Content-Length", String.valueOf(file.length()));
	        
	        // 파일이 있을 경우
	        if (file.isFile()) {
                FileInputStream fileInputStream = new FileInputStream(file);
                ServletOutputStream servletOutputStream = resp.getOutputStream();
                
                // 파일 읽은 후 클라이언트 쪽으로 저장
                int readNum = 0;
                while ((readNum = fileInputStream.read(b)) != -1) {
                    servletOutputStream.write(b, 0, readNum);
                }
                
                servletOutputStream.close();
                fileInputStream.close();
            }
            
        } catch (Exception e) {
            System.out.println("Download Exception : " + e.getMessage());
        }
 
	}

}
