package com.myxdxy.pojo;

public class ManageUser {
	private int id;
	private String name;
	private String userName;
	private String phone;
	private String password;
	private int grade;
	private int articleCount;
	private String loginTime;
	private int isAble;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String lastLoginTime) {
		this.loginTime = lastLoginTime;
	}
	public int getIsAble() {
		return isAble;
	}
	public void setIsAble(int isAble) {
		this.isAble = isAble;
	}
	@Override
	public String toString() {
		return "ManageUser [id=" + id + ", name=" + name + ", userName=" + userName + ", phone=" + phone + ", password="
				+ password + ", grade=" + grade + ", articleCount=" + articleCount + ", loginTime=" + loginTime
				+ ", isAble=" + isAble + "]";
	}
}
