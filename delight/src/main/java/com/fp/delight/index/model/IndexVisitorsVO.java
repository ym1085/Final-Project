package com.fp.delight.index.model;

public class IndexVisitorsVO {
	
	private String visitorToday;
	private int visitorCount;
	
	
	public String getVisitorToday() {
		return visitorToday;
	}
	public void setVisitorToday(String visitorToday) {
		this.visitorToday = visitorToday;
	}
	public int getVisitorCount() {
		return visitorCount;
	}
	public void setVisitorCount(int visitorCount) {
		this.visitorCount = visitorCount;
	}
	
	
	@Override
	public String toString() {
		return "IndexVisitorsVO [visitorToday=" + visitorToday + ", visitorCount=" + visitorCount + "]";
	}
	
}
