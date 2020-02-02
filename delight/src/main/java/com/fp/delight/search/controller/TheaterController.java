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
import com.fp.delight.perform.api.ApiTest_theater;
import com.fp.delight.perform.api.ApiTest_theaterDetail;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/performSearchResult")
public class TheaterController {
	private static final Logger logger=LoggerFactory.getLogger(TheaterController.class);
	
	/*맨 처음 연극 로딩했을 때*/
	@RequestMapping(value="/theaterSearch.do")
	public String theaterList_get(HttpServletRequest request, Model model) {
		logger.info("theaterList 화면 보여주기");
		String type=request.getParameter("type");
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		ApiTest_theater api = new ApiTest_theater();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();	
		try {
			list = api.receiveAPI(type, pageIndex);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
		
		return "performSearchResult/theaterSearch";
	}
	
	/*연극 더보기*/
	@RequestMapping(value="/theaterMoreRead.do")
	@ResponseBody
	public Object theaterMoreRead(HttpServletRequest request) {
		logger.info("theaterList 화면 보여주기");
	
		String type=request.getParameter("type");
		String sido=request.getParameter("sido");
		String gugun=request.getParameter("gugun");
		String stdate=request.getParameter("stdate");
		String eddate=request.getParameter("eddate");
		String perfomName=request.getParameter("performName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(perfomName!=null && !perfomName.isEmpty()) {
			perfomName=perfomName.replace(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 type={},sido={}",type,sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={},stdate={}",gugun,stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},perfomName={}",eddate,perfomName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);

		if(perfomName==null) perfomName="";
		ApiTest_theaterDetail api = new ApiTest_theaterDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();	
		try {
			list = api.receiveAPI(type, sido, gugun, stdate, eddate, perfomName, pageIndex);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/*연극에서 조건 검색해서 넘겼을 때*/
	@RequestMapping("/theaterDetail_Search.do")
	public String performentList(HttpServletRequest request,Model model) {
		logger.info("연극정보 상세검색");
		String type=request.getParameter("type");
		String sido=request.getParameter("sido");
		String gugun=request.getParameter("gugun");
		String stdate=request.getParameter("stdate");
		String eddate=request.getParameter("eddate");
		String perfomName=request.getParameter("performName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		if(type==null) {
			type="AAAA";
		}
		
		//공연명이 널값이 아닌 경우, 띄어쓰기 없앤다 
		if(perfomName!=null && !perfomName.isEmpty()) {
			perfomName=perfomName.replaceAll(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 type={},sido={}",type,sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={},stdate={}",gugun,stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},perfomName={}",eddate,perfomName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);
		
		if(perfomName==null) perfomName="";
		ApiTest_theaterDetail apiTest = new ApiTest_theaterDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();
		
		try {
			list = apiTest.receiveAPI(type, sido, gugun, stdate, eddate, perfomName, pageIndex);
			
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
    	
		return "performSearchResult/theaterSearch";
	}
	
	
}
