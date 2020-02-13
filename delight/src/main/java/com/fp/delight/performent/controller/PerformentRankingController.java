package com.fp.delight.performent.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

//github.com/delight123123/delight2.git
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fp.delight.perform.api.ApiTest3_ranking;
import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
import com.fp.delight.performent.model.PerformentBoxOfficeVO;
//github.com/delight123123/delight2.git

import com.fp.delight.ticket.model.TicketService;


///performance/pfDetail.do?mt20id=${vo.mt20id }'/>">
@Controller
@RequestMapping("/performance")
public class PerformentRankingController {
	private final Logger logger 
	= LoggerFactory.getLogger(PerformentRankingController.class);
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value="/pfRanking.do")
	public String performanceRanking(@RequestParam(defaultValue="") String ststypeOption, Model model) {
		logger.info("랭킹페이지 보여주기");
		logger.info("랭킹페이지={}",ststypeOption);
		model.addAttribute("ststypeOption", ststypeOption);
		
		return "performance/pfRanking";
	}

	//랭킹 리스트  보여주기
	@RequestMapping(value="/pfRankingList.do") //시간, 기간별 랭킹
	public String performanceRankingList(@RequestParam(defaultValue="day") String ststype, //일일=day, 한주 간=week, 한달 간=month
									     @RequestParam(defaultValue="") String date, //기준일.
										 @RequestParam(defaultValue="") String catecode, //장르 코드
										 @RequestParam(defaultValue="11") String area, // 지역코드
										 @RequestParam(defaultValue="day") String ststypeOption,
										 @ModelAttribute PerformentBoxOfficeVO vo, 
										 HttpServletRequest request, HttpSession session, Model model) throws MalformedURLException, IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); //cal.add(Calendar.DATE);  -1이 기본
		date=sdf.format(cal.getTime());

		System.out.println("===pfRankingList.do 컨트롤러 - API====");
		logger.info("ststype={}, date={}",ststype, date);
		logger.info("catecode={}, area={}",catecode, area);
		
		ApiTest3_ranking api=new ApiTest3_ranking();
		List<PerformentBoxOfficeVO> rlist = api.rankingAPI(ststype, date, catecode, area);
		
		model.addAttribute("rlist",	rlist);
		logger.info("rlist={}",rlist.size());
		
		
		
		//like 기능 로직
		System.out.println("=====pfRankingList.do 컨트롤러 - like/ 예매율&누적관객수 ======");
		String userid=(String)session.getAttribute("userid");
		String perfomid="";
		String performtitle="";
		String performtype="";
				
		LikeVO likeVo=new LikeVO();
		int result=0; // Y/N
		int count=0; //  총합
		String img="like.png";
		List<Map<String, Object>> likeList=new ArrayList<Map<String,Object>>();
		
		for(int i=0;i<5;i++) {
			vo=rlist.get(i);
			perfomid=vo.getMt20id();
			performtitle=vo.getPrfnm();
			performtype=vo.getCate();
						
			likeVo.setMt20id(perfomid);
			likeVo.setUserid(userid);
			likeVo.setPrfnm(performtitle);
			likeVo.setGenre(performtype);
			
			
			count=likeService.selectLikeAll(perfomid);
			Map<String, Object> map=new HashMap<String, Object>();
			
			
			map.put("PERFOMID", perfomid);
			map.put("COUNT", count);
			map.put("RESULT", result);
			likeList.add(map);
			
			if(userid!=null && !userid.isEmpty()) {
				result=likeService.selectLike(likeVo);
				if(result>0) {
					img="like2.png";
				}else {
					img="like.png";
				}
				likeVo.setLikeCountSeq(result);	
			}
			
			map.put("IMG", img);
			
			logger.info("likeVo={}",likeVo);
			logger.info("좋아요 총합 count={}, 유저 좋아요 여부 result={}",count, result);
			logger.info("공연ID perfomid={}, 유저 좋아요 이미지 img={}",perfomid, img);
			logger.info("=============================================");
		}
		logger.info("likeList={}",likeList);
				
		model.addAttribute("likeList", likeList);		
		return "performance/pfRankingList";
	}
	
	//pfRankingList.do에서 기간 별 검색에 사용되는 ajax처리 컨트롤러
	@RequestMapping(value="/pfRankingListChange.do")
	@ResponseBody
	public Object PerformanceRankingList(@RequestParam(defaultValue="day") String ststype, //일일=day, 한주 간=week, 한달 간=month
										 @RequestParam(defaultValue="") String date, //기준일.
										 @RequestParam(defaultValue="") String catecode, //장르 코드
										 @RequestParam(defaultValue="11") String area, // 지역코드
										 @RequestParam(defaultValue="day") String ststypeOption,
										 @ModelAttribute PerformentBoxOfficeVO vo,Model model, HttpSession session) throws MalformedURLException, IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); //cal.add(Calendar.DATE);  -1이 기본
		date=sdf.format(cal.getTime());
		
		System.out.println("===pfRankingList.do 컨트롤러 - API====");
		logger.info("ststype={}, date={}",ststype, date);
		logger.info("catecode={}, area={}",catecode, area);
			
		ApiTest3_ranking api=new ApiTest3_ranking();
		List<PerformentBoxOfficeVO> rlist = api.rankingAPI(ststype, date, catecode, area);
		
		model.addAttribute("rlist",	rlist);
		
		//like 기능 로직
		System.out.println("=====pfRankingList.do 컨트롤러 - like // ticket 예매율, 누적관객수 ======");
		String userid=(String)session.getAttribute("userid");
		String perfomid="";
				
		LikeVO likeVo=new LikeVO();
		int result=0; // Y/N
		int count=0; //  총합
		String img="like.png";
		
		
		List<Map<String, Object>> likeList=new ArrayList<Map<String,Object>>();
		
	
		
		for(int i=0;i<rlist.size();i++) {
			vo=rlist.get(i);

			perfomid=vo.getMt20id();
			
			likeVo.setMt20id(perfomid);
			likeVo.setUserid(userid);

			
			
			count=likeService.selectLikeAll(perfomid);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("PERFOMID", perfomid);
			map.put("COUNT", count);
			map.put("RESULT", result);

			likeList.add(map);
			
			if(userid!=null && !userid.isEmpty()) {
				result=likeService.selectLike(likeVo);
				if(result>0) {
					img="like2.png";
				}else {
					img="like.png";
				}
				likeVo.setLikeCountSeq(result);	
			}

			map.put("IMG", img);

			logger.info("likeVo={}",likeVo);
			logger.info("좋아요 총합 count={}, 유저 좋아요 여부 result={}",count, result);
			logger.info("공연ID perfomid={}, 유저 좋아요 이미지 img={}",perfomid, img);
			logger.info("=============================================");
		}
		logger.info("likeList={}",likeList);


		model.addAttribute("likeList", likeList);
		
		Map<String, Object> newListMap= new HashMap<String, Object>();
		
		newListMap.put("likeList", likeList);
		newListMap.put("rlist", rlist);
		
		return newListMap;
	}
	
	
	@RequestMapping(value="/rateNtotal.do")
	@ResponseBody
	public Map<String, Object> rateNtotal(@RequestParam String perfomid,Model model, HttpSession session) {
		
		logger.info("perfomid={}", perfomid);
		
		Map<String, Object> map3=ticketService.rateNtotal(perfomid);
		
		return map3;
	}
	
	
}