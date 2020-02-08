package com.fp.delight.promotion.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PromotionDAOMybatis implements PromotionDAO{
	private String namespace="com.mybatis.mapper.promotion.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public PromotionVO myPromotionList(String id){
		return sqlSession.selectOne(namespace+"myPromotionList", id);
	}
	
	@Override
	public int insertPromotion(PromotionVO promotionVo) {
		return sqlSession.insert(namespace+"insertPromotion",promotionVo);
	}
}
