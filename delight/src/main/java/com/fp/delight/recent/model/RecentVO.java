package com.fp.delight.recent.model;

import java.sql.Timestamp;

import com.fp.delight.common.SearchVO;

public class RecentVO extends SearchVO{
	private int recentSeq;
	private String iporid;
	private String mt20id;
	private String prfnm;
	private Timestamp showdate;
	
	public int getRecentSeq() {
		return recentSeq;
	}
	public void setRecentSeq(int recentSeq) {
		this.recentSeq = recentSeq;
	}
	public String getIporid() {
		return iporid;
	}
	public void setIporid(String iporid) {
		this.iporid = iporid;
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
	public Timestamp getShowdate() {
		return showdate;
	}
	public void setShowdate(Timestamp showdate) {
		this.showdate = showdate;
	}
	@Override
	public String toString() {
		return "RecentVO [recentSeq=" + recentSeq + ", iporid=" + iporid + ", mt20id=" + mt20id + ", prfnm=" + prfnm
				+ ", showdate=" + showdate + "]";
	}
	
	
	
}
