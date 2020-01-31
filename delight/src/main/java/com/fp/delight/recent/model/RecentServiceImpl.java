package com.fp.delight.recent.model;

import java.util.List;

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

	@Override
	public List<RecentVO> selectRecentNew5List(String userid) {
		return recentDao.selectRecentNew5List(userid);
	}

	@Override
	public List<RecentVO> selectRecentList(RecentVO recentVo) {
		return recentDao.selectRecentList(recentVo);
	}

	@Override
	public int selectTotalRecord(String iporid) {
		return recentDao.selectTotalRecord(iporid);
	}
	
	
	
}
