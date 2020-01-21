package com.fp.delight.ticket.model;

import java.util.List;

public interface TicketService {
	List<TicketVO> selectreserList(String perfomid);
	TicketVO selectCategory(int ticketSeq);
}
