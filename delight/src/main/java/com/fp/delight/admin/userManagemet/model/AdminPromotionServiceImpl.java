package com.fp.delight.admin.userManagemet.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fp.delight.admin.salesManagement.Model.AdminRefundDAO;
import com.fp.delight.common.Utility;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.promotion.model.PromotionVO;

@Service
public class AdminPromotionServiceImpl implements AdminPromotionService{
	@Autowired
	private AdminPromotionDAO adminPromotionDao;

	@Autowired
	private AdminRefundDAO adminRefundDao;
	
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

	@Override
	@Transactional
	public int promotepoint(PromotionVO promotionVo) {
		int cnt=0;
		try {
			//홍보게시판 지급 유무 Y업데이트
			cnt=adminPromotionDao.giveComp(promotionVo.getPromoteSeq());
			//유저 마일리지 업데이트
			MemberVO memberVo=new MemberVO();
			memberVo.setUserid(promotionVo.getUserid());
			memberVo.setMileagePoint(Utility.PROMOTE_POINT_GIVE);
			cnt=adminRefundDao.usermilReturn(memberVo);
			//마일리지변화 인서트
			MileageVO mileageVo=new MileageVO();
			mileageVo.setMileagePoint(Utility.PROMOTE_POINT_GIVE);
			mileageVo.setUserid(promotionVo.getUserid());
			mileageVo.setMileaebecSeq(4);
			cnt=adminRefundDao.adminMileage(mileageVo);
			
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		
		
		return cnt;
	}

	@Override
	@Transactional
	public int promoMultiPoint(List<PromotionVO> promotionList) {
		int cnt=0;
		try {
			for(PromotionVO vo:promotionList) {
				int proseq=vo.getPromoteSeq();
				if(proseq>0) {
					PromotionVO vo2=adminPromotionDao.promotionDetail(proseq);
					//홍보게시판 지급 유무 Y업데이트
					cnt=adminPromotionDao.giveComp(vo2.getPromoteSeq());
					//유저 마일리지 업데이트
					MemberVO memberVo=new MemberVO();
					memberVo.setUserid(vo2.getUserid());
					memberVo.setMileagePoint(Utility.PROMOTE_POINT_GIVE);
					cnt=adminRefundDao.usermilReturn(memberVo);
					//마일리지변화 인서트
					MileageVO mileageVo=new MileageVO();
					mileageVo.setMileagePoint(Utility.PROMOTE_POINT_GIVE);
					mileageVo.setUserid(vo2.getUserid());
					mileageVo.setMileaebecSeq(4);
					cnt=adminRefundDao.adminMileage(mileageVo);
				}
			}//for
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
}
