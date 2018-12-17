package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.HotPlace.vo.BoardCommentVO;

public class BoardCommentDAO {
	private static BoardCommentDAO dao = new BoardCommentDAO();
	private BoardCommentDAO() {}
	
	public static BoardCommentDAO getInstance() {
		return dao;
	}
	
	private Connection conn;

	public void setCon(Connection conn) {
		this.conn = conn;
	}
	
	// 댓글 등록
	public void insert(BoardCommentVO vo) throws SQLException {
		String sql = " insert into board_comment (comment_id, comment_content, parent_num) values ( ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getCoId());
		pstmt.setString(2, vo.getCoContent());
		pstmt.setInt(3, vo.getParentNum());
		pstmt.execute();
		pstmt.close();
		
	}
	
	// comment 테이블의 coNum값으로 데이터 하나 가져오기 : getOne()
	public BoardCommentVO getOne(int num) throws SQLException {
		BoardCommentVO vo = new BoardCommentVO();
		String sql = "select * from board_comment where comment_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// rs 각 컬럼값을 vo 객체 프로퍼티로 설정
		vo.setCoNum(rs.getInt("coNum"));
		vo.setCoId(rs.getString("id"));
		vo.setCoContent(rs.getString("coContent"));
		vo.setCoWritedate(rs.getTimestamp("coWritedate"));
		vo.setParentNum(rs.getInt("parentNum"));
		pstmt.close();
		
		
		return vo;
	}
	
	// 댓글 수정
	public void update(BoardCommentVO vo) throws SQLException{
		String sql = "update board_comment set COMMENT_NAME=?, COMMNET_CONTENT=? where COMMENT_NUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getCoId());
		pstmt.setString(2, vo.getCoContent());
		pstmt.setInt(3, vo.getCoNum());
		pstmt.execute();
		pstmt.close();
	}
	
	// 댓글 삭제
	public void delete(int coNum) throws SQLException{
		String sql = "delete from board_comment where comment_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, coNum);
		pstmt.execute();
		pstmt.close();
	}
	
	public int getCount(int coNum) throws SQLException{
		String sql = "select count(*) from comment where parent_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, coNum);
		
		ResultSet rs = pstmt.executeQuery();
		int cnt=0;
		
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		pstmt.close();
		
		return cnt;
	}
	
	public ArrayList<BoardCommentVO> getList(int parentNum) throws SQLException {
		ArrayList<BoardCommentVO> list = new ArrayList<>();
		
		String sql = "select * from board_comment where parent_num order by comment_num desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, parentNum);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
				BoardCommentVO vo = new BoardCommentVO();
				vo.setCoNum(rs.getInt("coNum"));
				vo.setParentNum(rs.getInt("parentNum"));
				vo.setCoId(rs.getString("coId"));
				vo.setCoWritedate(rs.getTimestamp("coWritedate"));
				list.add(vo);
			} while(rs.next());
			
		}
		pstmt.close();
		return list;
		
	}
	
	
}
