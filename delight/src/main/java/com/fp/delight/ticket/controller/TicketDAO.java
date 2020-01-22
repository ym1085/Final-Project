package com.fp.delight.ticket.controller;

import java.util.List;

public interface TicketDAO {
	List<TicketVO> selectreserList(String perfomid);
}
