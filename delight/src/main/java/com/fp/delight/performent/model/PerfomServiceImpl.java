package com.fp.delight.performent.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerfomServiceImpl implements PerfomService{
	
	@Autowired
	private PerfomDAO perfomDao;

	@Override
	public List<Map<String, Object>> selectreserList(String perfomid) {
		return perfomDao.selectreserList(perfomid);
	}
	
}
