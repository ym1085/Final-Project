package com.fp.delight.inquery.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InqueryDAOMybatis implements InqueryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.inquery.";

	@Override
	public int Inquerywrite(InqueryVO inqueryVo) {
		return sqlSession.insert(namespace+"Inquerywrite",inqueryVo);
	}

	@Override
	public List<InqueryVO> selectNew3(String userid) {
		return sqlSession.selectList(namespace+"selectNew3",userid);
	}

	@Override
	public Map<String, Object> selectInqDetail(InqueryVO inqueryVo) {
		return sqlSession.selectOne(namespace+"selectInqDetail",inqueryVo);
	}

	@Override
	public List<InqueryVO> selectInqueryList(InqueryVO inqueryVo) {
		return sqlSession.selectList(namespace+"selectInqueryList",inqueryVo);
	}

	@Override
	public int selectTotalRecord(String userid) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",userid);
	}
	
}
