package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import com.fp.delight.common.SearchVO;

public interface AdminRefundService {
	List<Map<String, Object>> refundList(SearchVO searchVo);
	int refundListTotal(SearchVO searchVo);
}
