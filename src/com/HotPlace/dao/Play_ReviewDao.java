package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.HotPlace.util.DBManager;
import com.HotPlace.vo.Play_ReviewVo;

public class Play_ReviewDao {
	// C R U D
	private Play_ReviewDao() {
	}

	private static Play_ReviewDao instance = new Play_ReviewDao();

	public static Play_ReviewDao getInstance() {
		return instance;
	}

	public void insertReply(Play_ReviewVo Vo) {
		String sql = "INSERT into PLAY_REVIEW VALUES (?, rep_seq.nextval, ?, ?, to_char(CURRENT_TIMESTAMP, 'yyyy-mm-dd hh24:mi:ss') )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Vo.getVideo_url());
			pstmt.setString(2, Vo.getUser_id());
			pstmt.setString(3, Vo.getRe_content());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public List<Play_ReviewVo> replyList(String url) {
		String sql = "select re_num, user_id, RE_CONTENT, reg_date"
				+ " from PLAY_REVIEW"
				+ " where video_url =?"
				+ " order by re_num desc";
		List<Play_ReviewVo> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, url);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Play_ReviewVo Vo = new Play_ReviewVo();
				Vo.setRe_num(rs.getInt("re_num"));
				Vo.setUser_id(rs.getString("user_id"));
				Vo.setRe_content(rs.getString("re_content"));
				Vo.setReg_date(rs.getString("reg_date"));
				list.add(Vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	public int deleteReply(int re_num) {
		String sql = "delete from PLAY_REVIEW where re_num= ?";
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}

}