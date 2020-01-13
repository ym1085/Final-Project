package com.fp.delight.performent.model;

public class PerformentTheaterDetailVO {
	private String fcltynm;	//공연시설명	올림픽공원
	private String mt10id;	//공연시설ID	FC001247
	private String mt13cnt;	//공연장 수	9
	private String fcltychartr;	//시설특성	기타(공공)
	private String opende;	//개관연도	1986
	private String seatscale;	//객석 수	32349
	private String telno;	//전화번호	02-410-1114
	private String relateurl;	//홈페이지	http://www.olympicpark.co.kr/
	private String adres;	//주소	서울특별시 송파구 방이동
	private String la;	
	private String lo;
	
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
	public String getOpende() {
		return opende;
	}
	public void setOpende(String opende) {
		this.opende = opende;
	}
	public String getSeatscale() {
		return seatscale;
	}
	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
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
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getLa() {
		return la;
	}
	public void setLa(String la) {
		this.la = la;
	}
	public String getLo() {
		return lo;
	}
	public void setLo(String lo) {
		this.lo = lo;
	}
	
	@Override
	public String toString() {
		return "PerformanceTheaterDetailDTO [fcltynm=" + fcltynm + ", mt10id=" + mt10id + ", mt13cnt=" + mt13cnt
				+ ", fcltychartr=" + fcltychartr + ", opende=" + opende + ", seatscale=" + seatscale + ", telno="
				+ telno + ", relateurl=" + relateurl + ", adres=" + adres + ", la=" + la + ", lo=" + lo + "]";
	}
	
}