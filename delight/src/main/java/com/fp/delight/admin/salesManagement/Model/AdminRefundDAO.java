package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.SearchVO;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.payment.model.PaymentVO;

public interface AdminRefundDAO {
	List<Map<String, Object>> refundList(SearchVO searchVo);
	int refundListTotal(SearchVO searchVo);
	int refComOk(int refundSeq);
	int paymentC(int paySeq);
	int resSeqBybooking(int resSeq);
	int selledDown(TicketSettingVO ticketSettingVo);
	int usermilReturn(MemberVO memberVo);
	int adminMileage(MileageVO mileageVo);
	PaymentVO usedmileageBySeq(int paySeq);
	
}
