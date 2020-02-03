package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import com.fp.delight.promotion.model.PromotionVO;

public class PromotionListVO {
	private List<PromotionVO> promotionList;

	public List<PromotionVO> getPromotionList() {
		return promotionList;
	}

	public void setPromotionList(List<PromotionVO> promotionList) {
		this.promotionList = promotionList;
	}

	@Override
	public String toString() {
		return "PromotionListVO [promotionList=" + promotionList + "]";
	}
	
	
}
