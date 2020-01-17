package com.fp.delight.category.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fp.delight.api.ApiTest_Index;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/inc")
public class ButtonAPIController {
	private static final Logger logger
	=LoggerFactory.getLogger(ButtonAPIController.class);

	@RequestMapping(value = "/ButtonAPI.do")
	public String buttonAPI_get(Model model) {
		logger.info("ButtonAPI 화면 보여주기");
		
		try {
			ApiTest_Index apiTest = new ApiTest_Index();
			List<PerformentListVO> alist = apiTest.receiveAPI(); 
			
			model.addAttribute("alist", alist);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "ButtonAPI";
	}

}
