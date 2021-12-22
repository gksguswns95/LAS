package com.evolve.signup.vo;

public class Signup_IdentityVerification_VO {
	
	private String lastname;
	private String firstname;
	private String year;
	private String month;
	private String day;
	private String gender;
	private String mobile_carrier;
	private String mobile_number;
	
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile_carrier() {
		return mobile_carrier;
	}
	public void setMobile_carrier(String mobile_carrier) {
		this.mobile_carrier = mobile_carrier;
	}
	public String getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	@Override
	public String toString() {
		return "Signup_IdentityVerification_VO [lastname=" + lastname + ", firstname=" + firstname + ", year=" + year
				+ ", month=" + month + ", day=" + day + ", gender=" + gender + ", mobile_carrier=" + mobile_carrier
				+ ", mobile_number=" + mobile_number + "]";
	}
	
}
