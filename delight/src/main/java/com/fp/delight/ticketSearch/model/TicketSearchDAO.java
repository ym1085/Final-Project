package com.fp.delight.ticketSearch.model;

import java.util.List;

import com.fp.delight.ticket.model.TicketVO;


public interface TicketSearchDAO {
	List<TicketVO> selectTicket(TicketVO ticketVo);
	int selectTotalRecord(TicketVO ticketVo);
}
