package com.fp.delight.ticketSearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.ticket.model.TicketVO;

@Service
public class TicketSearchServiceImpl implements TicketSearchService{
	
	@Autowired
	private TicketSearchDAO ticketSearchDao;
	
	@Override
	public List<TicketVO> selectTicket(TicketVO ticketVo) {
		return ticketSearchDao.selectTicket(ticketVo);
	}
	
	@Override
	public int selectTotalRecord(TicketVO ticketVo) {
		return ticketSearchDao.selectTotalRecord(ticketVo);
	}
}
