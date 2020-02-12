package com.fp.delight.ticket.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updateTicketForPayment(TicketVO ticketVo) {
		return ticketDao.updateTicketForPayment(ticketVo);
	}

	@Override
	public Map<String, Object> rateNtotal(String perfomid) {
		return ticketDao.rateNtotal(perfomid);
	}	
}
