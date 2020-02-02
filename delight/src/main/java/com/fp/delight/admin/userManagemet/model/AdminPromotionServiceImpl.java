package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.promotion.model.PromotionVO;

@Service
public class AdminPromotionServiceImpl implements AdminPromotionService{
	@Autowired
	private AdminPromotionDAO adminPromotionDao;

	@Override
	public List<PromotionVO> promotionList(PromotionVO promotionVo) {
		return adminPromotionDao.promotionList(promotionVo);
	}

	@Override
	public int promotiontotal(PromotionVO promotionVo) {
		return adminPromotionDao.promotiontotal(promotionVo);
	}
}
