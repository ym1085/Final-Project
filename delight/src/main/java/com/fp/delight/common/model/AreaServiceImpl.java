package com.fp.delight.common.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.excel.model.AreaGugunVO;
import com.fp.delight.excel.model.AreaSidoVO;

@Service
public class AreaServiceImpl implements AreaService{

	@Autowired
	private AreaDAO areaDao;
	
	@Override
	public List<AreaSidoVO> selectSido() {
		return areaDao.selectSido();
	}

	@Override
	public List<AreaGugunVO> gugunSelectBySido(String sido) {
		return areaDao.gugunSelectBySido(sido);
	}

}
