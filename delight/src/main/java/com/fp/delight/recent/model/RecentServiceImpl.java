package com.fp.delight.recent.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecentServiceImpl implements RecentService{
	
	@Autowired
	private RecentDAO recentDao;

	@Override
	public int insertRecent(RecentVO recentVo) {
		return recentDao.insertRecent(recentVo);
	}
	
	
	
}
