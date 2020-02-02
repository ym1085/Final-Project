package com.fp.delight.search.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fp.delight.perform.api.ApiTest_period;
import com.fp.delight.perform.api.ApiTest_periodDetail;
import com.fp.delight.performent.model.PerformentListVO;


@Controller
@RequestMapping("/performSearchResult")
public class PeriodController {
	private static final Logger logger=LoggerFactory.getLogger(PeriodController.class);
	
	/*맨 처음 기간별 로딩했을 때*/
	@RequestMapping(value="/periodSearch.do")
	public String periodList_get(HttpServletRequest request, Model model) {
		logger.info("기간별 처음 로딩할 때 화면 보여주기");
		
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		ApiTest_period apiTest = new ApiTest_period();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();			
		try {
			list = apiTest.receiveAPI(pageIndex);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
		
		return "performSearchResult/periodSearch";
	}
	
	/*기간별 더보기*/
	@RequestMapping(value="/periodMoreRead.do")
	@ResponseBody
	public Object periodMoreRead(HttpServletRequest request){
		logger.info("뮤지컬 페이지에서 더보기 클릭했을 때 화면 보여주기");
		
		String type=request.getParameter("type");
		String stdate=request.getParameter("stdate");
		String eddate=request.getParameter("eddate");
		String performName=request.getParameter("performName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(performName!=null && !performName.isEmpty()) {
			performName=performName.replace(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 type={}",type);
		logger.info("표 설정 공연 검색 파라미터 stdate={}",stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},performName={}",eddate, performName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);

		if(performName==null) performName="";
		ApiTest_periodDetail apiTest = new ApiTest_periodDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();	
		try {
			list = apiTest.receiveAPI(type, stdate, eddate, performName, pageIndex);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/*기간별에서 조건 검색해서 넘겼을 때*/
	@RequestMapping("/periodDetail_Search.do")
	public String periodList(HttpServletRequest request,Model model){
		logger.info("기간별 정보 사용자가 선택한 조건 검색");
		
		String type=request.getParameter("type");
		String stdate=request.getParameter("stdate");
		String eddate=request.getParameter("eddate");
		String perfomName=request.getParameter("performName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		//공연명이 널값이 아닌 경우, 띄어쓰기 없앤다 
		if(perfomName!=null && !perfomName.isEmpty()) {
			perfomName=perfomName.replaceAll(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 type={}",type);
		logger.info("표 설정 공연 검색 파라미터 stdate={}",stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},perfomName={}",eddate,perfomName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);
		
		if(perfomName==null) perfomName="";
		ApiTest_periodDetail apiTest = new ApiTest_periodDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();
		
		try {
			list = apiTest.receiveAPI(type, stdate, eddate, perfomName, pageIndex);
			
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
    	
		return "performSearchResult/periodSearch";
	}

}
