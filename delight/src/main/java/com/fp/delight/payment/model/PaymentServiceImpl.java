package com.fp.delight.payment.model;

import java.util.List;
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
	public int insertPayment(int reservationSeq) {
		return paymentDao.insertPayment(reservationSeq);
	}
}
