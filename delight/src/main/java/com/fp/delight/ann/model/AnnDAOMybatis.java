package com.fp.delight.ann.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnnDAOMybatis implements AnnDAO{
	private String namespace="com.mybatis.mapper.delight.adminAnn.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int annInsert(AnnVO annVo) {
		return sqlSession.insert(namespace+"annInsert", annVo);
	}
	
	@Override
	public List<AnnVO> annList(AnnVO annVo) {
		return sqlSession.selectList(namespace+"normalSearch", annVo);
	}

	@Override
	public int normalTotal(AnnVO annVo) {
		return sqlSession.selectOne(namespace+"normalTotal", annVo);
	}

	@Override
	public List<AnnVO> eventSearch(AnnVO annVo) {
		return sqlSession.selectList(namespace+"eventSearch", annVo);
	}

	@Override
	public int eventTotal(AnnVO annVo) {
		return sqlSession.selectOne(namespace+"eventTotal", annVo);
	}

	@Override
	public int normalDel(int annSeq) {
		return sqlSession.delete(namespace+"normalDel",annSeq);
	}

	@Override
	public int annExposure(int annSeq) {
		return sqlSession.update(namespace+"annExposure", annSeq);
	}

	@Override
	public int annUnExposure(int annSeq) {
		return sqlSession.update(namespace+"annUnExposure", annSeq);
	}

	@Override
	public AnnVO selAnnBySeq(int annSeq) {
		return sqlSession.selectOne(namespace+"selAnnBySeq", annSeq);
	}

	@Override
	public int anntopchk(String annType) {
		return sqlSession.selectOne(namespace+"anntopchk", annType);
	}

	@Override
	public AnnVO anntopinfo(String annType) {
		return sqlSession.selectOne(namespace+"anntopinfo",annType);
	}

	@Override
	public int topSetting(int annSeq) {
		return sqlSession.update(namespace+"topSetting", annSeq);
	}

	@Override
	public int unTopSetting(int annSeq) {
		return sqlSession.update(namespace+"unTopSetting", annSeq);
	}


}
