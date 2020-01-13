package com.fp.delight.performance.model;


//기획, 제작사 목록
public class PerformanceCompanyDTO {
	private String prfnm;	//최신작품	제2회 영재 국악회
	private String entrpsnm;	//기획/제작사명	락음국악단(URLEncoding)
	private String genrenm;	//장르	국악
	private String telno;	//전화번호	031-829-0414
	private String relateurl;	//홈페이지	http://www.rageum.org/
	private String mt30id;	//기획/제작사ID	AG002086
	
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getEntrpsnm() {
		return entrpsnm;
	}
	public void setEntrpsnm(String entrpsnm) {
		this.entrpsnm = entrpsnm;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getRelateurl() {
		return relateurl;
	}
	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}
	public String getMt30id() {
		return mt30id;
	}
	public void setMt30id(String mt30id) {
		this.mt30id = mt30id;
	}
	
	@Override
	public String toString() {
		return "PerformanceCompanyDTO [prfnm=" + prfnm + ", entrpsnm=" + entrpsnm + ", genrenm=" + genrenm + ", telno="
				+ telno + ", relateurl=" + relateurl + ", mt30id=" + mt30id + "]";
	}
	
	
}
