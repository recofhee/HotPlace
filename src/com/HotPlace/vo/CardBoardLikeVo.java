package com.HotPlace.vo;

// 카드 보드 좋아요 
public class CardBoardLikeVo {

	private Integer likeNum; // 카드 보드 좋아요 번호
	private Integer cbNum; // 카드 보드 번호
	private String email; // 회원 이메일

	public CardBoardLikeVo() {}

	public CardBoardLikeVo(Integer likeNum, Integer cbNum, String email) {
		this.likeNum = likeNum;
		this.cbNum = cbNum;
		this.email = email;
	}

	public Integer getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(Integer likeNum) {
		this.likeNum = likeNum;
	}

	public Integer getCbNum() {
		return cbNum;
	}

	public void setCbNum(Integer cbNum) {
		this.cbNum = cbNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}