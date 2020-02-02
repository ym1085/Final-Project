package com.fp.delight.refund.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDAOMybatis implements RefundDAO{
	private String namespace="com.mybatis.mapper.refund.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRefund(RefundVO refundVo) {
		return sqlSession.insert(namespace+"insertRefund",refundVo);
	}
}
