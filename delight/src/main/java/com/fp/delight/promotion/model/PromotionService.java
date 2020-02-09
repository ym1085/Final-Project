package com.fp.delight.promotion.model;


public interface PromotionService {

	public static final int MileageGive=1; //마일리지 지급 유무
	
	PromotionVO myPromotionList(String id);
	int insertPromotion(PromotionVO promotionVo);
	PromotionVO selectByPromoteSeq(int promoteSeq);
	int updatePromotion(PromotionVO promotionVo);
	int deletePromotion(int promoteSeq);
}
