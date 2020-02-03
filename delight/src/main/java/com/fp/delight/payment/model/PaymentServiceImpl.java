package com.fp.delight.payment.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.reservation.model.ReservationVO;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO paymentDao;
	
	@Override
	public int insertReservation(ReservationVO reservationVo) {
		return paymentDao.insertReservation(reservationVo);
	}
	
	@Override
	public int selectReservationForPayment(ReservationVO reservationVo) {
		return paymentDao.selectReservationForPayment(reservationVo);
	}

	@Override
	public int insertPayment(Map<String, Object> map) {
		return paymentDao.insertPayment(map);
	}

	@Override
	public int totalRefundforMemberGrade(String userGrade) {	//환불액
		return paymentDao.totalRefundforMemberGrade(userGrade);	
	}

	@Override
	public int totalPayforMemberGrade(String userGrade) {		//총액
		return paymentDao.totalPayforMemberGrade(userGrade);
	}
	
	@Override
	public String selectReservation(ReservationVO reservationVo) {
		return paymentDao.selectReservation(reservationVo);
	}

	/*@Override
	public int selectRefundCount() {
		return paymentDao.selectRefundCount();
	}*/


}
