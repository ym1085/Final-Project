package com.fp.delight.performance.model;


//공연상세
public class PerformanceDetailDTO {
	private String mt20id;	//공연ID
	private String mt10id;	//공연시설ID	
	private String prfnm;	//공연명	
	private String prfpdfrom;	//공연시작일	
	private String prfpdto;	//공연종료일	
	private String fcltynm;	//공연시설명
	private String prfcast;	//공연출연진
	private String prfcrew;	//공연제작진	
	private String prfruntime;	//공연 런타임
	private String prfage;	//공연 관람 연령	
	private String entrpsnm;	//제작사	
	private String pcseguidance;	//티켓가격	
	private String poster;	//포스터이미지경로	
	private String sty;	//줄거리	
	private String genrenm;	//장르	연극
	private String prfstate;	//공연상태	공연중
	private String openrun;	//오픈런	Y
	private String styurls;	//소개이미지목록	
	private String styurl;	//소개이미지1~4
	private String dtguidance;	//공연시간
	
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
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
	public String getPrfcast() {
		return prfcast;
	}
	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}
	public String getPrfcrew() {
		return prfcrew;
	}
	public void setPrfcrew(String prfcrew) {
		this.prfcrew = prfcrew;
	}
	public String getPrfruntime() {
		return prfruntime;
	}
	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}
	public String getPrfage() {
		return prfage;
	}
	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}
	public String getEntrpsnm() {
		return entrpsnm;
	}
	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}
	public String getPcseguidance() {
		return pcseguidance;
	}
	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getSty() {
		return sty;
	}
	public void setSty(String sty) {
		this.sty = sty;
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
	public String getStyurls() {
		return styurls;
	}
	public void setStyurls(String styurls) {
		this.styurls = styurls;
	}
	public String getStyurl() {
		return styurl;
	}
	public void setStyurl(String styurl) {
		this.styurl = styurl;
	}
	public String getDtguidance() {
		return dtguidance;
	}
	public void setDtguidance(String dtguidance) {
		this.dtguidance = dtguidance;
	}
	
	
	@Override
	public String toString() {
		return "PerformanceDetailDTO [mt20id=" + mt20id + ", mt10id=" + mt10id + ", prfnm=" + prfnm + ", prfpdfrom="
				+ prfpdfrom + ", prfpdto=" + prfpdto + ", fcltynm=" + fcltynm + ", prfcast=" + prfcast + ", prfcrew="
				+ prfcrew + ", prfruntime=" + prfruntime + ", prfage=" + prfage + ", entrpsnm=" + entrpsnm
				+ ", pcseguidance=" + pcseguidance + ", poster=" + poster + ", sty=" + sty + ", genrenm=" + genrenm
				+ ", prfstate=" + prfstate + ", openrun=" + openrun + ", styurls=" + styurls + ", styurl=" + styurl
				+ ", dtguidance=" + dtguidance + "]";
	}
}
	