package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.member.model.MemberVO;

@Service
public class MemberManagerServiceImpl implements MemberManagerService{
	
	@Autowired
	private MemberManagerDAO memberManagerDao;

	@Override
	public List<MemberVO> noneWithdrawal(MemberVO memberVo) {
		return memberManagerDao.noneWithdrawal(memberVo);
	}

	@Override
	public int noneWithdrawalTotal(MemberVO memberVo) {
		return memberManagerDao.noneWithdrawalTotal(memberVo);
	}

	@Override
	public List<Map<String, Object>> withdrawal(MemberVO memberVo) {
		return memberManagerDao.withdrawal(memberVo);
	}

	@Override
	public int withdrawalTotal(MemberVO memberVo) {
		return memberManagerDao.withdrawalTotal(memberVo);
	}
}
