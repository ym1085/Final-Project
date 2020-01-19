package com.fp.delight.admin.salesManagement.Model;

public class TicketDiscountVO {
	private int discountSeq;
	private String detail;
	private int percent;
	private int ticketSeq;
	public int getDiscountSeq() {
		return discountSeq;
	}
	public void setDiscountSeq(int discountSeq) {
		this.discountSeq = discountSeq;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getTicketSeq() {
		return ticketSeq;
	}
	public void setTicketSeq(int ticketSeq) {
		this.ticketSeq = ticketSeq;
	}
	@Override
	public String toString() {
		return "TicketDiscountVO [discountSeq=" + discountSeq + ", detail=" + detail + ", percent=" + percent
				+ ", ticketSeq=" + ticketSeq + "]";
	}
	
	
}
