package com.HotPlace.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

import com.HotPlace.util.DBManager;
import com.HotPlace.util.SHA256;
import com.HotPlace.vo.GameVO;
import com.HotPlace.vo.MemberVo;
import com.HotPlace.vo.TokenVo;


public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public int userCheck(String email, String pw) { 
		int result = -1;
		String sql = "select pw from member where email=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString("pw") != null && rs.getString("pw").equals(pw)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			System.out.println("result : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
		
	}
	
	public MemberVo getMember(String email) { //
		MemberVo mVo = null;
		String sql = "select * from member where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mVo = new MemberVo();
				mVo.setEmail(rs.getString("email"));
				mVo.setNick_name(rs.getString("nick_name"));
				mVo.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVo;
	}
	
	
	public int confirmNickname(String nick_name) {
		int result = -1;
		String sql = "select nick_name from member where nick_name=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick_name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}

	public int confirmemail(String email) {
		int result = -1;
		String sql = "select email from member where email=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	public int insertMember(MemberVo mVo) {
		int result = -1;
		String sql = "insert into member(email, pw, nick_name, phone, token, game_genre, game_name, reg_date) values(?, ?, ?, ?, '0', ? ,?, sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println(mVo.getPw());
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getEmail());
			pstmt.setString(2, mVo.getPw());
			pstmt.setString(3, mVo.getNick_name());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getGame_genre());
			pstmt.setString(6, Arrays.toString(mVo.getGame_name()));
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	//다음, 네이버 토큰값 저장
	public void insertTokenMember(TokenVo tVo) {
		String sql = "insert into token(token_idx, email, birthdate, gender, nick_name, id, reg_date) "
				+ "values(token_seq.nextval, ?, ?, ?, ?, ? ,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tVo.getEmail());
			pstmt.setString(2, tVo.getBirthdate());
			pstmt.setString(3, tVo.getGender());
			pstmt.setString(4, tVo.getNick_name());
			pstmt.setInt(5, tVo.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}


	// 회원정보변경 창을 통한 update
	public int updateMember(MemberVo vo) { //
		int result = -1;
		String sql = "update member set email=?, pw=?, Nick_name=?, Phone=? where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getNick_name());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getEmail());
			
			//pstmt.setString(6, mVo.getReg());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	// PcResvBeforeServlet에서 작성한 신상정보 저장을 위한 dao
	public void updateDetailMember(MemberVo vo) { //
		String sql = "update member set birth = ? , gender = ? where email=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getBirth());
			pstmt.setString(2, vo.getGender());
			pstmt.setString(3, vo.getEmail());
			
			System.out.println(vo.getBirth());
			System.out.println(vo.getGender());
			System.out.println(vo.getEmail());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	//	return;
	}
	
	public void deleteMember(String email){
		System.out.println("dao email : " + email);
		String sql = "delete from member where email = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public MemberVo checkPassword(String email, String pw) {
		String sql = "select * from member where email=? and pw=?";
		
		MemberVo bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new MemberVo();
				
				bVo.setEmail(email);
				bVo.setPw(pw);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
	public int findPass(String email) {
		int result = -1;
		
		System.out.println("dao findPass email : " + email);
		
		
		String sql = "select email from member where email=?";
		
		//MemberVo bVo = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
 			
			if(rs.next()) {
				if(rs.getString("email") != null && rs.getString("email").equals(email)) {
					result = 1;	// 일치
					System.out.println("로그인 성공");
				} else {
					result = 0;	// 불일치
					System.out.println("일치하는 회원 정보 없음");
				}
			} else {
				result = -1;	// db에 없을 떄
				System.out.println("존재 하지 않는 회원");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int setPass(String email, String pw) {
		int result = -1;
		
		System.out.println("dao findPass email : " + email);
		
		
		String sql = "update member set pw = ? where email = ?";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pw = new SHA256().testSHA256(pw);
			System.out.println(pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			result = pstmt.executeUpdate();
			
 			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
		
	}
	
	public int userInform(String email) { 
		int result = -1;
		String sql = "select nick_name, birth from member where email=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("birth") != null) {	// 생일값이 입력되어 있는 사람
					result = 1;
				} else {
					result = 0;
				}
			}
			System.out.println("result : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
		
	}

}
