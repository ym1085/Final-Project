package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.member.model.MemberVO;

@Repository
public class MemberManagerDAOMybatis implements MemberManagerDAO {
	private String namespace="com.mybatis.mapper.usermanagement.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVO> noneWithdrawal(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"noneWithdrawal", memberVo);
	}

	@Override
	public int noneWithdrawalTotal(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"noneWithdrawalTotal", memberVo);
	}

	@Override
	public List<Map<String, Object>> withdrawal(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"withdrawal", memberVo);
	}

	@Override
	public int withdrawalTotal(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"withdrawalTotal", memberVo);
	}

	@Override
	public int forcedExit(String userid) {
		return sqlSession.update(namespace+"forcedExit", userid);
	}

	@Override
	public int cancle(String userid) {
		return sqlSession.update(namespace+"cancle", userid);
	}

	@Override
	public List<MemberVO> userAll() {
		return sqlSession.selectList(namespace+"userAll");
	}

	@Override
	public List<Map<String, Object>> paymentList(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"paymentList", memberVo);
	}

	@Override
	public int paymentTotal(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"paymentTotal", memberVo);
	}

	@Override
	public int totalpayment(String userid) {
		int cnt=0;
		if(sqlSession.selectOne(namespace+"totalpayment", userid)!=null) {
			cnt=sqlSession.selectOne(namespace+"totalpayment", userid);
		}
		return cnt;
	}

	@Override
	public int totalrefund(String userid) {
		int cnt=0;
		if(sqlSession.selectOne(namespace+"totalrefund", userid)!=null) {
			cnt=sqlSession.selectOne(namespace+"totalrefund", userid);
		}
		return cnt;
	}

}
