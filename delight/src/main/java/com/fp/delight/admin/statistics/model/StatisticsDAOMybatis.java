package com.fp.delight.admin.statistics.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsDAOMybatis implements StatisticsDAO {
	private String namespace="com.mybatis.mapper.admin.statistics.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> gendercount() {
		return sqlSession.selectList(namespace+"gendercount");
	}

	@Override
	public List<ChartVO> agegroup() {
		return sqlSession.selectList(namespace+"agegroup");
	}
	
	
}
