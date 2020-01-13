package com.fp.delight.member.model;

public interface MemberDAO {
	String selectPwd(String userid);
	MemberVO selectMember(String userid);
	int selectDupUserid(String userid);
	int insertMember(MemberVO memberVo);
}
