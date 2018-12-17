package com.HotPlace.vo;

public class ResvVo {
	int resv_num;
	String resv_start;
	String resv_end;
	String seat_idx;
	String seat_num;
	String pc_num;
	String resv_price;
	String resv_date;
	String generation;
	String resv_email;
	String resv_hours;
	String pc_name;
	String pc_addr;
	String maxLen;
	String payment;
	String email;
	
	public ResvVo() {}
	
	public ResvVo(int resv_num, String resv_start, String resv_end, String seat_idx, String seat_num, String pc_num,
			String resv_price, String resv_date, String generation, String resv_email, String resv_hours,
			String pc_name, String pc_addr, String maxLen, String payment, String email) {
		this.resv_num = resv_num;
		this.resv_start = resv_start;
		this.resv_end = resv_end;
		this.seat_idx = seat_idx;
		this.seat_num = seat_num;
		this.pc_num = pc_num;
		this.resv_price = resv_price;
		this.resv_date = resv_date;
		this.generation = generation;
		this.resv_email = resv_email;
		this.resv_hours = resv_hours;
		this.pc_name = pc_name;
		this.pc_addr = pc_addr;
		this.maxLen = maxLen;
		this.payment = payment;
		this.email = email;
	}
	
	public int getResv_num() {
		return resv_num;
	}
	public void setResv_num(int resv_num) {
		this.resv_num = resv_num;
	}
	public String getResv_start() {
		return resv_start;
	}
	public void setResv_start(String resv_start) {
		this.resv_start = resv_start;
	}
	public String getResv_end() {
		return resv_end;
	}
	public void setResv_end(String resv_end) {
		this.resv_end = resv_end;
	}
	public String getSeat_idx() {
		return seat_idx;
	}
	public void setSeat_idx(String seat_idx) {
		this.seat_idx = seat_idx;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public String getPc_num() {
		return pc_num;
	}
	public void setPc_num(String pc_num) {
		this.pc_num = pc_num;
	}
	public String getResv_price() {
		return resv_price;
	}
	public void setResv_price(String resv_price) {
		this.resv_price = resv_price;
	}
	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}
	public String getGeneration() {
		return generation;
	}
	public void setGeneration(String generation) {
		this.generation = generation;
	}
	public String getResv_email() {
		return resv_email;
	}
	public void setResv_email(String resv_email) {
		this.resv_email = resv_email;
	}
	public String getResv_hours() {
		return resv_hours;
	}
	public void setResv_hours(String resv_hours) {
		this.resv_hours = resv_hours;
	}
	public String getPc_name() {
		return pc_name;
	}
	public void setPc_name(String pc_name) {
		this.pc_name = pc_name;
	}
	public String getPc_addr() {
		return pc_addr;
	}
	public void setPc_addr(String pc_addr) {
		this.pc_addr = pc_addr;
	}
	public String getMaxLen() {
		return maxLen;
	}
	public void setMaxLen(String maxLen) {
		this.maxLen = maxLen;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "ResvVo [resv_num=" + resv_num + ", resv_start=" + resv_start + ", resv_end=" + resv_end + ", seat_idx="
				+ seat_idx + ", seat_num=" + seat_num + ", pc_num=" + pc_num + ", resv_price=" + resv_price
				+ ", resv_date=" + resv_date + ", generation=" + generation + ", resv_email=" + resv_email
				+ ", resv_hours=" + resv_hours + ", pc_name=" + pc_name + ", pc_addr=" + pc_addr + ", maxLen=" + maxLen
				+ ", payment=" + payment + ", email=" + email + "]";
	}
	
}
