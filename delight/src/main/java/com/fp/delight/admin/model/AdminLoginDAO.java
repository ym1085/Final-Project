package com.fp.delight.admin.model;

import com.fp.delight.member.model.MemberVO;

public interface AdminLoginDAO {
	String adminPwd(String userid);
	MemberVO selectAdmin(String userid);
}
