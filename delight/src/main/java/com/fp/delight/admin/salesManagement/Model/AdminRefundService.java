package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.SearchVO;
import com.fp.delight.reservation.model.ReservationVO;

public interface AdminRefundService {
	List<Map<String, Object>> refundList(SearchVO searchVo);
	int refundListTotal(SearchVO searchVo);
	int refundApproval(String variables);
	int multiRefund(List<String> seqList);
	List<Map<String, Object>> noneRefundList(SearchVO searchVo);
	int noneRefundListTotal(SearchVO searchVo);
}
