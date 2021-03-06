package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.HotPlace.util.DBManager;
import com.HotPlace.vo.BoardVO;
import com.HotPlace.vo.MemberVo;

public class BoardDAO {
	private BoardDAO() {
	}

	private static BoardDAO dao = new BoardDAO();

	public static BoardDAO getInstance() {
		return dao;
	}

	// 게시글 검색 및 조회 기능
	public List<BoardVO> gameBoardList(int category_num, String keyField, String keyWord, int startRow, int endRow) {
		String sql = " SELECT * FROM (  SELECT ROWNUM RN, CNT-ROWNUM+1 RRN, A.* FROM ( SELECT * FROM ( "
				+ " SELECT (select count(*) FROM BOARD) CNT, num, title, nick_name, category_num, writedate, readcount, repcount, parent, step, indent, email ";
		List<BoardVO> list = new ArrayList<BoardVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();

			
			// 전체 게시글 보기
			if(category_num == 0) {
				if(keyField == null) {
					sql += " from board ) order by PARENT DESC, INDENT ASC , STEP ASC )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
				} 
				else if (keyField.equals("nick_name")) {	// 작성자 검색
					sql += " from board where nick_name LIKE '%' || ? || '%' ) order by PARENT DESC,INDENT ASC , STEP ASC  )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} 
				else if (keyField.equals("title")){		// 제목 검색
					sql +=" from board where title LIKE '%' || ? || '%' ) order by PARENT DESC, INDENT ASC , STEP ASC  )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} else if ( keyField.equals("content")) {		// 내용 검색
					sql +=" from board where content LIKE '%' || ? || '%' ) order by PARENT DESC, INDENT ASC , STEP ASC)A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} 
				
			}
			
			// 카테고리별 게시글 보기
			else if(category_num != 0) {
				if(keyField == null) {
					sql +=" from board where category_num = " + category_num + " ) order by PARENT DESC, INDENT ASC , STEP ASC  )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
				} 
				else if (keyField.equals("nick_name")) {		// 작성자 검색
					sql += " from board where category_num = " + category_num + " and nick_name LIKE '%' || ? || '%' ) order by PARENT DESC, INDENT ASC , STEP ASC  )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} 
				else if (keyField.equals("title")){		// 제목 검색
					sql += " from board where category_num = " + category_num + " and title LIKE '%' || ? || '%' ) order by PARENT DESC, INDENT ASC , STEP ASC  )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} else if ( keyField.equals("content")) {		// 내용 검색
					sql += " from board where category_num = " + category_num + " and content LIKE '%' || ? || '%' ) order by PARENT DESC, INDENT ASC , STEP ASC )A "
						+ " ) WHERE RN BETWEEN " + startRow + " AND " + endRow;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyWord);
				} 
				
			}
			
			
			
			rs = pstmt.executeQuery();


			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setCategory_num(rs.getInt("category_num"));
				vo.setNick_name(rs.getString("nick_name"));
				vo.setEmail(rs.getString("email"));
				vo.setTitle(rs.getString("title"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRepcount(rs.getInt("repcount"));
				vo.setWritedate(rs.getTimestamp("writedate"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return list;

	}

	// 메인에 보여질 리스트
	public List<BoardVO> gameBoardList() {
		String sql = " select num, title, readcount, category_num " + " from(select * from board order by readcount desc) "
				+ " where rownum between 1 and 10 ";

		List<BoardVO> list = new ArrayList<BoardVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();


			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setCategory_num(rs.getInt("category_num"));
				vo.setTitle(rs.getString("title"));
				vo.setReadcount(rs.getInt("readcount"));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return list;

	}

	// 페이징을 위한 게시글 총 갯수 가져오기
	public int getBoardCnt(int category_num,String keyField ,String keyWord) {
		int result = 0;
		String sql = " select count(*) from board ";
		
		if(category_num == 0 && keyWord == null) {					// 통합 게시판 글 개수
			sql +="";
		} else if(category_num != 0) {				// 게임 게시판 글 개수
			sql += " where category_num = ?";
		} else if (category_num == 0 && keyWord != null) {		// 통합 게시판에서 글 검색하는 경우
			sql += " where ? like '%' || ? || '%' ";
		} else if (category_num != 0 && keyWord != null) {		// 게임 게시판에서 글 검색하는 경우
			sql += " where  category_num = ? and ? like '%' || ? || '%' ";
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("갯수 셀 때 category_num : " + category_num);
		System.out.println("keyWord : " + keyWord);


		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			/*if(category_num == 0) {
			} else */if (category_num != 0) {
				pstmt.setInt(1, category_num);
			} else if (category_num == 0 && keyWord != null) {
				pstmt.setString(1, keyField);
				pstmt.setString(2, keyWord);
			} else if (category_num != 0 && keyWord != null) {
				pstmt.setInt(1, category_num);
				pstmt.setString(2, keyField);
				pstmt.setString(3, keyWord);
			}
			
			
				
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("totalCnt : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return result;
	}

	// 게시판 상세보기
	public BoardVO viewBoard(int num) {
		String sql = "select num, title, category_num, nick_name, content, writedate, rec from board where num = ?";

		BoardVO vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			

			if (rs.next()) {
				vo = new BoardVO();

				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setCategory_num(rs.getInt("category_num"));
				vo.setNick_name(rs.getString("nick_name"));
				vo.setContent(rs.getString("content"));
				vo.setWritedate(rs.getTimestamp("writedate"));
				vo.setRec(rs.getInt("rec"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}

	// 게시글 등록을 위한 매서드
	public void boardWrite(BoardVO vo) {

		String sql = "INSERT INTO BOARD(NUM, CATEGORY_NUM, NICK_NAME, TITLE, CONTENT, FILE_ORI, FILE_MODI, WRITEDATE, PARENT, EMAIL)"
				+ "VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, sysdate, BOARD_SEQ.NEXTVAL, ?)";
		MemberVo mvo = new MemberVo();
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vo.getCategory_num());
			pstmt.setString(2, vo.getNick_name());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getFile_ori());
			pstmt.setString(6, vo.getFile_modi());
			pstmt.setString(7, vo.getEmail());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	// 글 수정을 위해 num값으로 게시글을 불러오는 메서드
	public BoardVO selectBoardByNum(int num) {
		String sql = "select * from board where num=?";
		BoardVO vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new BoardVO();
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setNick_name(rs.getString("nick_name"));
				vo.setCategory_num(rs.getInt("category_num"));
				vo.setFile_modi(rs.getString("file_modi"));
				vo.setNum(rs.getInt("num"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setEmail(rs.getString("email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);

		}

		return vo;
	}

	// 게시글 수정을 위해
	public void updateBoard(BoardVO vo) {
		String sql = "update board set title=?, content=?, file_modi=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getFile_modi());
			pstmt.setInt(4, vo.getNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void deleteBoard(int num) {
		String sql = "delete board where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 조회수 증가
	public void updateReadCount(int num) {
		String sql = "update board set readcount=readcount+1 where num=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
