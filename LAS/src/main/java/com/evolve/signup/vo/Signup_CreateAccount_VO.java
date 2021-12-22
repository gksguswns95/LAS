package com.evolve.signup.vo;

public class Signup_CreateAccount_VO {
	private String id;
	private String password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Signup_CreateAccount_VO [id=" + id + ", password=" + password + "]";
	}
	
}
