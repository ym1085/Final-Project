package com.fp.delight.ann.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FAQDAOMybatis implements FAQDAO{
	private String namespace="com.mybatis.mapper.FAQ.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int FAQwrite(FAQVO FAQVo) {
		return sqlSession.insert(namespace+"FAQwrite", FAQVo);
	}

	@Override
	public List<FAQVO> FAQSearch(FAQVO FAQVo) {
		return sqlSession.selectList(namespace+"faqsearch", FAQVo);
	}

	@Override
	public int faqtotal(FAQVO FAQVo) {
		return sqlSession.selectOne(namespace+"faqtotal", FAQVo);
	}

	@Override
	public int faqdel(int faqSeq) {
		return sqlSession.delete(namespace+"faqdel", faqSeq);
	}

	@Override
	public FAQVO faqDetail(int faqSeq) {
		return sqlSession.selectOne(namespace+"faqDetail", faqSeq);
	}

	@Override
	public int faqEdit(FAQVO FAQVo) {
		return sqlSession.update(namespace+"faqEdit", FAQVo);
	}
	
}
