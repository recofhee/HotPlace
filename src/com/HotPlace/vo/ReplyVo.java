package com.HotPlace.vo;

import java.util.Date;

// 댓글 
public class ReplyVo {

	private Integer reNum; // 댓글 번호
	private Integer cbNum; // 카드 보드 번호
	private String email; // 회원 이메일
	private String name; // 작성자
	private String writeDate; // 작성 일시
	private String content; // 내용

	public ReplyVo() {}

	public ReplyVo(Integer reNum, Integer cbNum, String email, String name, String writeDate, String content) {
		this.reNum = reNum;
		this.cbNum = cbNum;
		this.email = email;
		this.name = name;
		this.writeDate = writeDate;
		this.content = content;
	}

	public Integer getReNum() {
		return reNum;
	}

	public void setReNum(Integer reNum) {
		this.reNum = reNum;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReplyVo [reNum=" + reNum + ", cbNum=" + cbNum + ", email=" + email + ", name=" + name + ", writeDate="
				+ writeDate + ", content=" + content + "]";
	}

}