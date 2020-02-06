package com.fp.delight.ticketSearch.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fp.delight.ticket.model.TicketVO;

@Repository
public class TicketSearchDAOMybatis implements TicketSearchDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.ticketSearch.";
	
	@Override
	public List<TicketVO> selectTicket(TicketVO ticketVo) {
		return sqlSession.selectList(namespace+"selectReservation",ticketVo);
	}
	
	@Override
	public int selectTotalRecord(TicketVO ticketVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",ticketVo);
	}

}
