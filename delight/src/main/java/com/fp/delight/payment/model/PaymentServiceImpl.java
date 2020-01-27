package com.fp.delight.payment.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int insertPayment(int reservationSeq) {
		return paymentDao.insertPayment(reservationSeq);
	}

	
}
