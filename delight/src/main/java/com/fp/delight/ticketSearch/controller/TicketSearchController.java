package com.fp.delight.ticketSearch.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fp.delight.api.ApiTest_reservation;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.ticket.model.TicketVO;
import com.fp.delight.ticketSearch.model.TicketSearchService;

/*예진*/
@Controller
@RequestMapping("/mainSearchResult")
public class TicketSearchController {
	private final Logger logger = LoggerFactory.getLogger(TicketSearchController.class);
	
	@Autowired
	TicketSearchService ticketSearchService;
	
	//메인에서 예매하기 버튼 -> 예매하기 페이지 & 공연명 검색
	@RequestMapping(value = "/doReservation.do")
	public String Reservation_get(@RequestParam (required = false) String prfnm, 
			@ModelAttribute TicketVO ticketVO, Model model) {	
		logger.info("예약페이지 화면 보여주기");			
		logger.info("공연아이디 파라미터 확인 performid={}", prfnm);
			
		
		ticketVO.setPrfnm(prfnm);
		
		//페이징처리		
		//Paging 객체 생성
		PaginationInfo pagingInfo=new PaginationInfo();
		//pagingInfo에 BLOCK_SIZE, RECORD_COUNT 저장
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		//paginfInfo에 현재페이지 저장
		pagingInfo.setCurrentPage(ticketVO.getCurrentPage());
		
		ticketVO.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		ticketVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	
		int totalRecord=ticketSearchService.selectTotalRecord(ticketVO);
		
		logger.info("티켓 예매 테스트, 파라미터 totalRecord={} ", totalRecord);
		
		//새로추가
		pagingInfo.setTotalRecord(totalRecord);
		
		List<TicketVO> list2 =ticketSearchService.selectTicket(ticketVO);
				
		model.addAttribute("pagingInfo",pagingInfo);
	    	
		try {
		    		
			//상세정보 List 생성
			List<Map<String, Object>> alist = new ArrayList<Map<String,Object>>();
		    		
				for(int i=0;i<list2.size();i++) {
			    			
				    //ticketVo에서 공연아이디 추출
				    TicketVO ticketVo=list2.get(i);
				    String mt20id=ticketVo.getMt20id();
				    			
				    //api 생성
				    ApiTest_reservation apiTest = new ApiTest_reservation();
				    			
				    //map에다가 저장
				    Map<String, Object> map =apiTest.receiveAPI(mt20id);
				    
				    logger.info("list2에 저장한 ticketVo",map);
				    
			    	alist.add(map);
			    			   			
				}
		    	
			model.addAttribute("alist", alist);
							    		
			} catch (MalformedURLException e) {
					e.printStackTrace();
			} catch (IOException e) {
					e.printStackTrace();
			}
		    	   	
				return "mainSearchResult/doReservation";
			}
	
	
}	//class
