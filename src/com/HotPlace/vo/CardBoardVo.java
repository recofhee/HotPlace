package com.HotPlace.vo;

import java.util.Date;

// 카드 보드 
public class CardBoardVo extends GalleryVo {

	private Integer cbNum; // 카드 보드 번호 
    private String email; // 회원 이메일 
    private String name; // 작성자
    private String title; // 제목
    private String content; // 내용
    private String thumbnail; // 썸네일
    private Date writeDate; // 작성 일시
    private Date modifyDate; // 수정 일시
    private Integer likeCnt; // 좋아요 수
    private Integer readCnt; // 조회 수
    private String src; // 파일 src
	private String originSrc; // 파일 원본 src

    public CardBoardVo() {}

	public CardBoardVo(Integer cbNum, String email, String name, String title, String content, String thumbnail,
			Date writeDate, Date modifyDate, Integer likeCnt, Integer readCnt, String src, String originSrc) {
		super();
		this.cbNum = cbNum;
		this.email = email;
		this.name = name;
		this.title = title;
		this.content = content;
		this.thumbnail = thumbnail;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.likeCnt = likeCnt;
		this.readCnt = readCnt;
		this.src = src;
		this.originSrc = originSrc;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Date getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Date writeDate) {
        this.writeDate = writeDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Integer getLikeCnt() {
        return likeCnt;
    }

    public void setLikeCnt(Integer likeCnt) {
        this.likeCnt = likeCnt;
    }

    public Integer getReadCnt() {
        return readCnt;
    }

    public void setReadCnt(Integer readCnt) {
        this.readCnt = readCnt;
    }

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getOriginSrc() {
		return originSrc;
	}

	public void setOriginSrc(String originSrc) {
		this.originSrc = originSrc;
	}

	@Override
	public String toString() {
		return "CardBoardVo [cbNum=" + cbNum + ", email=" + email + ", name=" + name + ", title=" + title + ", content="
				+ content + ", thumbnail=" + thumbnail + ", writeDate=" + writeDate + ", modifyDate=" + modifyDate
				+ ", likeCnt=" + likeCnt + ", readCnt=" + readCnt + ", src=" + src + ", originSrc=" + originSrc + "]";
	}
	
	

}
