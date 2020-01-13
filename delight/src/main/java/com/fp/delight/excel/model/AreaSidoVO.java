package com.fp.delight.excel.model;

public class AreaSidoVO {
	private int signgucode;
	private String sido;
	
	public int getSigngucode() {
		return signgucode;
	}
	public void setSigngucode(int signgucode) {
		this.signgucode = signgucode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	
	@Override
	public String toString() {
		return "AreaSidoVO [signgucode=" + signgucode + ", sido=" + sido + "]";
	}
	
	
}
