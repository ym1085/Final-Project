package com.fp.delight.ticket.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAOMybatis implements TicketDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.ticket.";

	@Override
	public List<TicketVO> selectreserList(String perfomid) {
		return sqlSession.selectList(namespace+"selectreserList",perfomid);
	}


}
