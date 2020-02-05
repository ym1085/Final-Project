package com.fp.delight.admin.statistics.model;

import java.util.List;
import java.util.Map;

public interface StatisticsDAO {
	List<Map<String, Object>> gendercount();
	List<ChartVO> agegroup();
	List<ChartVO> joincount();
	List<ChartVO> daysales();
	List<ChartVO> dayselled();
	List<ChartVO> dayvisitor();
}
