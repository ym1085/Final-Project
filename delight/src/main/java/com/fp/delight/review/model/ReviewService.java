package com.fp.delight.review.model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.reservation.model.ReservationVO;

public interface ReviewService {
	
	public static final int NM_REVIEW_SEQ=2; //일반후기적립금일시
	public static final int PH_REVIEW_SEQ=3; //포토후기적립금일시
	
	public static final int NM_REVIEW_TYPE=1; //일반후기타입
	public static final int PH_REVIEW_TYPE=2; //포토후기타입
	
	List<Map<String, Object>>selectReviewList(DateSearchVO dateSearchVo);
	int TotalRecord(DateSearchVO dateSearchVo);
	ReservationVO reservationDetail(int reservation_seq);
	int insertReview(ReviewVO reviewVo);
	List<Map<String, Object>> selectReviewNew5(String userid);
	List<Map<String, Object>> ReviewWriteList(DateSearchVO dateSearchVo);
	int ReviewWriteTotalRecord(DateSearchVO dateSearchVo);
}
