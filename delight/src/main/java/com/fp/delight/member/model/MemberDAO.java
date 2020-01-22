package com.fp.delight.member.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	String selectPwd(String userid);
	MemberVO selectMember(String userid);
	int selectDupUserid(String userid);
	int insertMember(MemberVO memberVo);
	String selectUserid(MemberVO memberVo);
	int selectUserPwd(MemberVO memberVo);
	int findePwdSet(MemberVO memberVo);
	int updateLogOut(String userid);
	int updateMember(MemberVO memberVo);
	List<Map<String, Object>> selectOut();
	int withdrawMember(MemberVO memberVo);
	String getSaltById(String userid);
	Map<String, Object> selectMemberGrade(String userid);
	Map<String, Object> selectMemberShip(String userid);
}
