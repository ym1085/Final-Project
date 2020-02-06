package com.fp.delight.ticket.model;

import java.sql.Timestamp;

import com.fp.delight.common.SearchVO;

public class TicketVO extends SearchVO{
	private int ticketSeq;
	private String mt20id;
	private String prfnm;
	private String prfdate;
	private String prfhour;
	private int sellticket;
	private String sellclass;
	private int netprice;
	private int selled;
	private Timestamp regdate;
	
	public int getTicketSeq() {
		return ticketSeq;
	}
	public void setTicketSeq(int ticketSeq) {
		this.ticketSeq = ticketSeq;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getPrfdate() {
		return prfdate;
	}
	public void setPrfdate(String prfdate) {
		this.prfdate = prfdate;
	}
	public String getPrfhour() {
		return prfhour;
	}
	public void setPrfhour(String prfhour) {
		this.prfhour = prfhour;
	}
	public int getSellticket() {
		return sellticket;
	}
	public void setSellticket(int sellticket) {
		this.sellticket = sellticket;
	}
	public String getSellclass() {
		return sellclass;
	}
	public void setSellclass(String sellclass) {
		this.sellclass = sellclass;
	}
	public int getNetprice() {
		return netprice;
	}
	public void setNetprice(int netprice) {
		this.netprice = netprice;
	}
	public int getSelled() {
		return selled;
	}
	public void setSelled(int selled) {
		this.selled = selled;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "TicketVO [ticketSeq=" + ticketSeq + ", mt20id=" + mt20id + ", prfnm=" + prfnm + ", prfdate=" + prfdate
				+ ", prfhour=" + prfhour + ", sellticket=" + sellticket + ", sellclass=" + sellclass + ", netprice="
				+ netprice + ", selled=" + selled + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
