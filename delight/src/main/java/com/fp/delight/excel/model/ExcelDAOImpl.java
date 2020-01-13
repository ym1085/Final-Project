package com.fp.delight.excel.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDAOImpl implements ExcelDAO{
	private String namespace="com.mybatis.mapper.delight.excel.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertSido(AreaSidoVO areaSidoVo) {
		return sqlSession.insert(namespace+"insertSido", areaSidoVo);
	}

	@Override
	public int insertGugun(AreaGugunVO areaGugunVo) {
		return sqlSession.insert(namespace+"insertGugun", areaGugunVo);
	}
	
	
}
