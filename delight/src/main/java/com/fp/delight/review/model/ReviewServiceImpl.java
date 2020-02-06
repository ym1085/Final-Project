package com.fp.delight.review.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.reservation.model.ReservationVO;

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
	
}
