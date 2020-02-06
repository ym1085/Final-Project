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

import com.fp.delight.perform.api.ApiTest_areaDetail;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/performSearchResult")
public class Area2_detailController {
	private static final Logger logger
	=LoggerFactory.getLogger(Area2_detailController.class);
	
	@RequestMapping(value="/areaDetail_Search.do")
	public String areaList_get(@RequestParam(required=true) String sido, 
			@RequestParam(required=true) String gugun, @RequestParam(required=false) String perfomName,
			Model model) {
		logger.info("periodList 화면 보여주기");
		
		try {
			ApiTest_areaDetail apiTest = new ApiTest_areaDetail();
			List<PerformentListVO> alist = apiTest.receiveAPI(sido, gugun, perfomName); 
			
			model.addAttribute("alist", alist);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "performSearchResult/areaSearch";
	}

}
