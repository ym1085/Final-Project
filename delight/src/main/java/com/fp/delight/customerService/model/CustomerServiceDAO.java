package com.fp.delight.customerService.model;

import java.util.List;

import com.fp.delight.ann.model.AnnVO;

public interface CustomerServiceDAO {
	List<AnnVO> selectAnnTop();
	int normalExposureTotal(AnnVO annVo);
	int eventExposureTotal(AnnVO annVo);
	List<AnnVO> normalExposureSearch(AnnVO annVo);
	List<AnnVO> eventExposureSearch(AnnVO annVo);
	
}
