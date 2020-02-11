package com.fp.delight.performent.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.fp.delight.admin.salesManagement.Model.TicketDiscountVO;
import com.fp.delight.admin.salesManagement.Model.TicketSettingService;
import com.fp.delight.common.IPUtility;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.performent.model.PerformentDetailVO;
import com.fp.delight.performent.model.PerformentListVO;
import com.fp.delight.recent.model.RecentService;
import com.fp.delight.recent.model.RecentVO;
import com.fp.delight.review.model.ReviewService;
import com.fp.delight.review.model.ReviewVO;
import com.fp.delight.ticket.model.TicketService;
import com.fp.delight.ticket.model.TicketVO;

///performance/pfDetail.do?mt20id=${vo.mt20id }'/>">
@Controller
@RequestMapping("/performance")
public class PerformentController {
	private final Logger logger
		= LoggerFactory.getLogger(PerformentController.class);
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private LikeService likeService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private TicketSettingService ticketSettingService;
	
	@Autowired
	private RecentService recentService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/pfDetail.do")
	public String performentList_post(@RequestParam String perfomid,HttpSession session,
			Model model) {
		logger.info("메인 페이지 공연 포스터 클릭=>, 공연 아이디 perfomid : ,"+perfomid);	
		
		String userid=(String)session.getAttribute("userid");
		LikeVO likeVo=new LikeVO();
		
		likeVo.setMt20id(perfomid);
		likeVo.setUserid(userid);
		
		String heart="like.png";
		
		if(userid!=null && !userid.isEmpty()) {
			int cnt=likeService.selectLike(likeVo);
			if(cnt>0) {
				heart="like2.png";
			}
		}
		
		String iporid="";
		if(userid!=null && !userid.isEmpty()) {
			iporid=userid;
		
		}else {
			IPUtility ip = new IPUtility();
			iporid=ip.Url();
			logger.info("iporid={}", iporid);
		}
		
		List<RecentVO> recentList = recentService.selectRecentPerformance(iporid);
		logger.info("최근 본 공연, 조건 -> USERID / 비회원 -> IP주소, recentList={} ", recentList);
		logger.info("최근 본 공연, 조건 -> USERID / 비회원 -> IP주소, recentList.size={} ", recentList.size());
		
		String [] mt20id = new String[recentList.size()];
		for(int i=0;i<recentList.size();i++) {
			RecentVO recentVo = recentList.get(i);
			mt20id[i]=recentVo.getMt20id();
		}
		model.addAttribute("mt20id", mt20id);
		
		PerformentAPI perfomAPI = new PerformentAPI();
		
		String [] poster = new String[recentList.size()];
		String [] mt20id2 = new String[recentList.size()];
		for(int i=0;i<recentList.size();i++) {
			Map<String, Object> map = perfomAPI.performDetail(mt20id[i]);
			poster[i]=(String) map.get("poster");
			mt20id2[i]=(String) map.get("mt20id");
			logger.info("poster=>{} ", poster[i]);
			logger.info("mt20id2=>{} ",mt20id2);
		}
		
		model.addAttribute("poster", poster);
		model.addAttribute("mt20id2",mt20id2);
		
		int likeCount=likeService.selectLikeAll(perfomid);
		if(likeCount==0) {
			likeCount=0;
		}
		

		List<TicketVO> tclist=ticketService.selectreserList(perfomid);
		logger.info("rvlist.size={}",tclist);
		
		PerformentAPI perform = null; 
		Map<String, Object> map = null;		//공연상세보기 - 전체 데이터 사용
		Map<String, Object> map2 = null;	//공연지역상세 - 위도,경도 사용
		
		if(perfomid!=null && !perfomid.isEmpty()) {
			perform = new PerformentAPI();
			//공연전체
			map=perform.performDetail(perfomid);						
			
			//위도,경도용
			map2=perform.performLocation((String)map.get("mt10id"));	
			
			//추천공연 - 날짜지정 후 랜덤 사진 뿌려주기
			List<PerformentListVO> list=perform.performRecommend();
			
			//공연 상세보기 포스터 데이터
			model.addAttribute("map2", map);	
			logger.info("공연 상세보기 메서드 호출 결과, map={}", map);
			
			//위도, 경도
			model.addAttribute("map2_location", map2);
			logger.info("공연 상세보기 지역 위도, 경도 호출 map2={}",map2);
			
			//추천공연
			model.addAttribute("list", list);
			logger.info("추천 공연, map3={}", list);
		}
		
		Map<String, Object> reviewmap=reviewService.selectReviewInfo(perfomid);

		ReviewVO reviewVo=new ReviewVO();

		reviewVo.setReviewMt20id(perfomid);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		reviewVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		reviewVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> rlist=reviewService.selectReviewListAll(reviewVo);

		logger.info("@@확인 rlist={}",rlist);
		
		model.addAttribute("rlist",rlist);
		
		model.addAttribute("reviewmap",reviewmap);
		
		model.addAttribute("tclist",tclist);

		model.addAttribute("heart",heart);
		model.addAttribute("likeCount",likeCount);
		
		return "performance/pfDetail";
	}
	
