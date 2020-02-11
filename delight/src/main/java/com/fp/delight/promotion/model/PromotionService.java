package com.fp.delight.promotion.model;

public interface PromotionService {
	
	PromotionVO myPromotionList(String id);
	int insertPromotion(PromotionVO promotionVo);
	PromotionVO selectByPromoteSeq(int promoteSeq);
	int updatePromotion(PromotionVO promotionVo);
	int deletePromotion(int promoteSeq);
}
