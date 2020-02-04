package com.fp.delight.mileage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MileageDAOMybatis implements MileageDAO{
	private String namespace = "com.mybatis.mapper.mileage.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> earnMileage(MileageVO mileageVo) {
		return sqlSession.selectList(namespace+"earnMileage", mileageVo);
	}
	
	
}
