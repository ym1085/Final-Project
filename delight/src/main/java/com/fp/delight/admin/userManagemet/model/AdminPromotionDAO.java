package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import com.fp.delight.promotion.model.PromotionVO;

public interface AdminPromotionDAO {
	List<PromotionVO> promotionList(PromotionVO promotionVo);
	int promotiontotal(PromotionVO promotionVo);
	PromotionVO promotionDetail(int proseq);
	int promoDel(int proseq);
	int giveComp(int proseq);
}
