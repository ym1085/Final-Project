package com.fp.delight.mileage.model;

import java.util.List;
import java.util.Map;

public interface MileageDAO {
	List<Map<String, Object>> myMileage(MileageVO mileageVo);
	List<Map<String, Object>> selectAllMileage(MileageVO mileageVo);
	int selectTotalRecordforMileage(MileageVO mileageVo);
}
