package com.fp.delight.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int reviewSeq;
	private String reviewType;
	private String reviewMt20id;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewP1;
	private String reviewP2;
	private String reviewP3;
	private Timestamp reviewRegdate;
	private int reviewMileage;
	private String userid;
	private int reservationSeq;
	public int getReviewSeq() {
		return reviewSeq;
	}
	public void setReviewSeq(int reviewSeq) {
		this.reviewSeq = reviewSeq;
	}
	public String getReviewType() {
		return reviewType;
	}
	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}
	public String getReviewMt20id() {
		return reviewMt20id;
	}
	public void setReviewMt20id(String reviewMt20id) {
		this.reviewMt20id = reviewMt20id;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewP1() {
		return reviewP1;
	}
	public void setReviewP1(String reviewP1) {
		this.reviewP1 = reviewP1;
	}
	public String getReviewP2() {
		return reviewP2;
	}
	public void setReviewP2(String reviewP2) {
		this.reviewP2 = reviewP2;
	}
	public String getReviewP3() {
		return reviewP3;
	}
	public void setReviewP3(String reviewP3) {
		this.reviewP3 = reviewP3;
	}
	public Timestamp getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(Timestamp reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	public int getReviewMileage() {
		return reviewMileage;
	}
	public void setReviewMileage(int reviewMileage) {
		this.reviewMileage = reviewMileage;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getReservationSeq() {
		return reservationSeq;
	}
	public void setReservationSeq(int reservationSeq) {
		this.reservationSeq = reservationSeq;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewSeq=" + reviewSeq + ", reviewType=" + reviewType + ", reviewMt20id=" + reviewMt20id
				+ ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewScore=" + reviewScore
				+ ", reviewP1=" + reviewP1 + ", reviewP2=" + reviewP2 + ", reviewP3=" + reviewP3 + ", reviewRegdate="
				+ reviewRegdate + ", reviewMileage=" + reviewMileage + ", userid=" + userid + ", reservationSeq="
				+ reservationSeq + "]";
	}
	
	
	
}
