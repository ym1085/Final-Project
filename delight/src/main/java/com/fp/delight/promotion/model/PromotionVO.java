package com.fp.delight.promotion.model;

import java.sql.Timestamp;

import com.fp.delight.common.SearchVO;

public class PromotionVO extends SearchVO{
	private int promoteSeq;
	private String promoteTitle;
	private String promoteContent;
	private String promoteP1;
	private Timestamp reviewRegdate;
	private String mileagegive;
	private String userid;
	public int getPromoteSeq() {
		return promoteSeq;
	}
	public void setPromoteSeq(int promoteSeq) {
		this.promoteSeq = promoteSeq;
	}
	public String getPromoteTitle() {
		return promoteTitle;
	}
	public void setPromoteTitle(String promoteTitle) {
		this.promoteTitle = promoteTitle;
	}
	public String getPromoteContent() {
		return promoteContent;
	}
	public void setPromoteContent(String promoteContent) {
		this.promoteContent = promoteContent;
	}
	public String getPromoteP1() {
		return promoteP1;
	}
	public void setPromoteP1(String promoteP1) {
		this.promoteP1 = promoteP1;
	}
	public Timestamp getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Timestamp reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	public String getMileagegive() {
		return mileagegive;
	}
	public void setMileagegive(String mileagegive) {
		this.mileagegive = mileagegive;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "PromotionVO [promoteSeq=" + promoteSeq + ", promoteTitle=" + promoteTitle + ", promoteContent="
				+ promoteContent + ", promoteP1=" + promoteP1 + ", reviewRegdate=" + reviewRegdate + ", mileagegive="
				+ mileagegive + ", userid=" + userid + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
