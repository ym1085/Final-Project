package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.delight.common.SearchVO;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.payment.model.PaymentVO;
import com.fp.delight.reservation.model.ReservationVO;

@Repository
public class AdminRefundDAOMybatis implements AdminRefundDAO{
	private String namespace="com.mybatis.mapper.delight.adminRefund.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> refundList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"refundList", searchVo);
	}

	@Override
	public int refundListTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"refundListTotal", searchVo);
	}

	@Override
	public int refComOk(int refundSeq) {
		return sqlSession.update(namespace+"refComOk", refundSeq);
	}

	@Override
	public int paymentC(int paySeq) {
		return sqlSession.update(namespace+"paymentC", paySeq);
	}

	@Override
	public int resSeqBybooking(int resSeq) {
		return sqlSession.selectOne(namespace+"resSeqBybooking", resSeq);
	}

	@Override
	public int selledDown(TicketSettingVO ticketSettingVo) {
		return sqlSession.update(namespace+"selledDown", ticketSettingVo);
	}

	@Override
	public int usermilReturn(MemberVO memberVo) {
		return sqlSession.update(namespace+"usermilReturn", memberVo);
	}

	@Override
	public int adminMileage(MileageVO mileageVo) {
		return sqlSession.insert(namespace+"adminMileage", mileageVo);
	}

	@Override
	public PaymentVO usedmileageBySeq(int paySeq) {
		return sqlSession.selectOne(namespace+"usedmileageBySeq", paySeq);
	}

	@Override
	public ReservationVO resbySeq(int resSeq) {
		return sqlSession.selectOne(namespace+"resbySeq", resSeq);
	}

	@Override
	public List<Map<String, Object>> noneRefundList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"noneRefundList", searchVo);
	}

	@Override
	public int noneRefundListTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"noneRefundListTotal", searchVo);
	}
	
	
}
