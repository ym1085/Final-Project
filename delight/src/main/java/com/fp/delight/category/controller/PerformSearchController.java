package com.fp.delight.category.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fp.delight.api.ApiTest_pfSearch;
import com.fp.delight.performent.model.PerformentListVO;

//메인에서 날짜, 공연명 검색하면 검색결과 페이지로 넘어가면서 API 뿌려줌
@Controller
@RequestMapping("/mainSearchResult")
public class PerformSearchController {
	private final Logger logger
		= LoggerFactory.getLogger(PerformSearchController.class);

	@RequestMapping("/mainPerformSearch.do")
	public String performentList(@RequestParam(required=true) String startDay, 
			@RequestParam(required=true) String endDay, @RequestParam(required=false) String performName, 
			Model model) {
		logger.info("공연 API, 공연목록 데이터 출력!");
		
		try {
			ApiTest_pfSearch apiTest = new ApiTest_pfSearch();
    		List<PerformentListVO> alist = apiTest.receiveAPI(startDay, endDay, performName); 
			
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "mainSearchResult/mainPerformSearch";
	}
}
