package com.fp.delight.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int loginCheck(String userid, String password) {
		String dbPwd=memberDao.selectPwd(userid);
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=NONE_USERID;
		}else {
			if(dbPwd.equals(password)) {
				result=LOGIN_OK;
			}else {
				result=DISAGREE_PWD;
			}
		}
		
		return result;
	}

	@Override
	public MemberVO selectMember(String userid) {
		return memberDao.selectMember(userid);
	}
	//중복체크
	@Override
	public int selectDupUserid(String userid) {
		int result = 0;
		
		int count = memberDao.selectDupUserid(userid);
		if(count>0) {
			result = EXIST_ID;
		}else {
			result = USEFUL_ID;
		}
	
		return result;
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}
	
}
