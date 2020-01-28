package com.fp.delight.payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.payment.model.PaymentService;
import com.fp.delight.payment.model.PaymentVO;
import com.fp.delight.payment.model.ReservationVO;
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
		reservationVo.setMt10id(mt20id);
		reservationVo.setMt20id(mt10id);
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
		
		//[*]결제테이블 
		int result = paymentService.insertPayment(reservationSeq);
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
			@RequestParam String hp) {

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
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 ticketPriceSubmit={} useremail={} ", pay_price, useremail);
		logger.info("import로부터 넘어오는 데이터 체크, 파라미터 hp={} ", hp);
		
		ReservationVO reservationVo = new ReservationVO();
		reservationVo.setMt10id(mt20id);
		reservationVo.setMt20id(mt10id);
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
		int result = paymentService.insertPayment(reservationSeq);
		logger.info("결제 완료 내역 테이블 등록 결과, result={} ", result);
		
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
		
		return "performance/showPaymentend";
	}
	
}
