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
		return sqlSession.insert(namespace+"insertPromotion", promotionVo);
	}
	
	@Override
	public PromotionVO selectByPromoteSeq(int promoteSeq) {
		return sqlSession.selectOne(namespace+"selectByPromoteSeq", promoteSeq);
		
	}
	
	@Override
	public int updatePromotion(PromotionVO promotionVo) {
		return sqlSession.update(namespace+"updatePromotion", promotionVo);
	}
	
	@Override
	public int deletePromotion(int promoteSeq) {
		return sqlSession.delete(namespace+"deletePromotion", promoteSeq);
	}
}
