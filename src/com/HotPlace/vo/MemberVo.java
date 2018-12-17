package com.HotPlace.vo;

import java.util.Arrays;

import com.sun.jmx.snmp.Timestamp;

public class MemberVo {
	private String email;
	private String pw;
	private String nick_name;
	private String phone;
	private String token;
	private String game_genre;
	private String[] game_name;
	private String birth;
	private String gender;
	private Timestamp reg_date;
	
	public MemberVo() {
	}

	public MemberVo(String email, String pw, String nick_name, String phone, String token, String game, String game_genre, String[] game_name, String birth, String gender) {
		this.email = email;
		this.pw = pw;
		this.nick_name = nick_name;
		this.phone = phone;
		this.token = token;
		this.game_genre = game_genre;
		this.game_name = game_name;
		this.birth = birth;
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}


	public String getGame_genre() {
		return game_genre;
	}

	public void setGame_genre(String game_genre) {
		this.game_genre = game_genre;
	}

	public String[] getGame_name() {
		return game_name;
	}

	public void setGame_name(String[] game_name) {
		this.game_name = game_name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "MemberVo [email=" + email + ", pw=" + pw + ", nick_name=" + nick_name + ", phone=" + phone + ", token="
				+ token + ", game_genre=" + game_genre + ", game_name=" + Arrays.toString(game_name) + ", birth="
				+ birth + ", gender=" + gender + ", reg_date=" + reg_date + "]";
	}

	

	
	
	
}