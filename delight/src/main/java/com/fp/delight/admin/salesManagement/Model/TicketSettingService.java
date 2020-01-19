package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

public interface TicketSettingService {
	int insertticket(TicketSettingVO ticketSettingVo);
	List<Map<String, Object>> selticket();
	
}
