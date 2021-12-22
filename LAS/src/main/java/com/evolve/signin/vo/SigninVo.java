package com.evolve.signin.vo;

public class SigninVo {
	
	private String id,phone,pw,first_name,last_name,birth,gender,signin_date,signin_type,update_date,email;
	private int del_yn,seq;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSignin_date() {
		return signin_date;
	}

	public void setSignin_date(String signin_date) {
		this.signin_date = signin_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSignin_type() {
		return signin_type;
	}

	public void setSignin_type(String signin_type) {
		this.signin_type = signin_type;
	}

	public int getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(int del_yn) {
		this.del_yn = del_yn;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}



}
