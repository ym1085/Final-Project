package com.fp.delight.inquery.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InqueryServiceImpl implements InqueryService{
	@Autowired
	private InqueryDAO inqueryDao;

	@Override
	public int Inquerywrite(InqueryVO inqueryVo) {
		return inqueryDao.Inquerywrite(inqueryVo);
	}
}
