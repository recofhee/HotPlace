package com.HotPlace.vo;

public class TokenVo {
	private int token_idx;
	private String email;
	private String birthdate;
	private String gender;
	private String nick_name;
	private	int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TokenVo(int token_idx, String email, String birthdate,
			String gender, String nick_name, int id) {
		super();
		this.token_idx = token_idx;
		this.email = email;
		this.birthdate = birthdate;
		this.gender = gender;
		this.nick_name = nick_name;
		this.id = id;
	}

	public TokenVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getToken_idx() {
		return token_idx;
	}
	public void setToken_idx(int token_idx) {
		this.token_idx = token_idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	@Override
	public String toString() {
		return "TokenVo [token_idx=" + token_idx + ", email=" + email
				+ ", birthdate=" + birthdate + ", gender=" + gender
				+ ", nick_name=" + nick_name + ", id=" + id + "]";
	}
}
