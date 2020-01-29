package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.SearchVO;

@Repository
public class InqAnwDAOMybatis implements InqAnwDAO{
	private String namespace="com.mybatis.mapper.usermanagement.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> adminInqSel(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"adminInqSel", searchVo);
	}

	@Override
	public int adminInqSelTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"adminInqSelTotal",searchVo);
	}

	@Override
	public Map<String, Object> inqDetail(int inqSeq) {
		return sqlSession.selectOne(namespace+"inqDetail", inqSeq);
	}

	@Override
	public int anwCompl(int inqSeq) {
		return sqlSession.update(namespace+"anwCompl", inqSeq);
	}

	@Override
	public int inqanwWrite(InqAnwVO inqAnwVo) {
		return sqlSession.insert(namespace+"inqanwWrite", inqAnwVo);
	}

	@Override
	public int anwCk(int inqSeq) {
		return sqlSession.selectOne(namespace+"anwCk", inqSeq);
	}
}
