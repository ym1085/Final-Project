package com.fp.delight.common.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.excel.model.AreaGugunVO;
import com.fp.delight.excel.model.AreaSidoVO;

@Repository
public class AreaDAOMybatis implements AreaDAO{
	
	private String namespace="com.mybatis.mapper.area.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AreaSidoVO> selectSido() {
		return sqlSession.selectList(namespace+"selectSido");
	}

	@Override
	public List<AreaGugunVO> gugunSelectBySido(String sido) {
		return sqlSession.selectList(namespace+"gugunSelectBySido", sido);
	}
	
	
}
