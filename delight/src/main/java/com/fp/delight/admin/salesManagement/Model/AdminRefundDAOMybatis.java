package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.SearchVO;

@Repository
public class AdminRefundDAOMybatis implements AdminRefundDAO{
	private String namespace="com.mybatis.mapper.delight.adminRefund.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> refundList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"refundList", searchVo);
	}

	@Override
	public int refundListTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"refundListTotal", searchVo);
	}
}
