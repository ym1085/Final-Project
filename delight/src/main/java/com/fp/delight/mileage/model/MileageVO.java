package com.fp.delight.mileage.model;

import java.sql.Timestamp;

public class MileageVO {
	private int mileageSeq;
	private int mileagePoint;
	private Timestamp mileageReg;
	private String userid;
	private int mileaebecSeq;
	
	public int getMileageSeq() {
		return mileageSeq;
	}
	public void setMileageSeq(int mileageSeq) {
		this.mileageSeq = mileageSeq;
	}
	public int getMileagePoint() {
		return mileagePoint;
	}
	public void setMileagePoint(int mileagePoint) {
		this.mileagePoint = mileagePoint;
	}
	public Timestamp getMileageReg() {
		return mileageReg;
	}
	public void setMileageReg(Timestamp mileageReg) {
		this.mileageReg = mileageReg;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMileaebecSeq() {
		return mileaebecSeq;
	}
	public void setMileaebecSeq(int mileaebecSeq) {
		this.mileaebecSeq = mileaebecSeq;
	}
	
	@Override
	public String toString() {
		return "MileageVO [mileageSeq=" + mileageSeq + ", mileagePoint=" + mileagePoint + ", mileageReg=" + mileageReg
				+ ", userid=" + userid + ", mileaebecSeq=" + mileaebecSeq + "]";
	}
	
}
