package com.fp.delight.recent.model;

import java.util.List;
import java.util.Map;

public interface RecentDAO {
	int insertRecent(RecentVO recentVo);
	List<RecentVO> selectRecentNew5List(String userid);
	List<RecentVO> selectRecentList(RecentVO recentVo);
	int selectTotalRecord(String iporid);
	int selectChkRecent(RecentVO recentVo);
	List<RecentVO> selectRecentPerformance(String iporid);
}
