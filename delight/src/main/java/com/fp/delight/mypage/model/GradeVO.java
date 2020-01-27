package com.fp.delight.mypage.model;

public class GradeVO {
	private int gradeSeq;
	private String gradeName;
	private int gradeStandard;
	private int gradeBenefit;
	
	public int getGradeSeq() {
		return gradeSeq;
	}
	public void setGradeSeq(int gradeSeq) {
		this.gradeSeq = gradeSeq;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getGradeStandard() {
		return gradeStandard;
	}
	public void setGradeStandard(int gradeStandard) {
		this.gradeStandard = gradeStandard;
	}
	public int getGradeBenefit() {
		return gradeBenefit;
	}
	public void setGradeBenefit(int gradeBenefit) {
		this.gradeBenefit = gradeBenefit;
	}
	@Override
	public String toString() {
		return "GradeVO [gradeSeq=" + gradeSeq + ", gradeName=" + gradeName + ", gradeStandard=" + gradeStandard
				+ ", gradeBenefit=" + gradeBenefit + "]";
	}
	
	
	
}
