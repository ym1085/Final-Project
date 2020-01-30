package com.fp.delight.member.model;

import java.sql.Timestamp;

public class PremiumVO {
	private int premium_seq; 			/* 회원권 번호 */
	private String name; 				/* 회원권 이름 */
	private String detail;  			/* 상세혜택 */
	private Timestamp start_date;		/* 혜택 시작일 */
	private Timestamp end_date; 		/* 혜택 종료일 */
	private String userid; 				/* 아이디 */
	
	public int getPremium_seq() {
		return premium_seq;
	}
	public void setPremium_seq(int premium_seq) {
		this.premium_seq = premium_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return "PremiumVO [premium_seq=" + premium_seq + ", name=" + name + ", detail=" + detail + ", start_date="
				+ start_date + ", end_date=" + end_date + ", userid=" + userid + "]";
	}
}
