package com.fp.delight.performent.model;

//공연목록
public class PerformentListVO {
	private String mt20id;	//공연ID
	private String prfnm;	//공연명
	private String prfpdfrom;	//공연시작일
	private String prfpdto;	//공연종료일
	private String fcltynm;	//공연시설명(공연장명)
	private String poster;	//포스터이미지경로
	private String genrenm;	//공연 장르명
	private String prfstate;	//공연상태
	private String openrun;	//오픈런
	
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
	public String getPrfpdfrom() {
		return prfpdfrom;
	}
	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}
	public String getPrfpdto() {
		return prfpdto;
	}
	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getPrfstate() {
		return prfstate;
	}
	public void setPrfstate(String prfstate) {
		this.prfstate = prfstate;
	}
	public String getOpenrun() {
		return openrun;
	}
	public void setOpenrun(String openrun) {
		this.openrun = openrun;
	}
	
	@Override
	public String toString() {
		return "PerformanceDTO [mt20id=" + mt20id + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom + ", prfpdto="
				+ prfpdto + ", fcltynm=" + fcltynm + ", poster=" + poster + ", genrenm=" + genrenm + ", prfstate="
				+ prfstate + ", openrun=" + openrun + "]";
	}
	
}
