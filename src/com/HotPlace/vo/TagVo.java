package com.HotPlace.vo;
// 검색 태그 
public class TagVo {

	private Integer tagNum; // 태그 번호
	private Integer cbNum; // 카드 보드 번호
	private String tag; // 태그

	public TagVo() {}

	public TagVo(Integer tagNum, Integer cbNum, String tag) {
		this.tagNum = tagNum;
		this.cbNum = cbNum;
		this.tag = tag;
	}

	public Integer getTagNum() {
		return tagNum;
	}

	public void setTagNum(Integer tagNum) {
		this.tagNum = tagNum;
	}

	public Integer getCbNum() {
		return cbNum;
	}

	public void setCbNum(Integer cbNum) {
		this.cbNum = cbNum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

}