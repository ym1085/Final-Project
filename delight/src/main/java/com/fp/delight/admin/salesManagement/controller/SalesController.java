package com.fp.delight.admin.salesManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.perfom.AdminPerfomAPI;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/admin/salesManagement")
public class SalesController {
	private static final Logger logger=LoggerFactory.getLogger(SalesController.class);
	
	@RequestMapping("/salesSetting.do")
	public void salesSetting() {
		logger.info("판매 표 수량 설정 페이지 보이기");
	}
	
	@RequestMapping("/ticketsetting.do")
	@ResponseBody
	public Object ticketsetting(HttpServletRequest request) {
		String type=request.getParameter("type");
		String sido=request.getParameter("sido");
		String gugun=request.getParameter("gugun");
		String stdate=request.getParameter("stdate");
		String eddate=request.getParameter("eddate");
		String perfomName=request.getParameter("perfomName");
		String curPage=request.getParameter("curPage");
		logger.info("표 설정 공연 검색 파라미터 type={},sido={}",type,sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={},stdate={}",gugun,stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},perfomName={}",eddate,perfomName);
		if(perfomName==null) perfomName="";
		AdminPerfomAPI api=new AdminPerfomAPI();
		
		Map<String, Object> map=api.ticketSearch(type, sido, gugun, stdate, eddate, perfomName,curPage);
		Map<String, Object> reMap=new HashMap<String, Object>();
		List<PerformentListVO> list=(List<PerformentListVO>) map.get("list");
		int cnt=(Integer) map.get("pageCount");
		
			reMap.put("list", list);
			reMap.put("cnt", cnt);
		
		return reMap;
		
	}
}
