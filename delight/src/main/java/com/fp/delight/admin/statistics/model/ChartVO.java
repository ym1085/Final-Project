package com.fp.delight.admin.statistics.model;

import java.sql.Date;

public class ChartVO {
	private String age;
	private Double total;
	private Date day;
	private int join;
	private Long totalsales;
	private int totalselled;
	private String type;
	
	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getJoin() {
		return join;
	}

	public void setJoin(int join) {
		this.join = join;
	}

	public Long getTotalsales() {
		return totalsales;
	}

	public void setTotalsales(Long totalsales) {
		this.totalsales = totalsales;
	}

	public int getTotalselled() {
		return totalselled;
	}

	public void setTotalselled(int totalselled) {
		this.totalselled = totalselled;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ChartVO [age=" + age + ", total=" + total + ", day=" + day + ", join=" + join + ", totalsales="
				+ totalsales + ", totalselled=" + totalselled + ", type=" + type + "]";
	}

	

	
	

	

	

	
	
	
	
}
