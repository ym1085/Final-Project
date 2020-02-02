package com.fp.delight.refundbec.model;

public class RefundbecVO {
	private int refundbecSeq;
	private String detail;
	
	public int getRefundbecSeq() {
		return refundbecSeq;
	}
	
	public void setRefundbecSeq(int refundbecSeq) {
		this.refundbecSeq = refundbecSeq;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Override
	public String toString() {
		return "RefundbecVO [refundbecSeq=" + refundbecSeq + ", detail=" + detail + "]";
	}
	

	
	
}
