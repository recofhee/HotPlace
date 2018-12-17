package com.HotPlace.vo;

public class BookmarkVo {
	private int mark_num;
	private int pc_num;
	private String email;
	private String name;
	private String address;
	private int price;
	
	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BookmarkVo(int mark_num, int pc_num, String email, String name, String address, int price) {
		super();
		this.mark_num = mark_num;
		this.pc_num = pc_num;
		this.email = email;
		this.name = name;
		this.address = address;
		this.price = price;
	}

	public BookmarkVo() {}

	public int getMark_num() {
		return mark_num;
	}

	public void setMark_num(int mark_num) {
		this.mark_num = mark_num;
	}

	public int getPc_num() {
		return pc_num;
	}

	public void setPc_num(int pc_num) {
		this.pc_num = pc_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "BookmarkVo [mark_num=" + mark_num + ", pc_num=" + pc_num + ", email=" + email + ", name=" + name
				+ ", address=" + address + ", price=" + price + "]";
	}
	
}
