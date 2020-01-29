package com.fp.delight.admin.userManagemet.model;

import java.sql.Timestamp;

public class InqAnwVO {
	private int inqanwSeq;
	private String inqanwContent;
	private Timestamp regDate;
	private int inquerySeq;
	private String userid;
	
	public int getInqanwSeq() {
		return inqanwSeq;
	}
	public void setInqanwSeq(int inqanwSeq) {
		this.inqanwSeq = inqanwSeq;
	}
	public String getInqanwContent() {
		return inqanwContent;
	}
	public void setInqanwContent(String inqanwContent) {
		this.inqanwContent = inqanwContent;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getInquerySeq() {
		return inquerySeq;
	}
	public void setInquerySeq(int inquerySeq) {
		this.inquerySeq = inquerySeq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "InqAnwVO [inqanwSeq=" + inqanwSeq + ", inqanwContent=" + inqanwContent + ", regDate=" + regDate
				+ ", inquerySeq=" + inquerySeq + ", userid=" + userid + "]";
	}
	
	
}
