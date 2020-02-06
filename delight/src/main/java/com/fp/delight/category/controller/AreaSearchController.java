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

import com.fp.delight.api.ApiTest_arSearch;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/mainSearchResult")
public class AreaSearchController {
	private static final Logger logger
	=LoggerFactory.getLogger(AreaSearchController.class);
	
	@RequestMapping(value = "/mainAreaSearch.do")
	public String areaSearch_get(@RequestParam String sido, @RequestParam String gugun, 
			Model model) {
		logger.info("areaSearch 화면 보여주기");
    	
    	try {
    		ApiTest_arSearch apiTest = new ApiTest_arSearch();
    		List<PerformentListVO> alist = apiTest.receiveAPI(sido, gugun); 
			logger.info("검색 결과 alist.size()={}",alist.size());
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "mainSearchResult/mainAreaSearch";
	}
}
