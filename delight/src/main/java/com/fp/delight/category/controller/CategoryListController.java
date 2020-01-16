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
import com.fp.delight.api.ApiTest2;
import com.fp.delight.performent.model.PerformentListVO;


@Controller
@RequestMapping("/category")
public class CategoryListController {
	private static final Logger logger
	=LoggerFactory.getLogger(CategoryListController.class);
	
	@RequestMapping(value="/categoryList.do")
	public String CategoryList_get(@RequestParam String type, Model model) {
		logger.info("categoryList 화면 보여주기");
		
		try {
			ApiTest2 apiTest = new ApiTest2();
			List<PerformentListVO> alist = apiTest.receiveAPI(type); 
			
			model.addAttribute("alist", alist);
			model.addAttribute("type", type);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "index";
	}

}
