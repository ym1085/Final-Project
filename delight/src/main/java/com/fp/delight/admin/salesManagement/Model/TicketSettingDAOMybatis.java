package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketSettingDAOMybatis implements TicketSettingDAO{
	private String namespace="com.mybatis.mapper.perfomSetting.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertticket(TicketSettingVO ticketSettingVo) {
		return sqlSession.insert(namespace+"insertticket", ticketSettingVo);
	}

	@Override
	public List<Map<String, Object>> selticket() {
		return sqlSession.selectList(namespace+"selticket");
	}
	
	
}
