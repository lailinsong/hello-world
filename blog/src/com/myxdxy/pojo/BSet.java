package com.myxdxy.pojo;

import org.springframework.stereotype.Component;

/**
 * 基本设置实体类
 * @author 赖林松
 *
 */
@Component
public class BSet {
	private int id;
	private String title;
	private String subTitle;
	private String keywords;
	private String description;
	private String mail;
	private String icp;
	private int timeOut;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getIcp() {
		return icp;
	}
	public void setIcp(String icp) {
		this.icp = icp;
	}
	public int getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(int timeOut) {
		this.timeOut = timeOut;
	}
	@Override
	public String toString() {
		return "BSet [id=" + id + ", title=" + title + ", subTitle=" + subTitle + ", keywords=" + keywords
				+ ", description=" + description + ", mail=" + mail + ", icp=" + icp + ", timeOut=" + timeOut + "]";
	}
}
