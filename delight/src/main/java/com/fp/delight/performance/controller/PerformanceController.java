package com.fp.delight.performance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.performance.model.PerformanceDetailDTO;
import com.fp.delight.performance.model.PerformanceListDTO;
import com.fp.delight.performance.model.PerformanceTheaterDetailDTO;

@Controller
@RequestMapping("/performance")
public class PerformanceController {
	private static final Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	
	//기본 리스트 컨트롤러
	@RequestMapping(value = "/plist.do", method=RequestMethod.GET)
	public void Performancelist(@ModelAttribute PerformanceListDTO dto, Model model) {
		
		PerformanceAPI api= new PerformanceAPI();
		List<PerformanceListDTO> alist = api.listAPI();
		
		logger.info("공공데이터 조회 결과, alist의 사이즈 alist={}", alist.size());
		
		model.addAttribute("alist", alist);
		model.addAttribute("dto", dto);	
	}
	

	//날짜별 컨트롤러
	@RequestMapping(value = "/psearchlist.do", method=RequestMethod.POST)
	public String Performancelist(@ModelAttribute PerformanceListDTO dto, @RequestParam(defaultValue="20100101") String stdate, 
																		@RequestParam(defaultValue="20150202") String eddate, Model model) {
		
		PerformanceAPI api= new PerformanceAPI();
		List<PerformanceListDTO> aalist = api.listdateAPI(stdate, eddate);
		
		logger.info("공공데이터 조회 결과, aalist의 사이즈 aalist={}", aalist.size());
		
		model.addAttribute("aalist", aalist);
		model.addAttribute("dto", dto);	
		
		return "performance/psearchlist";
	}

		
	//상세 정보 컨트롤러
	@RequestMapping(value ="/pdetail.do", method=RequestMethod.GET)
	public String Performancedetail(@RequestParam String mt20id, HttpServletRequest request, Model model) {
		
		PerformanceAPI api=new PerformanceAPI();
		List<PerformanceDetailDTO> blist = api.detailAPI(mt20id);
		
		logger.info("공공데이터 조회 결과, blist의 사이즈 blist={}", blist.size());
		
		model.addAttribute("mt20id", mt20id);
		model.addAttribute("blist", blist);
		
		return "/performance/pdetail";
	}
	
	@RequestMapping(value ="/ptheaterdetail.do", method=RequestMethod.GET)
	public String Performancetheaterdetail(@RequestParam String mt10id, HttpServletRequest request, Model model) {

		PerformanceAPI api=new PerformanceAPI();
		List<PerformanceTheaterDetailDTO> clist = api.TheaterdetailAPI(mt10id);
		
		logger.info("공공데이터 조회 결과, clist의 사이즈 clist={}", clist.size());
		
		model.addAttribute("mt10id", mt10id);
		model.addAttribute("clist", clist);
		
		return "/performance/ptheaterdetail";
	}
	
	@RequestMapping("/pfReservation.do")
	public void Reservation() {
		
	}
	
}
