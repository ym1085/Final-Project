package com.fp.delight.admin.userManagemet.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.SearchVO;

@Repository
public class AdminReviewDAOMybatis implements AdminReviewDAO{
	private String namespace="com.mybatis.mapper.admin.review.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> adminreviewList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"adminreviewList", searchVo);
	}

	@Override
	public int reviewListTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"reviewListTotal", searchVo);
	}

	@Override
	public Map<String, Object> adminReviewDetail(int reviewseq) {
		return sqlSession.selectOne(namespace+"adminReviewDetail", reviewseq);
	}

	@Override
	public int adminReviewDel(int reviewseq) {
		return sqlSession.delete(namespace+"adminReviewDel", reviewseq);
	}
	
	
}
