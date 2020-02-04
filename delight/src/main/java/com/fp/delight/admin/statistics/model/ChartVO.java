package com.fp.delight.admin.statistics.model;

public class ChartVO {
	private String age;
	private Double total;

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

	@Override
	public String toString() {
		return "ChartVO [age=" + age + ", total=" + total + "]";
	}

	

	
	
	
	
}
