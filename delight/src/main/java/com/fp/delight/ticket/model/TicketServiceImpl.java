package com.fp.delight.ticket.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements TicketService{
	
	@Autowired
	private TicketDAO ticketDao;

	@Override
	public List<TicketVO> selectreserList(String perfomid) {
		return ticketDao.selectreserList(perfomid);
	}

	@Override
	public TicketVO selectCategory(int ticketSeq) {
		return ticketDao.selectCategory(ticketSeq);
	}


	
}
