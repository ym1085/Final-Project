package com.fp.delight.customerService.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fp.delight.ann.model.AnnVO;

@Service
public class CustomerServiceServiceImpl implements CustomerServiceService{

	@Autowired
	private CustomerServiceDAO customerServiceDao;
	
	@Override
	public List<AnnVO> selectAnnTop() {
		return customerServiceDao.selectAnnTop();
	}

	@Override
	public int normalExposureTotal(AnnVO annVo) {
		return customerServiceDao.normalExposureTotal(annVo);
	}

	@Override
	public int eventExposureTotal(AnnVO annVo) {
		return customerServiceDao.eventExposureTotal(annVo);
	}

	@Override
	public List<AnnVO> eventExposureSearch(AnnVO annVo) {
		return customerServiceDao.eventExposureSearch(annVo);
	}

	@Override
	public List<AnnVO> normalExposureSearch(AnnVO annVo) {
		return customerServiceDao.normalExposureSearch(annVo);
	}

}
