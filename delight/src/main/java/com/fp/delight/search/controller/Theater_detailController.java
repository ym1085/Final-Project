package com.fp.delight.search.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.perform.api.ApiTest_theaterDetail;
import com.fp.delight.performent.model.PerformentListVO;

//검색결과페이지에서 왼쪽 메뉴바 연극 카테고리에서 상세검색하는 소스 -예진-
@Controller
@RequestMapping("/performSearchResult")
public class Theater_detailController {
	private final Logger logger
		= LoggerFactory.getLogger(Theater_detailController.class);

	@RequestMapping("/theaterDetail_Search.do")
	public String performentList(@RequestParam(required=false) String sido,
			@RequestParam(required=false) String gugun,
			@RequestParam(required=true) String stdate, 
			@RequestParam(required=true) String eddate, 
			@RequestParam(required=false) String perfomName, Model model) {
		logger.info("공연 API, 공연목록 데이터 출력!");
		
		try {
			ApiTest_theaterDetail apiTest = new ApiTest_theaterDetail();
    		List<PerformentListVO> alist = apiTest.receiveAPI(sido, gugun, stdate, eddate, perfomName); 
			
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "performSearchResult/theaterSearch";
	}
}
