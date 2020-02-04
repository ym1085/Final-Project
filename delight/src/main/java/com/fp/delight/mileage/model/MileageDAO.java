package com.fp.delight.mileage.model;

import java.util.List;
import java.util.Map;

public interface MileageDAO {
	List<Map<String, Object>> earnMileage(MileageVO mileageVo);
	
}
