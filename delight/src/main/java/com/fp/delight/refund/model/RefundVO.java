package com.fp.delight.refund.model;

import java.sql.Timestamp;

public class RefundVO {
	private int refundSeq;
	private String compflag;
	private int refundPrice;
	private int paySeq;
	private int refundbecSeq;
	private Timestamp refundCancle;
	private Timestamp refundCancleOk;
	public int getRefundSeq() {
		return refundSeq;
	}
	public void setRefundSeq(int refundSeq) {
		this.refundSeq = refundSeq;
	}
	public String getCompflag() {
		return compflag;
	}
	public void setCompflag(String compflag) {
		this.compflag = compflag;
	}
	public int getRefundPrice() {
		return refundPrice;
	}
	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}
	public int getPaySeq() {
		return paySeq;
	}
	public void setPaySeq(int paySeq) {
		this.paySeq = paySeq;
	}
	public int getRefundbecSeq() {
		return refundbecSeq;
	}
	public void setRefundbecSeq(int refundbecSeq) {
		this.refundbecSeq = refundbecSeq;
	}
	public Timestamp getRefundCancle() {
		return refundCancle;
	}
	public void setRefundCancle(Timestamp refundCancle) {
		this.refundCancle = refundCancle;
	}
	public Timestamp getRefundCancleOk() {
		return refundCancleOk;
	}
	public void setRefundCancleOk(Timestamp refundCancleOk) {
		this.refundCancleOk = refundCancleOk;
	}
	@Override
	public String toString() {
		return "RefundVO [refundSeq=" + refundSeq + ", compflag=" + compflag + ", refundPrice=" + refundPrice
				+ ", paySeq=" + paySeq + ", refundbecSeq=" + refundbecSeq + ", refundCancle=" + refundCancle
				+ ", refundCancleOk=" + refundCancleOk + "]";
	}
	
	
	
}
