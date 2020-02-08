package com.fp.delight.promotion.model;

public interface PromotionDAO {
	PromotionVO myPromotionList(String id);
	
	int insertPromotion(PromotionVO promotionVo);
}
