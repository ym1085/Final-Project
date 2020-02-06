package com.fp.delight.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.admin.userManagemet.model.GradeManagerService;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageVO;
import com.fp.delight.mypage.model.GradeVO;
import com.fp.delight.payment.model.PaymentService;
import com.fp.delight.reservation.model.ReservationVO;
import com.fp.delight.ticket.model.TicketService;
import com.fp.delight.ticket.model.TicketVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger
		= LoggerFactory.getLogger(PaymentController.class);

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private TicketService ticketService;
			
	@Autowired
	private GradeManagerService grademanagerService;
	
	@Autowired
	private MemberService memberService;
	
	//[※] 메서드 
	//비회원 : showPaymentend.do 요청으로 들어옵니다.
	//일반회원 : showPaymentendUser.do 요청으로 들어옵니다.
	@RequestMapping("/showPaymentend.do")
	public String showPaymentend(HttpSession session, Model model, 
			@RequestParam String mt20id, @RequestParam String mt10id,
			@RequestParam String select_date, @RequestParam String select_time,
			@RequestParam String perfomplace, @RequestParam String prfnm,
			@RequestParam String perfomtype, @RequestParam String userid, 
			@RequestParam String unusername, @RequestParam String unusername2,
			@RequestParam String unuseremail2, @RequestParam String seat_class, 
			@RequestParam int ticket_seq, @RequestParam int booking,
			@RequestParam int pay_price) {
		
		//[1] 체크용
		//[2] 넘겨줘서 ajax 쓸대 사용할거임
		String chkuserid = (String)session.getAttribute("userid");
		logger.info("현재로그인 한 유저ID, 파라미터 chkuserid={} ", chkuserid);
		
		//[1] 디버깅
		//[2] import.jsp로부터 넘어오는 파라미터입니다.
		logger.info("------------결제완료 창 보여주기------------");
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 mt20id={} mt10id={} ", mt20id, mt10id);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomdate={} select_time={} ", select_date, select_time);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomplace={} prfnm={} ", perfomplace, prfnm);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomtype={} userid={} ", perfomtype, userid);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 unusername={} unusername2={} ", unusername, unusername2);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 unuseremail2={} seat_class={} ", unuseremail2, seat_class);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 ticket_seq={} booking={} ", ticket_seq, booking);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 ticketPriceSubmit={} ", pay_price);
		
		//[1] ModelAttribute쓰기에는 받아오는 컬럼이 중구난방이여서 RequestParam을 사용했습니다.
		//[2] ReservationVo 값 Setting == ModelAttribute
		ReservationVO reservationVo = new ReservationVO();
		reservationVo.setMt20id(mt20id);
		reservationVo.setMt10id(mt10id);
		reservationVo.setBooking(booking);
		reservationVo.setPerfomtype(perfomtype);
		reservationVo.setPrfnm(prfnm);
		reservationVo.setSeat_class(seat_class);
		reservationVo.setSelect_date(select_date);
		reservationVo.setSelect_time(select_time);
		reservationVo.setTicket_seq(ticket_seq);
		reservationVo.setUserid(userid);			 
		reservationVo.setPay_price(pay_price);		
		
		//[중요] 
		//[1] reservationVo.setUserid(userid); 
		//[*] userid셋팅해준거 아닙니다, userid자리에 비회원 예매자 이메일 들어갑니다.
		//[*] 이왕이면 컬럼명 한 글자만 바뀌어도 500에러 발생하기에, 웬만하면 변경하지 마세용
		
		//[1] 예매번호 난수를 위한 변수 생성
		String pay_ticket_number = "";
		int random = 0;
		
		//[2] 변수에 난수 생성 후 대입.
		for(int i=0;i<=5;i++) {
			random = (int)(Math.random()*9+1);
			pay_ticket_number += Integer.toString(random);	
		}
		
		//[3]예매번호가 중복 될 수도 있는 부분은 익주형이랑 상의.
		logger.info("for문 돌린 후 예매번호 6자리={} ", pay_ticket_number);
		reservationVo.setPay_ticket_number(pay_ticket_number);	
		
		//[*]예매 테이블 
		int cnt = paymentService.insertReservation(reservationVo);
		logger.info("예약 테이블 데이터 등록 결과, cnt={} ", cnt);
		
		//[*]예매 테이블로부터 reservationSeq 획득, [조건]은 예매번호로 줬습니다.
		int reservationSeq = paymentService.selectReservationForPayment(reservationVo);
		logger.info("예매번호6자리 난수를 조건으로 준 후 SELECT~한 결과, reservation_seq={} ", reservationSeq);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationSeq", reservationSeq);
		
		//[*]결제테이블 
		int result = paymentService.insertPayment(map);
		logger.info("결제 완료 내역 테이블 등록 결과, result={} ", result);
		
		//[*]ticketVo
		TicketVO ticketVo= new TicketVO();
		
		//[*]DB작업 위해 컬럼명 수정
		int selled = booking;
		int ticketSeq = ticket_seq;
		
		logger.info("사용자가 선택한 티켓 수, selled={} ticketSeq={} ", selled, ticketSeq);
		
		ticketVo.setSelled(selled);
		ticketVo.setTicketSeq(ticketSeq);
		
		//[*]공연별 판매수량 
		int ticketResult = ticketService.updateTicketForPayment(ticketVo);
		logger.info("공연별 판매수량, 사용자가 선택한 티켓 값을 더한 결과 ticketResult={} ", ticketResult);
		
		//[*]userid - 비회원은 usierid 컬럼명에, 예매자 이메일(email)들어가게 해놔서 'unuseremail' 로 컬럼명 변경해줬습니다.
		String unuseremail = userid;
		
		model.addAttribute("pay_ticket_number", pay_ticket_number);		//예매번호
		model.addAttribute("prfnm", prfnm);								//공연명
		model.addAttribute("select_date", select_date);					//선택한 공연 날짜
		model.addAttribute("select_time", select_time);					//선택한 공연 시간
		model.addAttribute("perfomplace",perfomplace);					//공연 장소
		model.addAttribute("seat_class",seat_class);					//좌석 등급
		model.addAttribute("unusername",unusername);					//예매자명
		model.addAttribute("unuseremail",unuseremail);					//예매자 이메일
		model.addAttribute("unusername2", unusername2);					//관람자명
		model.addAttribute("unuseremail2", unuseremail2);				//관람자 이메일
		model.addAttribute("chkuserid", chkuserid);						//현재 로그인 한 유저 id
		model.addAttribute("selled", selled);
		
		return "performance/showPaymentend";
	}
	
	@RequestMapping("/showPaymentendUser.do")
	public String showPaymentendUser(HttpSession session, Model model, 
			@RequestParam String mt20id, @RequestParam String mt10id,
			@RequestParam String select_date, @RequestParam String select_time,
			@RequestParam String perfomplace, @RequestParam String prfnm,
			@RequestParam String perfomtype, @RequestParam String userid, 
			@RequestParam String username, @RequestParam String username2,
			@RequestParam String useremail2, @RequestParam String useremail, 
			@RequestParam int ticket_seq, @RequestParam int booking,
			@RequestParam int pay_price, @RequestParam String seat_class,
			@RequestParam String hp, @RequestParam int mileagePoint) {

		String chkuserid = (String)session.getAttribute("userid");
		logger.info("현재로그인 한 유저ID, 파라미터 chkuserid={} ", chkuserid);
		
		//[1] 디버깅
		//[2] importUser.jsp로부터 넘어오는 파라미터입니다.
		logger.info("------------결제완료 창 보여주기------------");
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 mt20id={} mt10id={} ", mt20id, mt10id);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomdate={} select_time={} ", select_date, select_time);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomplace={} prfnm={} ", perfomplace, prfnm);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 perfomtype={} userid={} ", perfomtype, userid);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 username={} username2={} ", username, username2);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 useremail2={} seat_class={} ", useremail2, seat_class);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 ticket_seq={} booking={} ", ticket_seq, booking);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 pay_price={} useremail={} ", pay_price, useremail);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 hp={} mileagePoint={} ", hp, mileagePoint);
		
		ReservationVO reservationVo = new ReservationVO();
		reservationVo.setMt10id(mt10id);
		reservationVo.setMt20id(mt20id);
		reservationVo.setBooking(booking);
		reservationVo.setPerfomtype(perfomtype);
		reservationVo.setPrfnm(prfnm);
		reservationVo.setSeat_class(seat_class);
		reservationVo.setSelect_date(select_date);
		reservationVo.setSelect_time(select_time);
		reservationVo.setTicket_seq(ticket_seq);
		reservationVo.setUserid(userid);				//일반회원은 로그인 한 유저의 실제 ID가 들어갑니다.
		reservationVo.setPay_price(pay_price);
		
		String pay_ticket_number = "";
		int random = 0;
		
		for(int i=0;i<=5;i++) {
			random = (int)(Math.random()*9+1);
			pay_ticket_number += Integer.toString(random);	
		}
		
		logger.info("for문 돌린 후 예매번호 6자리={} ", pay_ticket_number);
		reservationVo.setPay_ticket_number(pay_ticket_number);	
		
		//[1]예매 테이블 
		int cnt = paymentService.insertReservation(reservationVo);
		logger.info("예약 테이블 데이터 등록 결과, cnt={} ", cnt);
		
		//[1]예매 테이블로부터 reservationSeq 획득, 조건은  예매번호로 줬습니다.
		int reservationSeq = paymentService.selectReservationForPayment(reservationVo);
		logger.info("예매번호6자리 난수를 조건으로 준 후 SELECT~한 결과, reservation_seq={} ", reservationSeq);
		
		//[1]결제테이블 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationSeq", reservationSeq);
		map.put("usedmileage", mileagePoint);
		
		int result = paymentService.insertPayment(map);
		logger.info("결제 완료 내역 테이블 등록 결과, result={} ", result);
		
		//[중반부-파이널-유저테이블 마일리지 UPDATE]
		if(mileagePoint!=0) {
			//[구분] 
			//로그인 한 유저가 마일리지를 사용했음	     -> mileagePoint!=0
			//로그인 한 유저가 마일리지를 사용하지 않았음 	 -> mileagePoint==0
			MileageVO mileageVo = null;
			
			//마일리지 변화사유 -> 유저가 마일리지를 사용함 -> 마일리지변화에 시퀸스 (5) 셋팅
			mileageVo = new MileageVO();
			mileageVo.setMileagePoint(mileagePoint);
			logger.info("현재 결제 후 나온 마일리지의 변화 금액, mileagePoint={} ", mileagePoint);
			mileageVo.setUserid(userid);
			logger.info("로그인 한 회원 ID= 한번더 찍기, USERID={} ", userid);
			mileageVo.setMileaebecSeq(5);//결제 금액 할인
			
			//마일리지 변화 사유에 INSERT -> 사유는 해당 유저가 마일리지를 사용
			int mgResult = paymentService.insertMileage(mileageVo);
			logger.info("마일리지 변화 사유 테이블에 insert한 결과, mgResult={} ", mgResult);	//시퀸스 - 5 /// 마일리지 - 90원
			
			//여기서 다시 셋팅
			int temporaryMileage = mileagePoint;
			//사용한 마일리지 값을 우선 받아둔다(사용자가 사용한 마일리지 포인트)
			logger.info("로그인 한 유저가 사용한 마일리지 금액, 파라미터 temporaryMileage={} ", temporaryMileage);
			
			MemberVO memberVo = new MemberVO();
			memberVo.setUserid(userid);
			
			//결제금액 * 0.005를 로그인 한 유저 마일리지로 결정
			mileagePoint = (int)(pay_price*0.005);		
			
			mileageVo = new MileageVO();
			mileageVo.setMileagePoint(mileagePoint);
			logger.info("현재 결제 후 나온 마일리지의 변화 금액, mileagePoint={} ", mileagePoint);
			mileageVo.setUserid(userid);
			logger.info("로그인 한 회원 ID= 한번더 찍기, USERID={} ", userid);
			mileageVo.setMileaebecSeq(1);//결제 후 적립
			
			//마일리지 변화 사유에 INSERT -> 사유는 결제 처리가 전부 완료된 후 마일리지 테이블에 INSERT
			int mgResult2 = paymentService.insertMileage(mileageVo);
			logger.info("마일리지 변화 사유 테이블에 insert한 결과, mgResult={} ", mgResult2);
		
			//결제 후 기본적으로 적립되는 0.005%의 mileagePoint - 유저가 사용한 마일리지 값을 뺀다.
			mileagePoint = mileagePoint - temporaryMileage;
			logger.info("결제 후 적립되는 마일리지 - 유저가 사용한 마일리지의 값, mileagePoint={} ", mileagePoint);
			
			memberVo.setMileagePoint(mileagePoint);
			
			//현재 로그인 한 유저의 마일리지를 업데이트 해줌.
			int mileageResult = memberService.updateUserforMileage(memberVo);
			logger.info("로그인 한 회원의 마일리지 적용 O -> 일반 결제 후, mileageResult={} ", mileageResult);
			
			//결제 후 적립된 마일리지 + 유저가 사용한 마일리지 -> 마일리지변화 테이블에 INSERT
			//mileagePoint = temporaryMileage + temporaryMileage2;
		
		
		}else if(mileagePoint==0){
			MemberVO memberVo = new MemberVO();
			memberVo.setUserid(userid);
			
			mileagePoint = (int)(pay_price*0.005);	
			logger.info("마일리지가 적용되지 않은 티켓의 총액 값 * 0.005를 한 가격 mileagePoint={} ", mileagePoint);
			memberVo.setMileagePoint(mileagePoint);
			
			int mileageResult = memberService.updateUserforMileage(memberVo);
			logger.info("로그인 한 회원의 마일리지 적용 x -> 일반 결제 후, mileageResult={} ", mileageResult);
			
			MileageVO mileageVo = new MileageVO();
			mileageVo.setMileagePoint(mileagePoint);
			logger.info("현재 결제 후 나온 마일리지의 변화 금액, mileagePoint={} ", mileagePoint);
			mileageVo.setUserid(userid);
			logger.info("로그인 한 회원 ID= 한번더 찍기, USERID={} ", userid);
			mileageVo.setMileaebecSeq(1);//결제 후 적립
			
			int mgResult = paymentService.insertMileage(mileageVo);
			logger.info("마일리지 변화 사유 테이블에 insert한 결과, mgResult={} ", mgResult);
		}

		//ticketVo
		TicketVO ticketVo= new TicketVO();
		
		//DB작업 위해 컬럼명 수정.
		int selled = booking;
		int ticketSeq = ticket_seq;
		
		logger.info("사용자가 선택한 티켓 수, selled={} ticketSeq={} ", selled, ticketSeq);
		
		ticketVo.setSelled(selled);
		ticketVo.setTicketSeq(ticketSeq);
		
		int ticketResult = ticketService.updateTicketForPayment(ticketVo);
		logger.info("공연별 판매수량, 사용자가 선택한 티켓 값을 더한 결과 ticketResult={} ", ticketResult);
	
		model.addAttribute("pay_ticket_number", pay_ticket_number);		//예매번호
		model.addAttribute("prfnm", prfnm);								//공연명
		model.addAttribute("select_date", select_date);					//선택한 공연 날짜
		model.addAttribute("select_time", select_time);					//선택한 공연 시간
		model.addAttribute("perfomplace",perfomplace);					//공연 장소
		model.addAttribute("seat_class",seat_class);					//좌석 등급
		model.addAttribute("username",username);						//예매자명
		model.addAttribute("useremail",useremail);						//예매자 이메일
		model.addAttribute("username2", username2);						//관람자명
		model.addAttribute("useremail2", useremail2);					//관람자 이메일
		model.addAttribute("hp", hp);									//예매자 핸드폰 번호
		model.addAttribute("chkuserid", chkuserid);						//현재 로그인한 유저 id - 체크용
		model.addAttribute("selled", selled);
	
		//결제완료가 되면 -> 회원등급 분류 -> TBL_USER -> GRADE_NAME -> UPDATE
		//tbl_user join tbl_payment join tbl_refund
		String userGrade = paymentService.selectReservation(reservationVo);
		logger.info("회원등급 비교를 위해 사용될 userGrade={}",userGrade);

		
		int totalRefund = paymentService.totalRefundforMemberGrade(userGrade);
		logger.info("로그인 한 회원의 총 환불금액 여부, 파라미터 totalRefund={} ", totalRefund);
		
		//로그인 한 유저가 결제한 총 결제 금액
		int totalPrice = paymentService.totalPayforMemberGrade(userGrade);
		logger.info("로그인 한 회원의 총 결제금액 여부, 파라미터 totalPrice={} ", totalPrice);
		
		//환불 금액을 뺀 유저의 총 결제금액 -> 이걸로 회원등급 결정
		int conditionPrice = totalPrice - totalRefund;
		logger.info("로그인 한 회원 총결제 금액 여부, 환불 금액 - 총액 conditionPrice={} ", conditionPrice);
		
		int [] totalStandardPrice = new int[6];
		int chkNum = 0;
		
		List<GradeVO> list=grademanagerService.gradeListforPayment();
		
		for(GradeVO grade : list) {
			totalStandardPrice[chkNum] = grade.getGradeStandard();
			System.out.println(totalStandardPrice[chkNum]);
			chkNum++;
		}
		
		//회원 등급 -> 
		//-> 50000, 1000000, 1500000, 2000000 
		//-> 유저의 회원등급 업데이트
		MemberVO memberVo = new MemberVO();
		if(conditionPrice>=totalStandardPrice[0]) {
			memberVo.setGradeSeq(5);
			memberVo.setGradeName("vip");
			memberVo.setUserid(userGrade);
			int gradeResult = memberService.updateUserforMembership(memberVo);
			logger.info("회원등급 변경 결과, VIP result={}", gradeResult);
			
		}else if(conditionPrice>=totalStandardPrice[1]) {
			memberVo.setGradeSeq(4);
			memberVo.setGradeName("p");
			memberVo.setUserid(userGrade);
			int gradeResult = memberService.updateUserforMembership(memberVo);
			logger.info("회원등급 변경 결과, P result={}", gradeResult);
			
		}else if(conditionPrice>=totalStandardPrice[2]) {
			memberVo.setGradeSeq(3);
			memberVo.setGradeName("g");
			memberVo.setUserid(userGrade);
			int gradeResult = memberService.updateUserforMembership(memberVo);
			logger.info("회원등급 변경 결과, G result={}", gradeResult);
			
		}else if(conditionPrice>=totalStandardPrice[3]) {
			memberVo.setGradeSeq(2);
			memberVo.setGradeName("s");
			memberVo.setUserid(userGrade);
			int gradeResult = memberService.updateUserforMembership(memberVo);
			logger.info("회원등급 변경 결과, S result={}", gradeResult);
			
		}else if(conditionPrice>=totalStandardPrice[4]) {
			memberVo.setGradeSeq(1);
			memberVo.setGradeName("b");
			memberVo.setUserid(userGrade);
			int gradeResult = memberService.updateUserforMembership(memberVo);
			logger.info("회원등급 변경 결과, B result={}", gradeResult);
		}
		
		return "performance/showPaymentend";
	}
	
}
