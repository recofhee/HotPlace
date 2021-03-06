package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.HotPlace.util.DBManager;
import com.HotPlace.vo.BookmarkVo;
import com.HotPlace.vo.ResvVo;

public class BookmarkDao {
	private BookmarkDao() {}

	private static BookmarkDao dao = new BookmarkDao();

	public static BookmarkDao getInstance() {
		return dao;
	}
	
	
	
	// 북마크 정보 가져오기
	public BookmarkVo selectOneBookmarkByNum(String email) {
		String sql = "select * from book_mark where email=?";
		
		BookmarkVo bvo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bvo = new BookmarkVo();
				
				bvo.setMark_num(rs.getInt("mark_num"));
				bvo.setPc_num(rs.getInt("pc_num"));
				bvo.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bvo;
	}
	
	
	// 북마크 정보 가져오기
	public BookmarkVo selectOneBookmarkByNum(String email, int pc_num) {
		String sql = "select * from book_mark where email=? and pc_num=?";
		BookmarkVo bvo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, pc_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bvo = new BookmarkVo();
				bvo.setMark_num(rs.getInt("mark_num"));
				bvo.setPc_num(rs.getInt("pc_num"));
				bvo.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bvo;
	}
	
	// 북마크 버튼 클릭시 정보 저장
	public void insertBookmark(BookmarkVo bvo) {
		String sql = "INSERT INTO BOOK_MARK VALUES (mark_num_seq.nextval, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bvo.getEmail());
			pstmt.setInt(2, bvo.getPc_num());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 북마크 취소할 시 정보 삭제
	public void deleteCardBoardLike(String email, int pc_num) {
		String sql = "delete from book_mark where email=? and pc_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setInt(2, pc_num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 북마크 취소할 시 정보 삭제
	public void deleteAllBookMarkLike(String email) {
		String sql = "delete from book_mark where email=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public List<BookmarkVo> selectBookMarkByNum(String email) {
		String sql = "select name ,address, price, pc_num from pc where pc_num in (select pc_num from book_mark where email ='"+ email +"')";
		System.out.println(sql);
		List<BookmarkVo> list =new ArrayList<BookmarkVo>();   
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookmarkVo vo = new BookmarkVo();
				vo.setName(rs.getString("name"));
				vo.setAddress(rs.getString("address"));
				vo.setPrice(rs.getInt("price"));
				vo.setPc_num(rs.getInt("pc_num"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return list; 
	}
	
	
	
}
