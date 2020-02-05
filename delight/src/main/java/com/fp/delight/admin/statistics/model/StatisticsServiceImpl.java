package com.fp.delight.admin.statistics.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	@Autowired
	private StatisticsDAO statisticsDao;

	@Override
	public List<Map<String, Object>> gendercount() {
		return statisticsDao.gendercount();
	}

	@Override
	public List<ChartVO> agegroup() {
		return statisticsDao.agegroup();
	}
	
	
}
