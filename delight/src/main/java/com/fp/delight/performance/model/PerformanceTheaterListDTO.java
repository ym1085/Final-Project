package com.fp.delight.performance.model;

public class PerformanceTheaterListDTO {
	private String fcltynm; //	공연시설명	경주예술의전당
	private String mt10id; //	공연시설ID	FC000517
	private String mt13cnt; //	공연장 수	2
	private String fcltychartr; //	시설특성	문예회관
	private String sidonm; //	지역(시도)	경북
	private String gugunnm; //	지역(구군)	경주시
	private String opende; //	개관연도	2010
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getMt13cnt() {
		return mt13cnt;
	}
	public void setMt13cnt(String mt13cnt) {
		this.mt13cnt = mt13cnt;
	}
	public String getFcltychartr() {
		return fcltychartr;
	}
	public void setFcltychartr(String fcltychartr) {
		this.fcltychartr = fcltychartr;
	}
	public String getSidonm() {
		return sidonm;
	}
	public void setSidonm(String sidonm) {
		this.sidonm = sidonm;
	}
	public String getGugunnm() {
		return gugunnm;
	}
	public void setGugunnm(String gugunnm) {
		this.gugunnm = gugunnm;
	}
	public String getOpende() {
		return opende;
	}
	public void setOpende(String opende) {
		this.opende = opende;
	}
	@Override
	public String toString() {
		return "PerformanceTheaterListDTO [fcltynm=" + fcltynm + ", mt10id=" + mt10id + ", mt13cnt=" + mt13cnt
				+ ", fcltychartr=" + fcltychartr + ", sidonm=" + sidonm + ", gugunnm=" + gugunnm + ", opende=" + opende
				+ "]";
	}
	
	
}
