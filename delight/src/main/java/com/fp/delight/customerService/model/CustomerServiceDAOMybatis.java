package com.fp.delight.customerService.model;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.ann.model.AnnVO;

@Repository
public class CustomerServiceDAOMybatis implements CustomerServiceDAO {

	private String namespace="com.mybatis.mapper.customerService.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AnnVO> selectAnnTop() {
		return sqlSession.selectList(namespace+"selectAnnTop");
	}

	@Override
	public int normalExposureTotal(AnnVO annVo) {
		return sqlSession.selectOne(namespace+"normalExposureTotal",annVo);
	}

	@Override
	public int eventExposureTotal(AnnVO annVo) {
		return sqlSession.selectOne(namespace+"eventExposureTotal",annVo);
	}

	@Override
	public List<AnnVO> eventExposureSearch(AnnVO annVo) {
		return sqlSession.selectList(namespace+"eventExposureSearch", annVo);
	}

	@Override
	public List<AnnVO> normalExposureSearch(AnnVO annVo) {
		return sqlSession.selectList(namespace+"normalExposureSearch", annVo);
	}
	
}
