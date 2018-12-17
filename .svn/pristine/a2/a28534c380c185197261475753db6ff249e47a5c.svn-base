package com.HotPlace.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.HotPlace.dao.CardBoardDao;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;


@WebServlet("/cardBoardWrite")
public class CardBoardWriteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("cardBoardWrite.jsp").forward(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		CardBoardDao bDao = CardBoardDao.getInstance();
		CardBoardVo bVo = new CardBoardVo();
		
		try {
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
			if (ServletFileUpload.isMultipartContent(req)) {
				for(int i = 0; i < multiparts.size(); i++) {
					System.out.println("multiparts.get(i).getFieldName() :: " + multiparts.get(i).getFieldName());
					//System.out.println("multiparts.get(i).getString() :: " + multiparts.get(i).getString("UTF-8"));
					if(multiparts.get(i).getFieldName().equals("email")) {
						bVo.setEmail(multiparts.get(i).getString("UTF-8"));
					} else if(multiparts.get(i).getFieldName().equals("name")) {
						bVo.setName(multiparts.get(i).getString("UTF-8"));
					} else if(multiparts.get(i).getFieldName().equals("title")) {
						bVo.setTitle(multiparts.get(i).getString("UTF-8"));
					} else if(multiparts.get(i).getFieldName().equals("content")) {
						bVo.setContent(multiparts.get(i).getString("UTF-8"));
					}
					System.out.println(multiparts);
					System.out.println(multiparts.get(i));
				}
				int count = 0;
				boolean flag = false;
				for (FileItem item : multiparts) {
				/*Iterator iter = multiparts.iterator(); //반복자(Iterator)로 받기​            
				FileItem item = (FileItem) iter.next();
				for (int i = 0; i < multiparts.size(); i++) {*/
					
					System.out.println(item.getFieldName() + " :: " + item.isFormField());
					
					if (!item.isFormField() && item.getSize() > 0) {
						
						String src = item.getName();
						
						System.out.println(item.getFieldName());
						System.out.println("item.getSize() : " + item.getSize());
						
						// 중복 파일명에 대한 uuid 생성
						UUID uuid = UUID.randomUUID();
						
						//String fileName = new File(item.getName()).getName();
						String savedFile = uuid.toString() + "_" + src;
						System.out.println("savedFile : "+ savedFile);
						
						String rootPath = getServletContext().getRealPath("/upload");
						System.out.println(rootPath);
						
						//item.write(new File("/upload/" + File.separator + fileName));
						item.write(new File(rootPath + File.separator + savedFile)); // 다른 이름
						//item.write(new File(rootPath + File.separator + src)); // 원본 이름 
						System.out.println();
						
						bVo.setThumbnail(savedFile);
						
						// 한 번만 실행될 메서드
						if(count++ == 0) {
							bDao.insertBoard(bVo);
							flag = true;
						}
						
						GalleryVo gVo = new GalleryVo();
						gVo.setSrc(savedFile);
						gVo.setOriginSrc(src);
						System.out.println("gVo : " + gVo.toString());
						bDao.insertGallery(gVo);
					
					}
				}
				// 파일 업로드 안 했을 경우
				if(!flag) {
					bDao.insertBoard(bVo);
				}
				
				// File uploaded successfully 
				req.setAttribute("message", "File Uploaded Successfully");
			} else {
				req.setAttribute("message", "No File found");
			}
			resp.sendRedirect("cardBoardList");
		} catch (Exception ex) {
			req.setAttribute("message", "File Upload Failed due to " + ex);
		}
	}
	
}
