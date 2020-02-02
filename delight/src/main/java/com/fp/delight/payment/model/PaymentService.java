package com.fp.delight.payment.model;

import com.fp.delight.reservation.model.ReservationVO;

public interface PaymentService {
	int insertReservation(ReservationVO reservationVo); 
	int selectReservationForPayment(ReservationVO reservationVo);
	int insertPayment(int reservationSeq);
	int totalRefundforMemberGrade(String userGrade);
	int totalPayforMemberGrade(String userGrade); 
	String selectReservation(ReservationVO reservationVo); 
	int selectRefundCount();
}
