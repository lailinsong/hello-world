package com.myxdxy.pojo;

import org.springframework.stereotype.Component;

/**
 * 登陆日志实体类
 * @author 赖林松
 *
 */
@Component
public class LoginLog {
	private int id;
	private String userName;
	private String loginTime;
	private String loginIp;
	private int uid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "LoginLog [id=" + id + ", userName=" + userName + ", loginTime=" + loginTime + ", loginIp=" + loginIp
				+ ", uid=" + uid + "]";
	}
}