	//회원결제진행창 보여주기
	@RequestMapping("/pfReservation.do")
	public String showReservation(@ModelAttribute PerformentDetailVO performentDetailVo, HttpSession session,
			Model model,@RequestParam int ticketSeq) {
		//로그인 한 유저
		String userid = (String)session.getAttribute("userid");
		
		//공연id
		String perfomid = performentDetailVo.getMt20id();
		
		//관리자가 등록한 티켓에 대한 시퀸스를 가져옴 - Id대신 Name 추가
		logger.info("select~option selectDate2={}", ticketSeq); 
		
		logger.info("결제 진행 화면 보여주기 위한 파라미터 perfomid={} userid={}", perfomid, userid);
		
		if(userid!=null && !userid.isEmpty() && perfomid!=null && !perfomid.isEmpty()) {
			PerformentAPI perform = new PerformentAPI();
			Map<String, Object> map = perform.performDetail(perfomid);
			logger.info("결제진행 정보 데이터 뿌리기, map={} ", map);
			
			//해당 공연에 대한 상세정보 
			model.addAttribute("map_pay",map);			
	
			MemberVO memberVo = memberService.selectMember(userid);
			logger.info("결제진행 정보 데이터 뿌리기, memberVo={}", memberVo);

			String email1 = memberVo.getEmail1();
			String email2 = memberVo.getEmail2();
			
			String email = "";
			if(email1!=null && !email1.isEmpty() && email2!=null && !email2.isEmpty()) {
				email = email1+"@"+email2;
			}
			
			logger.info("유저 이메일 통합, 파라미터 email={} " + email);
			
			model.addAttribute("email", email);			//이메일 쪼개서 하나로 통합
			model.addAttribute("memberVo", memberVo);	//유저 정보
			model.addAttribute("map_pay",map);			//해당 공연에 대한 상세정보 
		
			//유저의 회원 등급 조회
			Map<String, Object> memberGrade = memberService.selectMemberGrade(userid);
			logger.info("로그인 한 유저의 회원등급 정보, 파라미터 memberGrade={}", memberGrade);
			
			//회원 등급 조회
			model.addAttribute("membergrade", memberGrade);
			
			//공연 SEQ를 넘겨받아 해당 공연에 대한 공연정보를 다시 가져온다.
			TicketVO tkVo =  ticketService.selectCategory(ticketSeq);
			logger.info("해당 공연에 대한 공연 티켓정보, tkVo==>{} ", tkVo);
			
			//해당 공연결과 저장
			model.addAttribute("tkVo", tkVo);
			
			Map<String, Object> map_membership = memberService.selectMemberShip(userid);
			logger.info("유저의 회원권 검색, 파라미터 map_membership={}", map_membership);
			
			//유저 회원권[이렇게 한 컨트롤러에서 많은 작업 상관없겠지??]
			model.addAttribute("map_membership", map_membership);
			
			TicketDiscountVO ticketVo = ticketSettingService.seldiscountByseq(ticketSeq);
			logger.info("특별할인 tbl_discount테이블 조회 결과, 파라미터 ticketVo={} ", ticketVo);
		
			model.addAttribute("ticketVo", ticketVo);
		}
		
		//결제 진행창으로 -> 유저아이디, 공연 상세정보 return. 
		return "performance/pfReservation";
	}
	
	
	//비회원결제진행창 보여주기
	@RequestMapping("/pfNoReservation.do")
	public String showReservation(@ModelAttribute PerformentDetailVO performentDetailVo, 
			Model model, @RequestParam int ticketSeq) {
		logger.info("비회원 결제진행창으로부터의 진행사항, 파라미터 performentDetailVo={} ticketSeq={} ", performentDetailVo);
		
		//공연id
		String perfomid = performentDetailVo.getMt20id();
		
		//관리자가 등록한 티켓에 대한 시퀸스를 가져옴 - Id대신 Name 추가
		logger.info("select~option selectDate2={}", ticketSeq); 
		
		logger.info("결제 진행 화면 보여주기 위한 파라미터 perfomid={} ", perfomid);
	
		if(perfomid!=null && !perfomid.isEmpty()) {
			PerformentAPI perform = new PerformentAPI();
			Map<String, Object> map = perform.performDetail(perfomid);
			logger.info("결제진행 정보 데이터 뿌리기, map={} ", map);
			
			//해당 공연에 대한 상세정보 
			model.addAttribute("map_pay",map);	
			
			//공연 SEQ를 넘겨받아 해당 공연에 대한 공연정보를 다시 가져온다.
			TicketVO tkVo =  ticketService.selectCategory(ticketSeq);
			logger.info("해당 공연에 대한 공연 티켓정보, tkVo==>{} ", tkVo);
		
			//해당 공연결과 저장
			model.addAttribute("tkVo", tkVo);
			
			TicketDiscountVO ticketVo = ticketSettingService.seldiscountByseq(ticketSeq);
			logger.info("특별할인 tbl_discount테이블 조회 결과, 파라미터 ticketVo={} ", ticketVo);
		
			model.addAttribute("ticketVo", ticketVo);
		}
		
		return "performance/pfNoReservation";
	}//E
	
