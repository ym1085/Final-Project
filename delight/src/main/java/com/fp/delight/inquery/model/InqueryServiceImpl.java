package com.fp.delight.inquery.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<InqueryVO> selectNew3(String userid) {
		return inqueryDao.selectNew3(userid);
	}

	@Override
	public Map<String, Object> selectInqDetail(InqueryVO inqueryVo) {
		return inqueryDao.selectInqDetail(inqueryVo);
	}

	@Override
	public List<InqueryVO> selectInqueryList(InqueryVO inqueryVo) {
		return inqueryDao.selectInqueryList(inqueryVo);
	}

	@Override
	public int selectTotalRecord(String userid) {
		return inqueryDao.selectTotalRecord(userid);
	}
}
