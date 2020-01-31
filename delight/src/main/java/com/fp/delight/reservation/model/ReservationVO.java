package com.fp.delight.reservation.model;


public class ReservationVO {
	private int reservation_seq; 
	private String mt20id; 				//O
	private String prfnm; 				//O
	private String perfomtype; 			//O
	private String mt10id; 				//O
	private String select_date; 		//O
	private String select_time; 		//O
	private int booking;				//O
	private String seat_class;			//O
	private String pay_ticket_number; 	//x -> 난수
	private String res_date; 			//x	-> sysdate
	private String userid; 				//o
	private int ticket_seq;				//o
	private int pay_price;				//?
	
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
	}
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
	public String getPerfomtype() {
		return perfomtype;
	}
	public void setPerfomtype(String perfomtype) {
		this.perfomtype = perfomtype;
	}
	public String getMt10id() {
		return mt10id;
	}
	public void setMt10id(String mt10id) {
		this.mt10id = mt10id;
	}
	public String getSelect_date() {
		return select_date;
	}
	public void setSelect_date(String select_date) {
		this.select_date = select_date;
	}
	public String getSelect_time() {
		return select_time;
	}
	public void setSelect_time(String select_time) {
		this.select_time = select_time;
	}
	public int getBooking() {
		return booking;
	}
	public void setBooking(int booking) {
		this.booking = booking;
	}
	public String getSeat_class() {
		return seat_class;
	}
	public void setSeat_class(String seat_class) {
		this.seat_class = seat_class;
	}
	public String getPay_ticket_number() {
		return pay_ticket_number;
	}
	public void setPay_ticket_number(String pay_ticket_number) {
		this.pay_ticket_number = pay_ticket_number;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTicket_seq() {
		return ticket_seq;
	}
	public void setTicket_seq(int ticket_seq) {
		this.ticket_seq = ticket_seq;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [reservation_seq=" + reservation_seq + ", mt20id=" + mt20id + ", prfnm=" + prfnm
				+ ", perfomtype=" + perfomtype + ", mt10id=" + mt10id + ", select_date=" + select_date
				+ ", select_time=" + select_time + ", booking=" + booking + ", seat_class=" + seat_class
				+ ", pay_ticket_number=" + pay_ticket_number + ", res_date=" + res_date + ", userid=" + userid
				+ ", ticket_seq=" + ticket_seq + ", pay_price=" + pay_price + "]";
	} 
}
