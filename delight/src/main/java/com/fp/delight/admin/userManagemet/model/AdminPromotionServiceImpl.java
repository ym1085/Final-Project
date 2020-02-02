package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public PromotionVO promotionDetail(int proseq) {
		return adminPromotionDao.promotionDetail(proseq);
	}

	@Override
	public int promoDel(int proseq) {
		return adminPromotionDao.promoDel(proseq);
	}

	@Override
	@Transactional
	public int promoMultiDel(List<PromotionVO> list) {
		int cnt=0;
		try {
			for(PromotionVO vo: list) {
				int proseq=vo.getPromoteSeq();
				if(proseq>0) {
					cnt=adminPromotionDao.promoDel(proseq);
				}
			}
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		
		return cnt;
	}
}
