package com.fp.delight.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.reservation.model.ReservationVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	private String namespace="com.mybatis.mapper.payment.";
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int insertReservation(ReservationVO reservationVo) {
		return sqlsession.insert(namespace+"insertReservationForPayment", reservationVo);
	}

	@Override
	public int selectReservationForPayment(ReservationVO reservationVo) {
		return sqlsession.selectOne(namespace+"selectReservationForPayment", reservationVo);
	}
	
	@Override
	public int insertPayment(int reservationSeq) {
		return sqlsession.insert(namespace+"insertPayment", reservationSeq);
	}
}
