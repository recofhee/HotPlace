package com.HotPlace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.HotPlace.util.DBManager;
import com.HotPlace.vo.CardBoardLikeVo;
import com.HotPlace.vo.CardBoardVo;
import com.HotPlace.vo.GalleryVo;
import com.HotPlace.vo.ReplyVo;

public class CardBoardDao {
	private static CardBoardDao dao = new CardBoardDao();
	
	private CardBoardDao() {}
	
	public static CardBoardDao getInstance() {
		return dao;
	}
	
	public List<CardBoardVo> selectAllBoards() {
		String sql = "select * from card_board order by cb_num desc";
		
		List<CardBoardVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardBoardVo bVo = new CardBoardVo();
				
				bVo.setCbNum(rs.getInt("cb_num"));
				bVo.setEmail(rs.getString("email"));
				bVo.setName(rs.getString("name"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setThumbnail(rs.getString("thumbnail"));
				bVo.setWriteDate(rs.getTimestamp("write_date"));
				bVo.setModifyDate(rs.getTimestamp("modify_date"));
				bVo.setLikeCnt(rs.getInt("like_cnt"));
				bVo.setReadCnt(rs.getInt("read_cnt"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// 모든 카드 보드 목록 가져오기 (최신순)
	public List<CardBoardVo> selectAllBoards(int startRow, int endRow) {
		// TODO Auto-generated method stub
		String sql = "select CNT-RN+1, rn, cb_num, email, name, title, content, thumbnail, write_date, modify_date, like_cnt, read_cnt from (" + 
				" select (select count(*) from card_board) CNT, rownum AS RN,  cb_num, email, name, title, content, thumbnail, write_date, modify_date, like_cnt, read_cnt" + 
				" from card_board order by cb_num)" + 
				" where CNT-RN+1 between "+startRow+" and "+endRow+" order by CNT-RN+1";
		
		List<CardBoardVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardBoardVo bVo = new CardBoardVo();
				
				bVo.setCbNum(rs.getInt("cb_num"));
				bVo.setEmail(rs.getString("email"));
				bVo.setName(rs.getString("name"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setThumbnail(rs.getString("thumbnail"));
				bVo.setWriteDate(rs.getTimestamp("write_date"));
				bVo.setModifyDate(rs.getTimestamp("modify_date"));
				bVo.setLikeCnt(rs.getInt("like_cnt"));
				bVo.setReadCnt(rs.getInt("read_cnt"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// 카드 보드의 이전 cb_num 가져오기
	public int getCardBoardPrevNum(int cbNum) {
		int result = 0;
		String sql = "select cb_num from card_board where cb_num=(select max(cb_num) from card_board where cb_num < ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cb_num");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 카드 보드의 이후 cb_num 가져오기
	public int getCardBoardNextNum(int cbNum) {
		int result = 0;
		String sql = "select cb_num from card_board where cb_num=(select min(cb_num) from card_board where cb_num > ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cb_num");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}

	// 총 카드 보드 수 가져오기
	public int getCardBoardCnt() {
		int result = 0;
		String sql = "select count(*) from card_board";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 검색 키워드로 모든 카드 보드 가져오기 (최신순)
	public List<CardBoardVo> searchAllBoards(String keyword, int startRow, int endRow) {
		String sql = "select CNT-RN+1, rn, cb_num, email, name, title, content, thumbnail, write_date, modify_date, like_cnt, read_cnt from (" + 
				" select (select count(*) from card_board where upper(title) LIKE '%' || upper(?) || '%') CNT, rownum AS RN,  cb_num, email, name, title, content, thumbnail, write_date, modify_date, like_cnt, read_cnt" + 
				" from card_board where upper(title) LIKE '%' || upper(?) || '%' order by cb_num)" + 
				" where CNT-RN+1 between "+startRow+" and "+endRow+" order by CNT-RN+1";
		
		List<CardBoardVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardBoardVo bVo = new CardBoardVo();
				
				bVo.setCbNum(rs.getInt("cb_num"));
				bVo.setEmail(rs.getString("email"));
				bVo.setName(rs.getString("name"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setThumbnail(rs.getString("thumbnail"));
				bVo.setWriteDate(rs.getTimestamp("write_date"));
				bVo.setModifyDate(rs.getTimestamp("modify_date"));
				bVo.setLikeCnt(rs.getInt("like_cnt"));
				bVo.setReadCnt(rs.getInt("read_cnt"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// 검색 키워드의 총 카드 보드 수 가져오기
	public int getSearchCardBoardCnt(String keyword) {
		int result = 0;
		String sql = "select count(*) from card_board where upper(title) LIKE '%' || upper(?) || '%'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public void insertBoard(CardBoardVo bVo) {
		String sql = "insert into card_board(cb_num, email, name, title, content, thumbnail) values(card_board_seq.nextval, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getEmail());
			pstmt.setString(2, bVo.getName());
			pstmt.setString(3, bVo.getTitle());
			pstmt.setString(4, bVo.getContent());
			pstmt.setString(5, bVo.getThumbnail());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateReadCount(int cbNum) {
		String sql = "update card_board set read_cnt=read_cnt+1 where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cbNum);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public CardBoardVo selectOneBoardByNum(int cbNum) {
		String sql = "select * from card_board where cb_num=?";
		
		CardBoardVo bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new CardBoardVo();
				
				bVo.setCbNum(rs.getInt("cb_num"));
				bVo.setEmail(rs.getString("email"));
				bVo.setName(rs.getString("name"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setThumbnail(rs.getString("thumbnail"));
				bVo.setWriteDate(rs.getTimestamp("write_date"));
				bVo.setModifyDate(rs.getTimestamp("modify_date"));
				bVo.setLikeCnt(rs.getInt("like_cnt"));
				bVo.setReadCnt(rs.getInt("read_cnt"));
				bVo.setSrc(rs.getString("src"));
				bVo.setOriginSrc(rs.getString("origin_src"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
	public void updateBoard(CardBoardVo bVo) {
		String sql = "update card_board set email=?, name=?, title=?, content=?, thumbnail=? where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bVo.getEmail());
			pstmt.setString(2, bVo.getName());
			pstmt.setString(3, bVo.getTitle());
			pstmt.setString(4, bVo.getContent());
			pstmt.setString(5, bVo.getThumbnail());
			pstmt.setInt(6, bVo.getCbNum());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	/*
	public CardBoardVo checkPassword(String pass, String num) {
		String sql = "select * from board where pass=? and num=?";
		
		CardBoardVo bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bVo = new CardBoardVo();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setName(rs.getString("name"));
				bVo.setId(rs.getString("id"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setWriteDate(rs.getTimestamp("writeDate"));
				bVo.setFileName(rs.getString("fileName"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}*/
	
	public void deleteBoard(String cbNum) {
		String sql = "delete from card_board where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cbNum);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 갤러리의 모든 정보 가져오기
	public List<GalleryVo> selectAllGallery() {
		String sql = "select * from gallery";
		
		List<GalleryVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GalleryVo gVo = new GalleryVo();
				
				gVo.setGalleryNum(rs.getInt("gallery_num"));
				gVo.setCbNum(rs.getInt("cb_num"));
				gVo.setSrc(rs.getString("src"));
				gVo.setOriginSrc(rs.getString("origin_src"));
				
				list.add(gVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// cb_num에 해당하는 갤러리의 모든 정보 가져오기
	public List<GalleryVo> selectAllGalleries(int cbNum) {
		String sql = "select * from gallery where cb_num=?";
		
		List<GalleryVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GalleryVo gVo = new GalleryVo();
				
				gVo.setGalleryNum(rs.getInt("gallery_num"));
				gVo.setCbNum(rs.getInt("cb_num"));
				gVo.setSrc(rs.getString("src"));
				gVo.setOriginSrc(rs.getString("origin_src"));
				
				list.add(gVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// cb_num에 해당하는 갤러리의 수 가져오기
	public int getGalleryCntByNum(int cbNum) {
		int result = 0;
		String sql = "select count(cb_num) from gallery where cb_num = " + cbNum;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
		
	public void insertGallery(GalleryVo gVo) {
		String sql = "insert into gallery values (GALLERY_SEQ.nextval, CARD_BOARD_SEQ.currval, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gVo.getSrc());
			pstmt.setString(2, gVo.getOriginSrc());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 글 수정 시 추가될 파일
	public void insertGalleryByNum(GalleryVo gVo, int cbNum) {
		String sql = "insert into gallery values (GALLERY_SEQ.nextval, "+cbNum+", ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, gVo.getSrc());
			pstmt.setString(2, gVo.getOriginSrc());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// 파일 하나 삭제
	public void deleteGallery(int gNum) {
		String sql = "delete from gallery where gallery_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, gNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 카드 보드 삭제 시 그 보드의 파일들 삭제
	public void deleteBoardGalleries(String cbNum) {
		String sql = "delete from gallery where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cbNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 댓글 모든 정보 가져오기
	public List<ReplyVo> selectAllReplies() {
		String sql = "select * from card_reply order by re_num desc";
		
		List<ReplyVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyVo rVo = new ReplyVo();
				
				rVo.setReNum(rs.getInt("re_num"));
				rVo.setCbNum(rs.getInt("cb_num"));
				rVo.setEmail(rs.getString("email"));
				rVo.setName(rs.getString("name"));
				rVo.setWriteDate(rs.getString("write_date"));
				rVo.setContent(rs.getString("content"));
				
				list.add(rVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// cb_num으로 댓글 모든 정보 가져오기 (최신순)
	public List<ReplyVo> selectAllReplies(int cbNum, int startRow, int endRow) {
		String sql = "select CNT-RN+1, rn, re_num, cb_num, email, name, to_char(write_date, 'yyyy.MM.dd, HH24:MI:SS') write_date, content from (" + 
				"select (select count(*) from card_reply where cb_num="+cbNum+") CNT, rownum AS RN, re_num, cb_num, email, name, write_date, content " + 
				"from card_reply where cb_num="+cbNum+"  order by re_num)" + 
				"where CNT-RN+1 between "+startRow+" and "+endRow+" order by CNT-RN+1";
		
		List<ReplyVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyVo rVo = new ReplyVo();
				
				rVo.setReNum(rs.getInt("re_num"));
				rVo.setCbNum(rs.getInt("cb_num"));
				rVo.setEmail(rs.getString("email"));
				rVo.setName(rs.getString("name"));
				rVo.setWriteDate(rs.getString("write_date"));
				rVo.setContent(rs.getString("content"));
				
				list.add(rVo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// cb_num으로 제일 최근 댓글 가져오기
	public ReplyVo selectOneReplyByNum(int cbNum) {
		String sql = "select * from card_reply where (to_char(write_date, 'yyyy.MM.dd, HH24:MI:SS')) = (select max(to_char(write_date, 'yyyy.MM.dd, HH24:MI:SS')) write_date from card_reply where cb_num=?)";
		
		ReplyVo rVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rVo = new ReplyVo();
				
				rVo.setReNum(rs.getInt("re_num"));
				rVo.setCbNum(rs.getInt("cb_num"));
				rVo.setEmail(rs.getString("email"));
				rVo.setName(rs.getString("name"));
				rVo.setWriteDate(rs.getString("write_date"));
				rVo.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return rVo;
	}
	
	// cb_num으로 총 댓글 수 가져오기
	public int getReplyCnt(int cbNum) {
		int result = 0;
		String sql = "select count(*) from card_reply where cb_num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 댓글 작성
	public void insertReply(ReplyVo rVo) {
		String sql = "insert into card_reply(re_num, cb_num, email, name, content) values(reply_seq.nextval, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rVo.getCbNum());
			pstmt.setString(2, rVo.getEmail());
			pstmt.setString(3, rVo.getName());
			pstmt.setString(4, rVo.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 댓글 삭제
	public void deleteReply(int reNum) {
		String sql = "delete from card_reply where re_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 카드 보드 삭제 시 그 보드의 댓글들도 삭제
	public void deleteBoardReplies(String cbNum) {
		String sql = "delete from card_reply where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cbNum);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 카드 번호별 좋아요 누른 좋아요 정보 가져오기
	public CardBoardLikeVo selectOneCardBoardLikeByNum(int cbNum) {
		String sql = "select * from card_board_like where cb_num=?";
		
		CardBoardLikeVo lVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lVo = new CardBoardLikeVo();
				
				lVo.setLikeNum(rs.getInt("like_num"));
				lVo.setCbNum(rs.getInt("cb_num"));
				lVo.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return lVo;
	}
	
	// 좋아요 수 증가
	public void updateIncrLikeCnt(int cbNum) {
		String sql = "update card_board set like_cnt=like_cnt+1 where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cbNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 좋아요 누를 시 카드 보드 번호&회원 이메일 삽입
	public void insertCardBoardLike(CardBoardLikeVo lVo) {
		String sql = "INSERT INTO card_board_like VALUES (CARD_BOARD_LIKE_SEQ.nextval, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, lVo.getCbNum());
			pstmt.setString(2, lVo.getEmail());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 좋아요 수 감소
	public void updateDecrLikeCnt(int cbNum) {
		String sql = "update card_board set like_cnt=like_cnt-1 where cb_num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cbNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 좋아요 취소할 시 관련 정보 삭제
	public void deleteCardBoardLike(int cbNum, String email) {
		String sql = "delete from card_board_like where cb_num=? and email=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cbNum);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}