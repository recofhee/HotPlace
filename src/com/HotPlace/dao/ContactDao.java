package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.HotPlace.util.DBManager;
import com.HotPlace.vo.ContactVo;

public class ContactDao {
	private ContactDao() {}
	
	private static ContactDao dao = new ContactDao();
	
	public static ContactDao getInstance() {
		return dao;
	}
	
	
	// 제휴문의 글 이메일 DB 저장
	public int saveContact (ContactVo vo) {
		int result = 0;
		String sql = " insert into contact(idx, company, name, tel, email, content) "
				+ " values(idx_seq.nextval, ?, ?, ?, ?, ?)";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCompany());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getContent());
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	
	// 이메일로 전송
		
}
