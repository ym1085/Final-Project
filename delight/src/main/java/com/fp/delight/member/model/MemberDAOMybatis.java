package com.fp.delight.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.member.";

	@Override
	public String selectPwd(String userid) {
		return sqlSession.selectOne(namespace+"selectPwd",userid);
	}

	@Override
	public MemberVO selectMember(String userid) {
		return sqlSession.selectOne(namespace+"selectMember",userid);
	}
	
	public int selectDupUserid(String userid) {
		return sqlSession.selectOne(namespace+"selectDupUserid", userid);
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		return sqlSession.insert(namespace+"insertMember", memberVo);
	}
	
	@Override
	public String selectUserid(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"selectUserid",memberVo);
	}

	@Override
	public int selectUserPwd(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"selectUserPwd",memberVo);
	}

	@Override
	public int findePwdSet(MemberVO memberVo) {
		return sqlSession.update(namespace+"findePwdSet",memberVo);
	}

	@Override
	public int updateLogOut(String userid) {
		return sqlSession.update(namespace+"updateLogOut",userid);
	}

	@Override
	public int updateMember(MemberVO memberVo) {
		return sqlSession.update(namespace+"updateMember",memberVo);
	}

}
