package com.fp.delight.payment.model;

public interface PaymentDAO {
	int insertReservation(ReservationVO reservationVo);
	int selectReservationForPayment(ReservationVO reservationVo);
	int insertPayment(int reservationSeq);
	
}
