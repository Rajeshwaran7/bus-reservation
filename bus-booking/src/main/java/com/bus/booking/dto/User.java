package com.bus.booking.dto;

public class User {

	private int userId;
	private String userName;
	private String email;
	private String pwd;
	private int age;
	private String gender;
	private long mobile;

	public User() {

	}

	public User(int userId, String userName, String email, String pwd, int age, String gender, long mobile) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.pwd = pwd;
		this.age = age;
		this.gender = gender;
		this.mobile = mobile;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", email=" + email + ", pwd=" + pwd + ", age="
				+ age + ", gender=" + gender + ", mobile=" + mobile + "]";
	}

}
