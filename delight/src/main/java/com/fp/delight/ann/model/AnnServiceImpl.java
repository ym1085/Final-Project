package com.fp.delight.ann.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnnServiceImpl implements AnnService{

	@Autowired
	private AnnDAO annDao;
	
	@Override
	public int annInsert(AnnVO annVo) {
		return annDao.annInsert(annVo);
	}

	@Override
	public List<AnnVO> annList(AnnVO annVo) {
		return annDao.annList(annVo);
	}

	@Override
	public int normalTotal(AnnVO annVo) {
		return annDao.normalTotal(annVo);
	}

	@Override
	public List<AnnVO> eventSearch(AnnVO annVo) {
		return annDao.eventSearch(annVo);
	}

	@Override
	public int eventTotal(AnnVO annVo) {
		return annDao.eventTotal(annVo);
	}

}
