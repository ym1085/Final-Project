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
import com.fp.delight.perform.api.ApiTest_total;
import com.fp.delight.performent.model.PerformentListVO;

//메인에서 검색결과 페이지로 넘어갔을때 헤더바 전체검색조건 -예진-
@Controller
@RequestMapping("/mainSearchResult")
public class TotalSearchController {
	private final Logger logger
		= LoggerFactory.getLogger(TotalSearchController.class);

	@RequestMapping("/totalPerformSearch.do")
	public String performentList(@RequestParam String type, @RequestParam(required = false) String sido,
			@RequestParam(required = false) String gugun, @RequestParam String stdate, @RequestParam String eddate, 
			@RequestParam(required = false) String performName, Model model) {
		logger.info("공연 API, 공연목록 데이터 출력!");
		logger.info("sido={},gugun={}",sido,gugun);
		logger.info("performName={}",performName);
		try {
			ApiTest_total apiTest = new ApiTest_total();
    		List<PerformentListVO> alist = apiTest.receiveAPI(type, sido, gugun, stdate, eddate, performName); 
			
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "mainSearchResult/mainPerformSearch";
	}
}
