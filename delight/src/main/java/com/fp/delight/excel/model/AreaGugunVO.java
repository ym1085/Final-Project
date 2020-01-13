package com.fp.delight.excel.model;

public class AreaGugunVO {
	private int signgucodesub;
	private String gugun;
	
	public int getSigngucodesub() {
		return signgucodesub;
	}
	public void setSigngucodesub(int signgucodesub) {
		this.signgucodesub = signgucodesub;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	
	@Override
	public String toString() {
		return "AreaGugunVO [signgucodesub=" + signgucodesub + ", gugun=" + gugun + "]";
	}
	
}
