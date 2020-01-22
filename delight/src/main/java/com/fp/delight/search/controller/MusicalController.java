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

import com.fp.delight.perform.api.ApiTest_musical;
import com.fp.delight.performent.model.PerformentListVO;


@Controller
@RequestMapping("/performSearchResult")
public class MusicalController {
	private static final Logger logger
	=LoggerFactory.getLogger(MusicalController.class);
	
	@RequestMapping(value="/musicalSearch.do")
	public String musicalList_get(@RequestParam String type, Model model) {
		logger.info("musicalList 화면 보여주기");
		
		try {
			ApiTest_musical apiTest = new ApiTest_musical();
			List<PerformentListVO> alist = apiTest.receiveAPI(type); 
			
			model.addAttribute("alist", alist);
			model.addAttribute("type", type);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "performSearchResult/musicalSearch";
	}

}
