package com.fp.delight.admin.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.statistics.model.ChartVO;
import com.fp.delight.admin.statistics.model.StatisticsService;

@Controller
@RequestMapping("/admin/numericalStatement")
public class StatisticsController {
	private static final Logger logger=LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	private StatisticsService statisticesService;
	
	@RequestMapping("/memberStatistics.do")
	public void memberStatistics(Model model) {
		logger.info("회원 통계 보이기");
		List<Map<String, Object>> list=statisticesService.gendercount();
		for(Map<String, Object> map:list) {
			if(((String)map.get("GENDER")).equals("여")) {
				//woman=Integer.parseInt((String) map.get("COUNT"));
				model.addAttribute("woman", map.get("COUNT"));
			}else if(((String)map.get("GENDER")).equals("남")) {
				//man=Integer.parseInt((String) map.get("COUNT"));
				model.addAttribute("man", map.get("COUNT"));
			}
		}
		List<ChartVO> agegroup=statisticesService.agegroup();
		
		JSONArray jso=new JSONArray();
		for(int i=0;i<agegroup.size();i++) {
			jso.put(agegroup.get(i).getTotal());
		}
		JSONArray jso2=new JSONArray();
		for(int i=0;i<agegroup.size();i++) {
			jso2.put(agegroup.get(i).getAge());
		}
		
		
		model.addAttribute("agegroup", jso);
		model.addAttribute("age", jso2);
	}
	
	@RequestMapping("/joincount.do")
	@ResponseBody
	public Object joincount(Model model) {
		logger.info("ajax로 하이차트 일별 가입자 수");
		List<ChartVO> list=statisticesService.joincount();
		
		return list;
	}
	
	@RequestMapping("/salesSatistics.do")
	public void salesSatistics() {
		logger.info("매출 통계 보여주기");
	}
	
	@RequestMapping("/daysales.do")
	@ResponseBody
	public Object daysales() {
		logger.info("ajax로 하이차트 일별 매출");
		List<ChartVO> list=statisticesService.daysales();
		logger.info("list.size()={}",list.size());
		return list;
	}
	
	@RequestMapping("/dayselled.do")
	@ResponseBody
	public Object dayselled() {
		logger.info("일별 예매 수량 차트");
		List<ChartVO> list=statisticesService.dayselled();
		logger.info("list.size()={}",list.size());
		
		return list;
	}
	
	@RequestMapping("/dayvisitor.do")
	@ResponseBody
	public Object dayvisitor() {
		logger.info("일별 방문자 수 그래프");
		
		List<ChartVO> list=statisticesService.dayvisitor();
		logger.info("list.size()={}",list.size());
		
		return list;
	}
}
