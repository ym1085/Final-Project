package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import com.fp.delight.member.model.MemberVO;

public class MemberListVO {
	List<MemberVO> memberList;

	public List<MemberVO> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}

	@Override
	public String toString() {
		return "MemberListVO [memberList=" + memberList + "]";
	}
	
	
}
