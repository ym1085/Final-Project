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
	public List<Map<String, Object>> myMileage(MileageVO mileageVo) {
		return mileageDao.myMileage(mileageVo);
	}

	@Override
	public List<Map<String, Object>> selectAllMileage(MileageVO mileageVo) {
		return mileageDao.selectAllMileage(mileageVo);
	}

	@Override
	public int selectTotalRecordforMileage(MileageVO mileageVo) {
		return mileageDao.selectTotalRecordforMileage(mileageVo);
	}

	
	
}
