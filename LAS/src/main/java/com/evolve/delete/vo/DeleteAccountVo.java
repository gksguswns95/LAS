package com.evolve.delete.vo;

public class DeleteAccountVo {
	
	private String id,pw,phone,email,first_name,last_name,birth,signup_date,signup_type,quit_date,disposal_date,quit_reason;
	private int gender;

	public String getQuit_date() {
		return quit_date;
	}

	public void setQuit_date(String quit_date) {
		this.quit_date = quit_date;
	}

	public String getDisposal_date() {
		return disposal_date;
	}

	public void setDisposal_date(String disposal_date) {
		this.disposal_date = disposal_date;
	}

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


	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(String signup_date) {
		this.signup_date = signup_date;
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

	public String getSignup_type() {
		return signup_type;
	}

	public void setSignup_type(String signup_type) {
		this.signup_type = signup_type;
	}

	public String getQuit_reason() {
		return quit_reason;
	}

	public void setQuit_reason(String quit_reason) {
		this.quit_reason = quit_reason;
	}




}
