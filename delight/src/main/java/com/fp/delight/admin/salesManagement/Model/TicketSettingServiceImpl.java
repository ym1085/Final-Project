package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketSettingServiceImpl implements TicketSettingService{

	@Autowired
	private TicketSettingDAO ticketSettingDao;
	
	@Override
	public int insertticket(TicketSettingVO ticketSettingVo) {
		return ticketSettingDao.insertticket(ticketSettingVo);
	}

	@Override
	public List<Map<String, Object>> selticket() {
		return ticketSettingDao.selticket();
	}

}
