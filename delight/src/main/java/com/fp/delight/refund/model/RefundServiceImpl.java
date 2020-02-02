package com.fp.delight.refund.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundServiceImpl implements RefundService{
	
	@Autowired
	private RefundDAO refundDao;

	@Override
	public int insertRefund(RefundVO refundVo) {
		return refundDao.insertRefund(refundVo);
	}
	
}
