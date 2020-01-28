package com.fp.delight.inquery.model;

import java.sql.Timestamp;

public class InqueryVO {
	private int inquerySeq;
	private String inqueryContent;
	private Timestamp regDate;
	private String inqueryTitle;
	private String inqueryCondition;
	private String userid;
	private String username;
	private String email;
	private String hp;
	
	public int getInquerySeq() {
		return inquerySeq;
	}
	public void setInquerySeq(int inquerySeq) {
		this.inquerySeq = inquerySeq;
	}
	public String getInqueryContent() {
		return inqueryContent;
	}
	public void setInqueryContent(String inqueryContent) {
		this.inqueryContent = inqueryContent;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getInqueryTitle() {
		return inqueryTitle;
	}
	public void setInqueryTitle(String inqueryTitle) {
		this.inqueryTitle = inqueryTitle;
	}
	public String getInqueryCondition() {
		return inqueryCondition;
	}
	public void setInqueryCondition(String inqueryCondition) {
		this.inqueryCondition = inqueryCondition;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	@Override
	public String toString() {
		return "InqueryVO [inquerySeq=" + inquerySeq + ", inqueryContent=" + inqueryContent + ", regDate=" + regDate
				+ ", inqueryTitle=" + inqueryTitle + ", inqueryCondition=" + inqueryCondition + ", userid=" + userid
				+ ", username=" + username + ", email=" + email + ", hp=" + hp + "]";
	}
	

	
}
