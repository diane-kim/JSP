package com.javalec.ex03;

public class MemberDTO {
	String id;
	String pwd;
	String email;
	String phone1,phone2,phone3;
	int count;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}	
	public String getPhone() {
		return phone1+"-"+phone2+"-"+phone3;
	}
}
