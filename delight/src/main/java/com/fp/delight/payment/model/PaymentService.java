package com.fp.delight.payment.model;

import java.util.Map;

import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.reservation.model.ReservationVO;

public interface PaymentService {
	int insertReservation(ReservationVO reservationVo); 
	int selectReservationForPayment(ReservationVO reservationVo);
	int insertPayment(Map<String, Object> map);
	int totalRefundforMemberGrade(String userGrade);
	int totalPayforMemberGrade(String userGrade); 
	String selectReservation(ReservationVO reservationVo); 
	int insertMileage(MileageVO mileageVo); 
}
