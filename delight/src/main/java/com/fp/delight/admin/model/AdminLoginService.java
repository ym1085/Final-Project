package com.fp.delight.admin.model;

import com.fp.delight.member.model.MemberVO;

public interface AdminLoginService {
	int adminLoginchk(String userid, String pwd);
	MemberVO selectAdmin(String userid);
	int adminLogout(String userid);
	int adminPwdCg(MemberVO memberVo);
	int adminPwdFind(MemberVO memberVo);
}
