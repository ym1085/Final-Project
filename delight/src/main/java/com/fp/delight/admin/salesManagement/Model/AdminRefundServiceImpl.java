package com.fp.delight.admin.salesManagement.Model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fp.delight.admin.userManagemet.model.GradeManagerDAO;
import com.fp.delight.admin.userManagemet.model.MemberManagerDAO;
import com.fp.delight.common.SearchVO;
import com.fp.delight.member.model.MemberDAO;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.mypage.model.GradeVO;
import com.fp.delight.payment.model.PaymentVO;

@Service
public class AdminRefundServiceImpl implements AdminRefundService{
	
	@Autowired
	private AdminRefundDAO adminRefundDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MemberManagerDAO memberManagerDao;
	
	@Autowired
	private GradeManagerDAO gradeManagerDao;

	@Override
	public List<Map<String, Object>> refundList(SearchVO searchVo) {
		return adminRefundDao.refundList(searchVo);
	}

	@Override
	public int refundListTotal(SearchVO searchVo) {
		return adminRefundDao.refundListTotal(searchVo);
	}
	
	@Override
	@Transactional
	public int refundApproval(String variables) {
		String[] variable=variables.split("@");
		String userid=variable[0];
		int refundSeq=Integer.parseInt(variable[1]);
		int paySeq=Integer.parseInt(variable[2]);
		int resSeq=Integer.parseInt(variable[3]);
		int ticketSeq=Integer.parseInt(variable[4]);
		
		int cnt=0;
		try {
			//환불상황 Y로 바꾸기
			cnt=adminRefundDao.refComOk(refundSeq);
			
			//결제 테이블 결제 상태 C로 바꾸기
			cnt=adminRefundDao.paymentC(paySeq);
			
			//판매된 표 수량 감소
			int booking=adminRefundDao.resSeqBybooking(resSeq);
			TicketSettingVO ticketSettingVo=new TicketSettingVO();
			ticketSettingVo.setSelled(booking);
			ticketSettingVo.setTicketSeq(ticketSeq);
			cnt=adminRefundDao.selledDown(ticketSettingVo);
			
			//할인으로 쓴 마일리지
			PaymentVO paymentVo=adminRefundDao.usedmileageBySeq(paySeq);
			int usedmileageBySeq=paymentVo.getUsedmileage(); //사유 환불 증가
			//결제한 금액
			int payPrice=paymentVo.getPay_price();
			int savmileage=(int) (payPrice*0.005); //사유 환불 차감
			//총 변화할 마일리지
			int totalcgmil=usedmileageBySeq-savmileage;
			MemberVO memberVo=new MemberVO();
			memberVo.setUserid(userid);
			memberVo.setMileagePoint(totalcgmil);
			cnt=adminRefundDao.usermilReturn(memberVo);
			
			//환불 증가
			MileageVO mileageVo=new MileageVO();
			mileageVo.setUserid(userid);
			mileageVo.setMileagePoint(usedmileageBySeq);
			mileageVo.setMileaebecSeq(7);
			cnt=adminRefundDao.adminMileage(mileageVo);
			//환불 감소
			mileageVo.setMileagePoint(savmileage*(-1));
			mileageVo.setMileaebecSeq(6);
			cnt=adminRefundDao.adminMileage(mileageVo);
			
			//등급 관리
			int totalpayment=memberManagerDao.totalpayment(userid);
			int totalrefund=memberManagerDao.totalrefund(userid);
			int criteria=totalpayment-totalrefund;
			
			List<GradeVO> list=gradeManagerDao.gradeListforPayment();
			
			for(int i=0;i<list.size();i++) {
				GradeVO gradeVo=list.get(i);
				if(criteria>=gradeVo.getGradeStandard()) {
					memberVo.setGradeSeq(gradeVo.getGradeSeq());
					memberVo.setGradeName(gradeVo.getGradeName());
				}
			}
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int multiRefund(List<String> seqList) {
		int cnt=0;
		try {
			for(int i=0;i<seqList.size();i++) {
				String variables=seqList.get(i);
				
				String[] variable=variables.split("@");
				String userid=variable[0];
				int refundSeq=Integer.parseInt(variable[1]);
				int paySeq=Integer.parseInt(variable[2]);
				int resSeq=Integer.parseInt(variable[3]);
				int ticketSeq=Integer.parseInt(variable[4]);
				
				//환불상황 Y로 바꾸기
				cnt=adminRefundDao.refComOk(refundSeq);
				
				//결제 테이블 결제 상태 C로 바꾸기
				cnt=adminRefundDao.paymentC(paySeq);
				
				//판매된 표 수량 감소
				int booking=adminRefundDao.resSeqBybooking(resSeq);
				TicketSettingVO ticketSettingVo=new TicketSettingVO();
				ticketSettingVo.setSelled(booking);
				ticketSettingVo.setTicketSeq(ticketSeq);
				cnt=adminRefundDao.selledDown(ticketSettingVo);
				
				//할인으로 쓴 마일리지
				PaymentVO paymentVo=adminRefundDao.usedmileageBySeq(paySeq);
				int usedmileageBySeq=paymentVo.getUsedmileage(); //사유 환불 증가
				//결제한 금액
				int payPrice=paymentVo.getPay_price();
				int savmileage=(int) (payPrice*0.005); //사유 환불 차감
				//총 변화할 마일리지
				int totalcgmil=usedmileageBySeq-savmileage;
				MemberVO memberVo=new MemberVO();
				memberVo.setUserid(userid);
				memberVo.setMileagePoint(totalcgmil);
				cnt=adminRefundDao.usermilReturn(memberVo);
				
				//환불 증가
				MileageVO mileageVo=new MileageVO();
				mileageVo.setUserid(userid);
				mileageVo.setMileagePoint(usedmileageBySeq);
				mileageVo.setMileaebecSeq(7);
				cnt=adminRefundDao.adminMileage(mileageVo);
				//환불 감소
				mileageVo.setMileagePoint(savmileage*(-1));
				mileageVo.setMileaebecSeq(6);
				cnt=adminRefundDao.adminMileage(mileageVo);
				
				//등급 관리
				int totalpayment=memberManagerDao.totalpayment(userid);
				int totalrefund=memberManagerDao.totalrefund(userid);
				int criteria=totalpayment-totalrefund;
				
				List<GradeVO> list=gradeManagerDao.gradeListforPayment();
				
				for(int j=0;j<list.size();j++) {
					GradeVO gradeVo=list.get(j);
					if(criteria>=gradeVo.getGradeStandard()) {
						memberVo.setGradeSeq(gradeVo.getGradeSeq());
						memberVo.setGradeName(gradeVo.getGradeName());
					}
				}
				
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		
		return cnt;
	}
}
