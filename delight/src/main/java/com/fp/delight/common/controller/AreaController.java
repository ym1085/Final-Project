package com.fp.delight.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.common.model.AreaService;
import com.fp.delight.excel.model.AreaGugunVO;
import com.fp.delight.excel.model.AreaSidoVO;

@Controller
public class AreaController {
	private static final Logger logger=LoggerFactory.getLogger(AreaController.class);
	
	@Autowired
	private AreaService areaSerive;
	
	@RequestMapping(value = "/inc/inc_area.do")
	public String area(Model model) {
		logger.info("지역 시,도 목록 검색 시작");
		
		List<AreaSidoVO> list=new ArrayList<AreaSidoVO>();
		list=areaSerive.selectSido();
		model.addAttribute("sido", list);
		

		return "inc/inc_area";
	}
	
	@RequestMapping(value = "/inc/areagugun.do" ,method = RequestMethod.POST)
	@ResponseBody
	public Object areagugun(@RequestBody String sido) {
		logger.info("ajax 시작 파라미터 sido={}",sido);
		int last2=sido.lastIndexOf(":\"");
		int last=sido.lastIndexOf("\"");
		logger.info("last2={},last={}",last2,last);
		String ss=sido.substring(last2+2, last);
		logger.info("ss={}",ss);
		List<AreaGugunVO> list=areaSerive.gugunSelectBySido(ss);
		logger.info("list.size()={}",list.size());
		
		ArrayList<String> arrList=new ArrayList<String>();
		for(int i=0;i<list.size();i++) {
			arrList.add(list.get(i).getGugun());
		}
		
		logger.info("arrList={}",arrList);
		
		
		Map<String, Object> reMap=new HashMap<String, Object>();
		reMap.put("list", list);
		
		return reMap;
	}
	
	
}
