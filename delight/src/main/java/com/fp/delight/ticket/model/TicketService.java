package com.fp.delight.ticket.model;

import java.util.List;
import java.util.Map;

public interface TicketService {
	List<TicketVO> selectreserList(String perfomid);
	TicketVO selectCategory(int ticketSeq);
	int updateTicketForPayment(TicketVO ticketVo);
	Map<String, Object> rateNtotal(String perfomid);
}