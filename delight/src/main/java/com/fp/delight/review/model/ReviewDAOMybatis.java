package com.fp.delight.review.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.reservation.model.ReservationVO;

@Repository
public class ReviewDAOMybatis implements ReviewDAO{
	private String namespace="com.mybatis.mapper.review.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectReviewList(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"selectReviewList",dateSearchVo);
	}

	@Override
	public int TotalRecord(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"TotalRecord",dateSearchVo);
	}

	@Override
	public ReservationVO reservationDetail(int reservation_seq) {
		return sqlSession.selectOne(namespace+"reservationDetail",reservation_seq);
	}

	@Override
	public int insertReview(ReviewVO reviewVo) {
		return sqlSession.insert(namespace+"insertReview",reviewVo);
	}

	@Override
	public int updateUserMg(ReviewVO reviewVo) {
		return sqlSession.update(namespace+"updateUserMg",reviewVo);
	}

	@Override
	public int insertMileeage(MileageVO mileageVo) {
		return sqlSession.insert(namespace+"insertMileeage",mileageVo);
	}

	@Override
	public List<Map<String, Object>> selectReviewNew5(String userid) {
		return sqlSession.selectList(namespace+"selectReviewNew5",userid);
	}

	@Override
	public List<Map<String, Object>> ReviewWriteList(DateSearchVO dateSearchVo) {
		return sqlSession.selectList(namespace+"ReviewWriteList",dateSearchVo);
	}

	@Override
	public int ReviewWriteTotalRecord(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"ReviewWriteTotalRecord",dateSearchVo);
	}


	
}
