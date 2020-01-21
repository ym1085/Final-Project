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
import org.springframework.web.bind.annotation.RequestParam;
import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.performent.model.PerformentDetailVO;
import com.fp.delight.performent.model.PerformentListVO;
import com.fp.delight.ticket.controller.TicketService;
import com.fp.delight.ticket.controller.TicketVO;

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
		

		model.addAttribute("tclist",tclist);

		model.addAttribute("heart",heart);
		model.addAttribute("likeCount",likeCount);
		
		return "performance/pfDetail";
	}
	
	//회원결제진행창 보여주기
	@RequestMapping("/pfReservation.do")
	public String showReservation(@ModelAttribute PerformentDetailVO performentDetailVo, HttpSession session,
			Model model) {
		//로그인 한 유저
		String userid = (String)session.getAttribute("userid");
		
		//공연id
		String perfomid = performentDetailVo.getMt10id();
		
		logger.info("결제 진행 화면 보여주기 위한 파라미터 perfomid={} userid={}", perfomid, userid);
		
		if(userid!=null && !userid.isEmpty() && perfomid!=null && !perfomid.isEmpty()) {
			PerformentAPI perform = new PerformentAPI();
			Map<String, Object> map = perform.performDetail(perfomid);
			logger.info("결제진행 정보 데이터 뿌리기, map={} ", map);
			
			MemberVO memberVo = memberService.selectMember(userid);
			logger.info("결제진행 정보 데이터 뿌리기, memberVo={}", memberVo);
			
			model.addAttribute("memberVo", memberVo);	//유저 정보
			model.addAttribute("map_pay",map);			//해당 공연에 대한 상세정보 
		}
		
		//결제 진행창으로 -> 유저아이디, 공연 상세정보 return. 
		return "performance/pfReservation";
	}
	
	//비회원결제진행창 보여주기
	@RequestMapping("/pfNoReservation.do")
	public void showReservation() {
		
	}
	
	//결제진행 import
	@RequestMapping("/import.do")
	public String showImport(@RequestParam String perfomid, HttpSession session,
			Model model) {
		logger.info("결제진행 창 Import 보여주기, 공연id={}", perfomid);
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 된 유저 아이디 : userid={}", userid);
		
		MemberVO memberVo = new MemberVO();
		
		//String hp = "";
		//String hp1 = "";
		//String hp2 = "";
		//String hp3 = "";
		if(userid!=null && !userid.isEmpty()) {
			memberVo = memberService.selectMember(userid);
			
			//hp1 = memberVo.getHp1();
			//hp2 = memberVo.getHp2();
			//hp3 = memberVo.getHp3();

			model.addAttribute("memberVo", memberVo);
		}
		
		model.addAttribute("perfomid", perfomid);
		
		return "performance/import";
	}
	
}

