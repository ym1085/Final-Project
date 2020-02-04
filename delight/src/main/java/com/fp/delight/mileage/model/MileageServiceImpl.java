package com.fp.delight.mileage.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MileageServiceImpl implements MileageService{
	
	@Autowired
	private MileageDAO mileageDao;

	@Override
	public List<Map<String, Object>> earnMileage(MileageVO mileageVo) {
		return mileageDao.earnMileage(mileageVo);
	}

	
}
