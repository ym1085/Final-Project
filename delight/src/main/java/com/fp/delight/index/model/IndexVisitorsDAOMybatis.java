/*package com.fp.delight.index.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexVisitorsDAOMybatis implements IndexVisitorsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.index.";
	
	@Override
	public int insertSysdate(IndexVisitorsVO indexVisitorsVO) {
		return sqlSession.selectOne(namespace+"insertSysdate", indexVisitorsVO);
	}
}
*/