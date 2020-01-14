package com.fp.delight.common.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.delight.common.model.AreaService;
import com.fp.delight.excel.model.AreaSidoVO;

@Controller
public class AreaController {
	private static final Logger logger=LoggerFactory.getLogger(AreaController.class);
	
	@Autowired
	private AreaService areaSerive;
	
	@RequestMapping(value = "/inc/inc_area.do" ,method = RequestMethod.GET)
	public String area(Model model) {
		logger.info("지역 시,도 목록 검색 시작");
		
		List<AreaSidoVO> list=areaSerive.selectSido();
		
		model.addAttribute("sido", list);
		
		return "inc/inc_area";
	}
	
	
}
