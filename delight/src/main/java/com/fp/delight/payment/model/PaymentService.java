package com.fp.delight.payment.model;

public interface PaymentService {
	int insertReservation(ReservationVO reservationVo); 
	int selectReservationForPayment(ReservationVO reservationVo);
	int insertPayment(int reservationSeq);
}
