package com.fp.delight.performent.model;

public class PerformentBoxOfficeVO {
	private String area; 	//지역	울산
	private String prfdtcnt;	//상연횟수	4
	private String prfpd;	//공연기간	2016.06.07~2016.07.24
	private String cate;	//장르	연극
	private String prfplcnm;	//공연장	소공연장
	private String prfnm;	//공연명	셜록홈즈 [울산]
	private String rnum;	//순위	1
	private String seatcnt;	//좌석수	212
	private String poster;	//포스터이미지	http://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg
	private String mt20id;
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPrfdtcnt() {
		return prfdtcnt;
	}
	public void setPrfdtcnt(String prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public String getPrfpd() {
		return prfpd;
	}
	public void setPrfpd(String prfpd) {
		this.prfpd = prfpd;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPrfplcnm() {
		return prfplcnm;
	}
	public void setPrfplcnm(String prfplcnm) {
		this.prfplcnm = prfplcnm;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getSeatcnt() {
		return seatcnt;
	}
	public void setSeatcnt(String seatcnt) {
		this.seatcnt = seatcnt;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMt20id() {
		return mt20id;
	}
	public void setMt20id(String mt20id) {
		this.mt20id = mt20id;
	}
	@Override
	public String toString() {
		return "BoxofficeDTO [area=" + area + ", prfdtcnt=" + prfdtcnt + ", prfpd=" + prfpd + ", cate=" + cate
				+ ", prfplcnm=" + prfplcnm + ", prfnm=" + prfnm + ", rnum=" + rnum + ", seatcnt=" + seatcnt
				+ ", poster=" + poster + ", mt20id=" + mt20id + "]";
	}
	
	
}
