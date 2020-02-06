package com.fp.delight.review.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.reservation.model.ReservationVO;
import com.fp.delight.review.controller.ReviewController;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public List<Map<String, Object>> selectReviewList(DateSearchVO dateSearchVo) {
		return reviewDao.selectReviewList(dateSearchVo);
	}

	@Override
	public int TotalRecord(DateSearchVO dateSearchVo) {
		return reviewDao.TotalRecord(dateSearchVo);
	}

	@Override
	public ReservationVO reservationDetail(int reservation_seq) {
		return reviewDao.reservationDetail(reservation_seq);
	}

	@Override
	@Transactional
	public int insertReview(ReviewVO reviewVo) {
		int cnt=0;
		try {
			cnt=reviewDao.insertReview(reviewVo);
			cnt=reviewDao.updateUserMg(reviewVo);
			MileageVO mv=new MileageVO();
			mv.setMileagePoint(reviewVo.getReviewMileage());
			mv.setUserid(reviewVo.getUserid());
			if(Integer.parseInt(reviewVo.getReviewType())==ReviewService.NM_REVIEW_TYPE) {
				mv.setMileaebecSeq(ReviewService.NM_REVIEW_SEQ);
			}else if(Integer.parseInt(reviewVo.getReviewType())==ReviewService.PH_REVIEW_TYPE) {
				mv.setMileaebecSeq(ReviewService.PH_REVIEW_SEQ);
			}
			cnt=reviewDao.insertMileeage(mv);
 		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectReviewNew5(String userid) {
		return reviewDao.selectReviewNew5(userid);
	}

	@Override
	public List<Map<String, Object>> ReviewWriteList(DateSearchVO dateSearchVo) {
		return reviewDao.ReviewWriteList(dateSearchVo);
	}

	@Override
	public int ReviewWriteTotalRecord(DateSearchVO dateSearchVo) {
		return reviewDao.ReviewWriteTotalRecord(dateSearchVo);
	}

	@Override
	public Map<String, Object> reviewDetail(ReviewVO reviewVo) {
		return reviewDao.reviewDetail(reviewVo);
	}

	
}
