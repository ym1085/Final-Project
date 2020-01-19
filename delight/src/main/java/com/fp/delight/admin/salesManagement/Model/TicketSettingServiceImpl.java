package com.fp.delight.admin.salesManagement.Model;

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

}
