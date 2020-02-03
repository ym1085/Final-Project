package com.fp.delight.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int pay_seq; 
	private int pay_price; 
	private Timestamp reg_date; 
	private String pay_condition; 
	private int reservation_seq;
	private int usedmileage;
	
	public int getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getPay_condition() {
		return pay_condition;
	}
	public void setPay_condition(String pay_condition) {
		this.pay_condition = pay_condition;
	}
	public int getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
	}
	public int getUsedmileage() {
		return usedmileage;
	}
	public void setUsedmileage(int usedmileage) {
		this.usedmileage = usedmileage;
	}
	@Override
	public String toString() {
		return "PaymentVO [pay_seq=" + pay_seq + ", pay_price=" + pay_price + ", reg_date=" + reg_date
				+ ", pay_condition=" + pay_condition + ", reservation_seq=" + reservation_seq + ", usedmileage="
				+ usedmileage + "]";
	}
	
}
