package com.fp.delight.performent.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

//github.com/delight123123/delight2.git
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
import com.fp.delight.performent.model.PerfomService;
//github.com/delight123123/delight2.git
import com.fp.delight.performent.model.PerformentListVO;

///performance/pfDetail.do?mt20id=${vo.mt20id }'/>">
@Controller
@RequestMapping("/performance")
public class PerformentController {
	private final Logger logger
		= LoggerFactory.getLogger(PerformentController.class);
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private PerfomService perfomService;
	
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
		
		List<Map<String, Object>> rvlist=perfomService.selectreserList(perfomid);
		
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
		
		model.addAttribute("rvlist",rvlist);
		model.addAttribute("heart",heart);
		model.addAttribute("likeCount",likeCount);
		
		return "performance/pfDetail";
	}
/*
	//결제진행창 보여주기
	@RequestMapping("/pfReservation.do")
	public String showReservation(@RequestParam String perfomid, HttpSession session,
			Model model) {
		String userid = (String)session.getAttribute("userid");
		logger.info("결제 진행 화면 보여주기 위한 파라미터 perfomid={} userid={}", perfomid, userid);
		
		if(userid!=null && !userid.isEmpty() && perfomid!=null && !perfomid.isEmpty()) {
			PerformentAPI perform = new PerformentAPI();
			Map<String, Object> map = perform.performDetail(perfomid);
			logger.info("결제진행 정보 데이터 뿌리기, map={} ", map);
			
			model.addAttribute("userid", userid);
			model.addAttribute("map_pay",map);
		}
		
		//결제 진행창으로 -> 유저아이디, 공연 상세정보 return. 
		return "performance/pfReservation";
	}*/
	
	//결제진행창 보여주기
	@RequestMapping("/pfNoReservation.do")
	public void showReservation() {
		
	}
	
}

