package com.fp.delight.performent.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerfomDAOMybatis implements PerfomDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.perfom.";

	@Override
	public List<Map<String, Object>> selectreserList(String perfomid) {
		return sqlSession.selectList(namespace+"selectreserList",perfomid);
		
	}
}
