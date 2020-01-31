package com.fp.delight.payment.model;

import java.util.List;
import java.util.Map;

import com.fp.delight.reservation.model.ReservationVO;

public interface PaymentService {
	int insertReservation(ReservationVO reservationVo); 
	int selectReservationForPayment(ReservationVO reservationVo);
	int insertPayment(int reservationSeq);
}
