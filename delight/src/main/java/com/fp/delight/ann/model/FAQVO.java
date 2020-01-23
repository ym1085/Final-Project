package com.fp.delight.ann.model;

import java.sql.Timestamp;

import com.fp.delight.common.SearchVO;

public class FAQVO extends SearchVO{
	private int faqSeq;
	private String faqTitle;
	private String faqContent;
	private String faqType;
	private Timestamp faqRegdate;
	private String userid;
	public int getFaqSeq() {
		return faqSeq;
	}
	public void setFaqSeq(int faqSeq) {
		this.faqSeq = faqSeq;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqType() {
		return faqType;
	}
	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}
	public Timestamp getFaqRegdate() {
		return faqRegdate;
	}
	public void setFaqRegdate(Timestamp faqRegdate) {
		this.faqRegdate = faqRegdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "FAQVO [faqSeq=" + faqSeq + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqType="
				+ faqType + ", faqRegdate=" + faqRegdate + ", userid=" + userid + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
}
