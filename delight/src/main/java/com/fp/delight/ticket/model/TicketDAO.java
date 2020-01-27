package com.fp.delight.ticket.model;

import java.util.List;

public interface TicketDAO {
	List<TicketVO> selectreserList(String perfomid);
	TicketVO selectCategory(int ticketSeq);
	int updateTicketForPayment(TicketVO ticketVo);
}
