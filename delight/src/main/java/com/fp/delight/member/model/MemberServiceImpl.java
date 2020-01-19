package com.fp.delight.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.common.SHA256Util;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int loginCheck(String userid, String password) {
		
		String salt=memberDao.getSaltById(userid);
		password=SHA256Util.getEncrypt(password, salt);
		
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
		
		String salt= SHA256Util.generateSalt();
		memberVo.setSALT(salt);
		
		String password=memberVo.getPassword();
		password= SHA256Util.getEncrypt(password, salt);
		
		memberVo.setPassword(password);
		return memberDao.insertMember(memberVo);
	}

	@Override
	public String selectUserid(MemberVO memberVo) {
		return memberDao.selectUserid(memberVo);
	}

	@Override
	public int selectUserChkInfo(MemberVO memberVo) {
		int result=0;
		
		int cnt=memberDao.selectDupUserid(memberVo.getUserid());
		
		if(cnt>0) {
			int cnt2=memberDao.selectUserPwd(memberVo);
			if(cnt2>0) {
				result=OK_INFO;//정보 일치
			}else {
				result=NO_INFO;//이메일 일치하지않음
			}
		}else {
			result=NONE_USERID; //해당아이디 존재하지않음
		}
		
		return result;
	}

	@Override
	public int findePwdSet(MemberVO memberVo) {
		return memberDao.findePwdSet(memberVo);
	}

	@Override
	public int updateLogOut(String userid) {
		return memberDao.updateLogOut(userid);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return memberDao.updateMember(memberVo);
	}

	@Override
	public List<Map<String, Object>> selectOut() {
		return memberDao.selectOut();
	}

	@Override
	public int withdrawMember(MemberVO memberVo) {
		return memberDao.withdrawMember(memberVo);
	}

}
