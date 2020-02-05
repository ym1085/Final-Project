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
	public List<Map<String, Object>> myMileage(MileageVO mileageVo) {
		return sqlSession.selectList(namespace+"myMileage", mileageVo);
	}

	@Override
	public List<Map<String, Object>> selectAllMileage(MileageVO mileageVo) {
		return sqlSession.selectList(namespace+"selectAllMileage", mileageVo);
	}

	@Override
	public List<Map<String, Object>> selectChoiceMileage(MileageVO mileageVo) {
		return sqlSession.selectList(namespace+"selectChoiceMileage", mileageVo);
	}

	@Override
	public int selectTotalRecordforMileage(String userid) {
		return sqlSession.selectOne(namespace+"selectTotalRecordforMileage", userid);
	}
	
	
}
