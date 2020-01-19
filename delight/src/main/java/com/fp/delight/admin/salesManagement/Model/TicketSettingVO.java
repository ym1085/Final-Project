package com.fp.delight.admin.salesManagement.Model;

import java.sql.Timestamp;

public class TicketSettingVO {
	private int ticketSeq;
	private String mt20id;
	private String prfdate;
	private String prfhour;
	private int sellticket;
	private String sellclass;
	private int netprice;
	private String prfnm;
	private Timestamp regdate;
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getTicketSeq() {
		return ticketSeq;
	}
	public void setTicketSeq(int ticketSeq) {
		this.ticketSeq = ticketSeq;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	@Override
	public String toString() {
		return "TicketSettingVO [ticketSeq=" + ticketSeq + ", mt20id=" + mt20id + ", prfdate=" + prfdate + ", prfhour="
				+ prfhour + ", sellticket=" + sellticket + ", sellclass=" + sellclass + ", netprice=" + netprice
				+ ", prfnm=" + prfnm + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
