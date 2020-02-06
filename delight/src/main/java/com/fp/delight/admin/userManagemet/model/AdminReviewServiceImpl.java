package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fp.delight.admin.salesManagement.Model.AdminRefundDAO;
import com.fp.delight.common.SearchVO;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService{

	@Autowired
	private AdminReviewDAO adminReviewDao;
	
	@Autowired
	private AdminRefundDAO adminRefundDao;

	@Override
	public List<Map<String, Object>> adminreviewList(SearchVO searchVo) {
		return adminReviewDao.adminreviewList(searchVo);
	}

	@Override
	public int reviewListTotal(SearchVO searchVo) {
		return adminReviewDao.reviewListTotal(searchVo);
	}

	@Override
	public Map<String, Object> adminReviewDetail(int reviewseq) {
		return adminReviewDao.adminReviewDetail(reviewseq);
	}

	@Override
	@Transactional
	public int reviewDel(int reviewseq) {
		int cnt=0;
		Map<String, Object> map=adminReviewDao.adminReviewDetail(reviewseq);
		String userid=(String) map.get("USERID");
		int reviewtype=Integer.parseInt((String) map.get("REVIEW_TYPE"));
		int reviewmileage=(Integer) map.get("REVIEW_MILEAGE");
		
		try {
			//유저 마일리지 차감
			MemberVO memberVo=new MemberVO();
			memberVo.setUserid(userid);
			memberVo.setMileagePoint(reviewmileage*(-1));
			cnt=adminRefundDao.usermilReturn(memberVo);
			//마일리지 변화 인서트
			MileageVO mileageVo=new MileageVO();
			mileageVo.setMileagePoint(reviewmileage*(-1));
			if(reviewtype==1) {
				mileageVo.setMileaebecSeq(2);
			}else if(reviewtype==2) {
				mileageVo.setMileaebecSeq(3);
			}
			mileageVo.setUserid(userid);
			System.out.println("mileageVo="+mileageVo);
			cnt=adminRefundDao.adminMileage(mileageVo);
			//글 삭제
			cnt=adminReviewDao.adminReviewDel(reviewseq);
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		
		return cnt;
	}

	@Override
	@Transactional
	public int reviewMultiDel(List<Integer> reviewList) {
		int cnt=0;
		
		try {
			for(int seq:reviewList) {
				if(seq>0) {
					Map<String, Object> map=adminReviewDao.adminReviewDetail(seq);
					String userid=(String) map.get("USERID");
					int reviewtype=Integer.parseInt((String) map.get("REVIEW_TYPE"));
					int reviewmileage=(Integer) map.get("REVIEW_MILEAGE");
					//유저 마일리지 차감
					MemberVO memberVo=new MemberVO();
					memberVo.setUserid(userid);
					memberVo.setMileagePoint(reviewmileage*(-1));
					cnt=adminRefundDao.usermilReturn(memberVo);
					//마일리지 변화 인서트
					MileageVO mileageVo=new MileageVO();
					mileageVo.setMileagePoint(reviewmileage*(-1));
					if(reviewtype==1) {
						mileageVo.setMileaebecSeq(2);
					}else if(reviewtype==2) {
						mileageVo.setMileaebecSeq(3);
					}
					mileageVo.setUserid(userid);
					cnt=adminRefundDao.adminMileage(mileageVo);
					//글 삭제
					cnt=adminReviewDao.adminReviewDel(seq);
				}
			}
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
}
