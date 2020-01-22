package com.fp.delight.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements TicketService{
	
	@Autowired
	private TicketDAO perfomDao;

	@Override
	public List<TicketVO> selectreserList(String perfomid) {
		return perfomDao.selectreserList(perfomid);
	}


	
}