	//결제진행 import
	@RequestMapping(value = "/import.do", method = RequestMethod.POST)
	public String showImport(@RequestParam String ticketPriceSubmit, @RequestParam String mt20id,
			@RequestParam String mt10id, @RequestParam String prfdate,
			@RequestParam String prfhour, @RequestParam String fcltynm,
			@RequestParam String prfnm, @RequestParam String genrenm, 
			@RequestParam int ticketSeq, @RequestParam int ticketCount,
			@RequestParam String unusername, @RequestParam String unuseremail, 
			@RequestParam String unusername2, @RequestParam String unuseremail2, 
			@RequestParam String ticketSeat,HttpSession session,
			Model model) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("비회원 관련 처리, 로그인 한 유저 userid={} ", userid);
		
		String [] payPrice = ticketPriceSubmit.split("원");
		ticketPriceSubmit = payPrice[0];
		
		int pay_price = Integer.parseInt(ticketPriceSubmit);
		
		logger.info("import로 넘겨주는 파라미터, pay_price={} mt20id={} ",pay_price, mt20id);
		logger.info("import로 넘겨주는 파라미터, mt10id={} prfdate={} ", mt10id, prfdate);
		logger.info("import로 넘겨주는 파라미터, prfhour={} fcltynm={} ", prfhour, fcltynm);
		logger.info("import로 넘겨주는 파라미터, prfnm={} genrenm={} ", prfnm, genrenm);
		logger.info("import로 넘겨주는 파라미터, UndefinedUname={} UndefinedUemail={} ", unusername, unuseremail);
		logger.info("import로 넘겨주는 파라미터, UndefinedUname2={} UndefinedUemail2={} ", unusername2, unuseremail2);
		logger.info("import로 넘겨주는 파라미터, ticketSeat={} ticketSeq={} ", ticketSeat, ticketSeq);
		logger.info("import로 넘겨주는 파라미터, ticketCount={} ", ticketCount);
		
