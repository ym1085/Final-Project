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
import com.fp.delight.perform.api.ApiTest_theater;
import com.fp.delight.performent.model.PerformentListVO;


@Controller
@RequestMapping("/performSearchResult")
public class TheaterController {
	private static final Logger logger
	=LoggerFactory.getLogger(TheaterController.class);
	
	@RequestMapping(value="/theaterSearch.do")
	public String theaterList_get(@RequestParam String type, Model model) {
		logger.info("theaterList 화면 보여주기");
		
		try {
			ApiTest_theater apiTest = new ApiTest_theater();
			List<PerformentListVO> alist = apiTest.receiveAPI(type); 
			
			model.addAttribute("alist", alist);
			model.addAttribute("type", type);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "performSearchResult/theaterSearch";
	}

}
