package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.SearchVO;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.payment.model.PaymentVO;
import com.fp.delight.reservation.model.ReservationVO;

public interface AdminRefundDAO {
	List<Map<String, Object>> refundList(SearchVO searchVo);
	List<Map<String, Object>> noneRefundList(SearchVO searchVo);
	int refundListTotal(SearchVO searchVo);
	int noneRefundListTotal(SearchVO searchVo);
	int refComOk(int refundSeq);
	int paymentC(int paySeq);
	int resSeqBybooking(int resSeq);
	int selledDown(TicketSettingVO ticketSettingVo);
	int usermilReturn(MemberVO memberVo);
	int adminMileage(MileageVO mileageVo);
	PaymentVO usedmileageBySeq(int paySeq);
	ReservationVO resbySeq(int resSeq);
	
}