		prfnm = prfnm.replace("[", "(").replace("]", ")");
		logger.info("공연명 [] 없애고 다시 공연명 출력==> prfnm={} ", prfnm);
		fcltynm = fcltynm.replace("[", "(").replace("]", ")");
		logger.info("공연 장소 [] 없애고 다시 공연 장소 출력==> perfomplace={} ", fcltynm);
		
		/*
		 [1] 받아야하는 파라미터가 너무 많아서
		 일일이 세팅해줬습니다. 설명이 필요한 부분은
		 (김영민) <- 한테 문의 해주세요
		 
		 [2] DB작업은 일단 안 한 상태입니다.
		 결제 완료 되면 요청 넘겨서 DB작업할겁니다.
		 */
		
		model.addAttribute("ticketPriceSubmit",pay_price); 			//유저가 선택 한 티켓의 총합
		model.addAttribute("perfomid", mt20id);				 		//공연 id
		model.addAttribute("perfomfacilityid", mt10id);		 		//공연 시설 id
		model.addAttribute("perfomdate",prfdate);			 		//ticketVo에 있는 공연날짜
		model.addAttribute("perfomtime",prfhour);			 		//ticketVo에 있는 공연시간
		model.addAttribute("perfomplace",fcltynm);			 		//공연장소
		model.addAttribute("perfomtitle", prfnm);			 		//공연제목
		model.addAttribute("perfomtype",genrenm);			 		//공연타입
		model.addAttribute("unusername",unusername); 				//예매자명
		model.addAttribute("unuseremail",unuseremail);				//예매자이메일
		model.addAttribute("unusername2",unusername2);				//관잠자명
		model.addAttribute("unuseremail2",unuseremail2);			//관람자이메일
		model.addAttribute("ticketSeat",ticketSeat);				//선택한 좌석 등급
		model.addAttribute("ticketSeq", ticketSeq);					//선택된 해당 공연의 SEQ
		model.addAttribute("userid", userid);						//로그인 한 유저
		model.addAttribute("ticketCount", ticketCount);				//선택된 티켓 수량

