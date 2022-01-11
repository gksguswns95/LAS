package com.evolve.signup.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SignupVO {
	private String id,pw,email,phone,name,birth;
	private String signup_type;
	private int count;
	private String signup_date;


	public String getSignup_type() {
		return signup_type;
	}

	public void setSignup_type(String signup_type) {
		this.signup_type = signup_type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SignupVO [id=" + id + ", pw=" + pw + ", email=" + email + ", phone=" + phone + ", name=" + name
				+ ", birth=" + birth + ", signup_type=" + signup_type + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(String signup_date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String Resultstr = "";
        try {
			Date date = format.parse(signup_date);
			SimpleDateFormat resultFormat = new SimpleDateFormat("yy-MM-dd");
			Resultstr = resultFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		this.signup_date = Resultstr;
	}
	
}
