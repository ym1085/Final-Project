package com.fp.delight.recent.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecentDAOMybatis implements RecentDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.recent.";

	@Override
	public int insertRecent(RecentVO recentVo) {
		return sqlSession.insert(namespace+"insertRecent",recentVo);
	}
	
}
