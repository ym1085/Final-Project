package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int forcedExit(String userid) {
		return memberManagerDao.forcedExit(userid);
	}

	@Override
	public int cancle(String userid) {
		return memberManagerDao.cancle(userid);
	}

	@Override
	@Transactional
	public int multiforcedExit(List<MemberVO> list) {
		int cnt=0;
		try {
			for(MemberVO vo: list) {
				String userid=vo.getUserid();
				if(userid!=null && !userid.isEmpty()) {
					cnt=memberManagerDao.forcedExit(userid);
				}
			}	
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		
		return cnt;
	}

	@Override
	@Transactional
	public int multiCancle(List<MemberVO> list) {
		int cnt=0;
		try {
			for(MemberVO vo:list) {
				String userid=vo.getUserid();
				if(userid!=null && !userid.isEmpty()) {
					cnt=memberManagerDao.cancle(userid);
				}
			}
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		
		return cnt;
	}

	@Override
	public List<MemberVO> userAll() {
		return memberManagerDao.userAll();
	}

	@Override
	public List<Map<String, Object>> paymentList(MemberVO memberVo) {
		return memberManagerDao.paymentList(memberVo);
	}

	@Override
	public int paymentTotal(MemberVO memberVo) {
		return memberManagerDao.paymentTotal(memberVo);
	}

	@Override
	public int totalpayment(String userid) {
		return memberManagerDao.totalpayment(userid);
	}

	@Override
	public int totalrefund(String userid) {
		return memberManagerDao.totalrefund(userid);
	}
}
