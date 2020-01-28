package com.fp.delight.inquery.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InqueryDAOMybatis implements InqueryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.inquery.";

	@Override
	public int Inquerywrite(InqueryVO inqueryVo) {
		return sqlSession.insert(namespace+"Inquerywrite",inqueryVo);
	}
	
}
