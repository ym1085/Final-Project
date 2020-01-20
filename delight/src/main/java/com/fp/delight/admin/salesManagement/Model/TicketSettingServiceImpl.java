package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.delight.common.SearchVO;

@Service
public class TicketSettingServiceImpl implements TicketSettingService{

	@Autowired
	private TicketSettingDAO ticketSettingDao;
	
	@Override
	public int insertticket(TicketSettingVO ticketSettingVo) {
		return ticketSettingDao.insertticket(ticketSettingVo);
	}

	@Override
	public List<Map<String, Object>> selticket(SearchVO searchVo) {
		return ticketSettingDao.selticket(searchVo);
	}

	@Override
	public int settingtotal(SearchVO searchVo) {
		return ticketSettingDao.settingtotal(searchVo);
	}

	@Override
	public TicketDiscountVO seldiscountByseq(int ticketSeq) {
		return ticketSettingDao.seldiscountByseq(ticketSeq);
	}

	@Override
	public int discountInsert(TicketDiscountVO ticketDiscountVo) {
		return ticketSettingDao.discountInsert(ticketDiscountVo);
	}

	@Override
	public int discountUpdate(TicketDiscountVO ticketDiscountVo) {
		return ticketSettingDao.discountUpdate(ticketDiscountVo);
	}

}
