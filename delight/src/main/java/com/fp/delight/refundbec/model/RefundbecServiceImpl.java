package com.fp.delight.refundbec.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundbecServiceImpl implements RefundbecService{
	
	@Autowired
	private RefundbecDAO refundbecDao;

	@Override
	public List<RefundbecVO> selectRefundbecAll() {
		return refundbecDao.selectRefundbecAll();
	}
	
}
