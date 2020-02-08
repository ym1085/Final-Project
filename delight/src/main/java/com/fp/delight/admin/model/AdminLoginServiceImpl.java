package com.fp.delight.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.email.RandomKey;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{

	@Autowired
	private AdminLoginDAO adminLoginDao;

	@Override
	public int adminLoginchk(String userid, String pwd) {
		String dbPwd=adminLoginDao.adminPwd(userid);
		int res=0;
		if(dbPwd==null||dbPwd.isEmpty()) {
			res=MemberService.NONE_USERID;
		}else {
			if(dbPwd.equals(pwd)) {
				res=MemberService.LOGIN_OK;
			}else {
				res=MemberService.DISAGREE_PWD;
			}
		}
		return res;
	}

	@Override
	public MemberVO selectAdmin(String userid) {
		return adminLoginDao.selectAdmin(userid);
	}

	@Override
	public int adminLogout(String userid) {
		return adminLoginDao.adminLogout(userid);
	}

	@Override
	public int adminPwdCg(MemberVO memberVo) {
		return adminLoginDao.adminPwdCg(memberVo);
	}

	@Override
	public int adminPwdFind(MemberVO memberVo) {
		int cnt=adminLoginDao.adminCount(memberVo);
		if(cnt==0) {
			return -1;
		}else {
			RandomKey key=new RandomKey();
			String tempPwd=key.randomKey1();
			memberVo.setPassword(tempPwd);
			
			return adminPwdCg(memberVo);
		}
		
		
	}

	
}