		//import결제연동 - 비회원
		return "performance/import";
	}
	
	@RequestMapping("/importuser.do")
	public String showImportForUser(HttpSession session, Model model, 
			@RequestParam String mt20id, @RequestParam String ticketPriceSubmitUser,
			@RequestParam String mt10id, @RequestParam String prfdate,
			@RequestParam String prfhour, @RequestParam String fcltynm,
			@RequestParam String prfnm, @RequestParam String genrenm, 
			@RequestParam int ticketSeq, @RequestParam int ticketCount,
			@RequestParam String username, @RequestParam String useremail, 
			@RequestParam String username2, @RequestParam String useremail2,
			@RequestParam String ticketSeat, @RequestParam String mileagePoint) {
		
		String [] payPrice = ticketPriceSubmitUser.split("원");
		ticketPriceSubmitUser = payPrice[0];
		
		int pay_price = Integer.parseInt(ticketPriceSubmitUser);
		
		logger.info("import로 넘겨주는 파라미터, ticketPriceSubmitUser={} mt20id={} ",pay_price, mt20id);
		logger.info("import로 넘겨주는 파라미터, mt10id={} prfdate={} ", mt10id, prfdate);
		logger.info("import로 넘겨주는 파라미터, prfhour={} fcltynm={} ", prfhour, fcltynm);
		logger.info("import로 넘겨주는 파라미터, prfnm={} genrenm={} ", prfnm, genrenm);
		logger.info("import로 넘겨주는 파라미터, username={} useremail={} ", username, useremail);
		logger.info("import로 넘겨주는 파라미터, username2={} useremail2={} ", username2, useremail2);
		logger.info("import로 넘겨주는 파라미터, ticketSeat={} ticketCount={} ", ticketSeat, ticketCount);
		logger.info("import로 넘겨주는 파라미터, mileagePoint={} ", mileagePoint);
		
		prfnm = prfnm.replace("[", "(").replace("]", ")");
		logger.info("공연명 [] 없애고 다시 공연명 출력==> prfnm={} ", prfnm);
		fcltynm = fcltynm.replace("[", "(").replace("]", ")");
		logger.info("공연 장소 [] 없애고 다시 공연 장소 출력==> perfomplace={} ", fcltynm);
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 된 유저 아이디 : userid={}", userid);
		
		//일반회원을 회원 정보를 가져오기위해 vo선언
		MemberVO memberVo = new MemberVO();
		
		//로그인 한 유저 id 셋팅
		memberVo.setUserid(userid);
		
		String hp = "";
		String hp1 = "";
		String hp2 = "";
		String hp3 = "";
		
		//비회원이 아닌 회원이 로그인 한 상태라면
		if(userid!=null && !userid.isEmpty()) {
			memberVo = memberService.selectMember(userid);
			logger.info("import로 넘겨주는 파라미터, 로그인 한 유저 정보={} ", memberVo);
			
			hp1 = memberVo.getHp1();
			hp2 = memberVo.getHp2();
			hp3 = memberVo.getHp3();
			
			if(hp1!=null && !hp1.isEmpty() && hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()) {
				hp = hp1+"-"+hp2+"-"+hp3;
				logger.info("로그인 한 일반회원의 전화번호={} ", hp);
			}
			
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("hp", hp);
		}
		
		/*
		 [1] 받아야하는 파라미터가 너무 많아서
		 일일이 세팅해줬습니다. 설명이 필요한 부분은
		 (김영민) <- 한테 문의 해주세요
		 
		 [2] DB작업은 일단 안 한 상태입니다.
		 결제 완료 되면 요청 넘겨서 DB작업할겁니다.
		 */
		
		model.addAttribute("ticketPriceSubmitUser",pay_price); 	//유저가 선택 한 티켓의 총합
		model.addAttribute("perfomid", mt20id);				 				//공연 id
		model.addAttribute("perfomfacilityid", mt10id);		 				//공연 시설 id
		model.addAttribute("perfomdate",prfdate);			 				//ticketVo에 있는 공연날짜
		model.addAttribute("perfomtime",prfhour);			 				//ticketVo에 있는 공연시간
		model.addAttribute("perfomplace",fcltynm);			 				//공연장소
		model.addAttribute("perfomtitle", prfnm);			 				//공연제목
		model.addAttribute("perfomtype",genrenm);			 				//공연타입
		model.addAttribute("username",username); 							//예매자명
		model.addAttribute("useremail",useremail);							//예매자이메일
		model.addAttribute("username2",username2);							//관잠자명
		model.addAttribute("useremail2",useremail2);						//관람자이메일
		model.addAttribute("ticketSeat",ticketSeat);						//선택한 좌석 등급
		model.addAttribute("ticketSeq", ticketSeq);							//선택된 해당 공연의 SEQ
		model.addAttribute("ticketCount", ticketCount);						//선택된 티켓 수량
		model.addAttribute("mileagePoint", mileagePoint);					//해당 유저의 마일리지 값 -> 선택-> 유저의 마일리지 or 선택안함-> 0 
		
		//import결제연동 - 일반회원
		return "performance/importUser";
	}
	
}//End

