package com.HotPlace.vo;

public class ContactVo {
	private String company;
	private String name;
	private String tel;
	private String email;
	private String content;
	
	
	public ContactVo() {}
	
	
	public ContactVo(String company, String name, String tel, String email, String content) {
		super();
		this.company = company;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.content = content;
	}


	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "ContactVo [company=" + company + ", name=" + name + ", tel=" + tel + ", email=" + email + ", content="
				+ content + "]";
	}
	
	
	
	
}
