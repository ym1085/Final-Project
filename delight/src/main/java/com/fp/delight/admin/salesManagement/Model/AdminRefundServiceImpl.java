package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.common.SearchVO;

@Service
public class AdminRefundServiceImpl implements AdminRefundService{
	
	@Autowired
	private AdminRefundDAO adminRefundDao;

	@Override
	public List<Map<String, Object>> refundList(SearchVO searchVo) {
		return adminRefundDao.refundList(searchVo);
	}

	@Override
	public int refundListTotal(SearchVO searchVo) {
		return adminRefundDao.refundListTotal(searchVo);
	}
}
