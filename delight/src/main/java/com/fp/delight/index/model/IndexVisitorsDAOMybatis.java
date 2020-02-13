package com.fp.delight.index.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexVisitorsDAOMybatis implements IndexVisitorsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.index.";
	
	@Override
	public int selectSysdate(IndexVisitorsVO indexVisitorsVO) {
		return sqlSession.selectOne(namespace+"selectSysdate", indexVisitorsVO);
	}
	
	@Override
	public int insertSysdate(IndexVisitorsVO indexVisitorsVO) {
		return sqlSession.insert(namespace+"insertSysdate", indexVisitorsVO);
	}
	
	@Override
	public int updateSysdate(IndexVisitorsVO indexVisitorsVO) {
		return sqlSession.update(namespace+"updateSysdate", indexVisitorsVO);
	}
}


