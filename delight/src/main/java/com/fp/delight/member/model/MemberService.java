package com.fp.delight.member.model;

import java.util.List;
import java.util.Map;

public interface MemberService {
	//로그인 처리
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	int NONE_USERID=3; //해당 아이디 존재하지 않음
	
	public static final int NO_INFO=4;//정보불일치
	public static final int OK_INFO=5;//정보일치
	
	static final int EXIST_ID=1;
	static final int USEFUL_ID=2;
	
	int loginCheck(String userid, String pwd);
	MemberVO selectMember(String userid);	
	int selectDupUserid(String userid);
	int insertMember(MemberVO memberVo); 
	String selectUserid(MemberVO memberVo);
	int selectUserChkInfo(MemberVO memberVo);
	int findePwdSet(MemberVO memberVo);
	int updateLogOut(String userid);
	int updateMember(MemberVO memberVo);
	List<Map<String, Object>> selectOut();
}	
