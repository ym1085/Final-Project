package com.fp.delight.refundbec.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundbecDAOMybatis implements RefundbecDAO{
	private String namespace="com.mybatis.mapper.refundbec.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RefundbecVO> selectRefundbecAll() {
		return sqlSession.selectList(namespace+"selectRefundbecAll");
	}
	
}
