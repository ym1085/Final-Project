package com.fp.delight.recent.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecentDAOMybatis implements RecentDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.recent.";

	@Override
	public int insertRecent(RecentVO recentVo) {
		return sqlSession.insert(namespace+"insertRecent",recentVo);
	}

	@Override
	public List<RecentVO> selectRecentNew5List(String userid) {
		return sqlSession.selectList(namespace+"selectRecentNew5List",userid);
	}

	@Override
	public List<RecentVO> selectRecentList(RecentVO recentVo) {
		return sqlSession.selectList(namespace+"selectRecentList",recentVo);
	}

	@Override
	public int selectTotalRecord(String iporid) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",iporid);
	}
	
}
