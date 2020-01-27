package com.fp.delight.payment.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
