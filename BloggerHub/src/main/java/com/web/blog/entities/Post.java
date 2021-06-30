package com.web.blog.entities;

import java.sql.Date;

public class Post {
	
	private int pid;
	private String date;
	private String Title;
	private int Cid;
	private String Content;
	private String Picture;
	private int Uid;
	private String cateogory;
	private String author;
	private String regdate;
	private String cname;

	public Post() {
		super();
	}

	public Post(String title, int cid, String content, String picture, int uid) {
		super();
		Title = title;
		Cid = cid;
		Content = content;
		Picture = picture;
		Uid = uid;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public int getCid() {
		return Cid;
	}

	public void setCid(int cid) {
		Cid = cid;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getPicture() {
		return Picture;
	}

	public void setPicture(String picture) {
		Picture = picture;
	}

	public int getUid() {
		return Uid;
	}

	public void setUid(int uid) {
		Uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String date) {
		this.regdate = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCateogory() {
		return cateogory;
	}

	public void setCateogory(String cateogory) {
		this.cateogory = cateogory;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}
