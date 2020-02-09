package com.fp.delight.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMainDAOMybatis implements AdminMainDAO{
	private String namespace="com.mybatis.mapper.admin.main.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int todayInquery() {
		return sqlSession.selectOne(namespace+"todayInquery");
	}

	@Override
	public int tomorInquery() {
		return sqlSession.selectOne(namespace+"tomorInquery");
	}

	@Override
	public int todayRegister() {
		return sqlSession.selectOne(namespace+"todayRegister");
	}

	@Override
	public int tomorRegister() {
		return sqlSession.selectOne(namespace+"tomorRegister");
	}

	@Override
	public int tomorVisitor() {
		int cnt=0;
		
		if(sqlSession.selectOne(namespace+"tomorVisitor")!=null) {
			cnt=sqlSession.selectOne(namespace+"tomorVisitor");
		}
		
		return cnt;
	}

	@Override
	public int todayVisitor() {
		int cnt=0;
		
		if(sqlSession.selectOne(namespace+"todayVisitor")!=null) {
			cnt=sqlSession.selectOne(namespace+"todayVisitor");
		}
		
		return cnt;
	}
	
}
