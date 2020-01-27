package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.SearchVO;

@Repository
public class TicketSettingDAOMybatis implements TicketSettingDAO{
	private String namespace="com.mybatis.mapper.perfomSetting.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertticket(TicketSettingVO ticketSettingVo) {
		return sqlSession.insert(namespace+"insertticket", ticketSettingVo);
	}

	@Override
	public List<Map<String, Object>> selticket(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selticket",searchVo);
	}

	@Override
	public int settingtotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"settingtotal",searchVo);
	}

	@Override
	public TicketDiscountVO seldiscountByseq(int ticketSeq) {
		return sqlSession.selectOne(namespace+"seldiscountByseq", ticketSeq);
	}

	@Override
	public int discountInsert(TicketDiscountVO ticketDiscountVo) {
		return sqlSession.insert(namespace+"discountInsert", ticketDiscountVo);
	}

	@Override
	public int discountUpdate(TicketDiscountVO ticketDiscountVo) {
		return sqlSession.update(namespace+"discountUpdate", ticketDiscountVo);
	}

	@Override
	public int discountDel(int ticketSeq) {
		return sqlSession.delete(namespace+"discountDel",ticketSeq);
	}

	@Override
	public int settingchk(TicketSettingVO ticketSettingVo) {
		return sqlSession.selectOne(namespace+"settingchk", ticketSettingVo);
	}

	@Override
	public List<Map<String, Object>> settingList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"settingList", searchVo);
	}

	@Override
	public int settingListTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"settingListTotal", searchVo);
	}

	@Override
	public TicketSettingVO setiingBySeq(int ticketSeq) {
		return sqlSession.selectOne(namespace+"setiingBySeq", ticketSeq);
	}

	@Override
	public int settingEdit(TicketSettingVO ticketSettingVo) {
		return sqlSession.update(namespace+"settingEdit", ticketSettingVo);
	}

	@Override
	public int settingDel(int ticketSeq) {
		return sqlSession.delete(namespace+"settingDel", ticketSeq);
	}
	
	
}
