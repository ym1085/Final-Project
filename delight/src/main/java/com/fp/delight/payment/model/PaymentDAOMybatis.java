package com.fp.delight.payment.model;

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
	public int insertPayment(Map<String, Object> map) {
		return sqlsession.insert(namespace+"insertPayment", map);
	}

	@Override
	public int totalRefundforMemberGrade(String userGrade) {
		int cnt=0;
		if(sqlsession.selectOne(namespace+"totalRefundforMemberGrade", userGrade)!=null) {
			cnt=sqlsession.selectOne(namespace+"totalRefundforMemberGrade", userGrade);
		}
		return cnt;
	}

	@Override
	public int totalPayforMemberGrade(String userGrade) {
		int cnt=0;	
		if(sqlsession.selectOne(namespace+"totalPayforMemberGrade", userGrade)!=null) {
			cnt=sqlsession.selectOne(namespace+"totalPayforMemberGrade", userGrade);
		}
		return cnt;	
	}
	
	@Override
	public String selectReservation(ReservationVO reservationVo) {
		return sqlsession.selectOne(namespace+"selectReservation", reservationVo);
	}

	/*@Override
	public int selectRefundCount() {
		return sqlsession.selectOne(namespace+"selectRefundCount");
	}*/

	

}
