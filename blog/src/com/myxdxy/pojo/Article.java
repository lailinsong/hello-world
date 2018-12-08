package com.myxdxy.pojo;

/**
 * 文章实体类
 * @author 赖林松
 *
 */
public class Article {
	private int id;
	private String title;
	private String content;
	private String keywords;
	private String tags;
	private String titlepic;
	private String visibility;
	private String time;
	private String uid;
	private int browse;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getTitlepic() {
		return titlepic;
	}
	public void setTitlepic(String titlepic) {
		this.titlepic = titlepic;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getBrowse() {
		return browse;
	}
	public void setBrowse(int browse) {
		this.browse = browse;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", keywords=" + keywords + ", tags="
				+ tags + ", titlepic=" + titlepic + ", visibility=" + visibility + ", time=" + time + ", uid=" + uid
				+ ", browse=" + browse + "]";
	}
}
