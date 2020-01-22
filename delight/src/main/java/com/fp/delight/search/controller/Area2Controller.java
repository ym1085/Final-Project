package com.fp.delight.search.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.delight.perform.api.ApiTest_area;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/performSearchResult")
public class Area2Controller {
	private static final Logger logger
	=LoggerFactory.getLogger(Area2Controller.class);
	
	@RequestMapping(value="/areaSearch.do")
	public String areaList_get(Model model) {
		logger.info("periodList 화면 보여주기");
		
		try {
			ApiTest_area apiTest = new ApiTest_area();
			List<PerformentListVO> alist = apiTest.receiveAPI(); 
			
			model.addAttribute("alist", alist);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "performSearchResult/areaSearch";
	}

}
