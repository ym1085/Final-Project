package com.fp.delight.myimage.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.performent.controller.PerformentAPI;

@Controller
public class MyImageController {
	private static final Logger logger
	= LoggerFactory.getLogger(MyImageController.class);

	@RequestMapping("/member/imp/myImage.do")
	@ResponseBody
	public Map<String, Object> showMyImage(@RequestParam String perfomid, Model model) {
		logger.info("마우스 후버 실행 시, 공연 API 이미지 보여주기, perfomid={} ", perfomid);
		
		PerformentAPI perform = new PerformentAPI();
		Map<String, Object> perfomList = perform.performDetail(perfomid);
		logger.info("마우스 후버 실행 시, 공연 API 이미지 보여주기 perfomList={} ", perfomList);
		
		return perfomList;
	}
}
