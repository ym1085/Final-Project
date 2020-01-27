package com.fp.delight.member.model;

import java.sql.Timestamp;

import com.fp.delight.common.SearchVO;

public class MemberVO extends SearchVO {
	private String userid;
	private String username;
	private String password;
	private String birth;
	private String email1;
	private String email2;
	private String hp1;
	private String hp2;
	private String hp3;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String gender;
	private String mailAgreement;
	private String mailAuthen;
	private int mileagePoint;
	private Timestamp logoutDate;
	private Timestamp joinDate;
	private Timestamp outDate;
	private int outReasonNo;
	private int gradeSeq;
	private String gradeName;
	private String SALT;
	
	public String getSALT() {
		return SALT;
	}
	public void setSALT(String sALT) {
		SALT = sALT;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMailAgreement() {
		return mailAgreement;
	}
	public void setMailAgreement(String mailAgreement) {
		this.mailAgreement = mailAgreement;
	}
	public String getMailAuthen() {
		return mailAuthen;
	}
	public void setMailAuthen(String mailAuthen) {
		this.mailAuthen = mailAuthen;
	}
	public int getMileagePoint() {
		return mileagePoint;
	}
	public void setMileagePoint(int mileagePoint) {
		this.mileagePoint = mileagePoint;
	}
	public Timestamp getLogoutDate() {
		return logoutDate;
	}
	public void setLogoutDate(Timestamp logoutDate) {
		this.logoutDate = logoutDate;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public Timestamp getOutDate() {
		return outDate;
	}
	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
	}
	public int getOutReasonNo() {
		return outReasonNo;
	}
	public void setOutReasonNo(int outReasonNo) {
		this.outReasonNo = outReasonNo;
	}
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
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", username=" + username + ", password=" + password + ", birth=" + birth
				+ ", email1=" + email1 + ", email2=" + email2 + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", gender="
				+ gender + ", mailAgreement=" + mailAgreement + ", mailAuthen=" + mailAuthen + ", mileagePoint="
				+ mileagePoint + ", logoutDate=" + logoutDate + ", joinDate=" + joinDate + ", outDate=" + outDate
				+ ", outReasonNo=" + outReasonNo + ", gradeSeq=" + gradeSeq + ", gradeName=" + gradeName + ", SALT="
				+ SALT + ", toString()=" + super.toString() + "]";
	}
	
	

	
}
