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

import com.fp.delight.perform.api.ApiTest_area;
import com.fp.delight.perform.api.ApiTest_areaDetail;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/performSearchResult")
public class Area2Controller {
	private static final Logger logger=LoggerFactory.getLogger(Area2Controller.class);
	
	/* 지역별 카테고리 맨 처음 로딩했을 때*/
	@RequestMapping(value="/areaSearch.do")
	public String areaList_get(HttpServletRequest request, Model model) {
		logger.info("지역별 카테고리 처음 로딩했을 때 화면 보여주기");
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		ApiTest_area apiTest = new ApiTest_area();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();			 
		try {	
			list = apiTest.receiveAPI(pageIndex);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
		
		return "performSearchResult/areaSearch";
	}
	
	/*지역 더보기*/
	@RequestMapping(value="/areaMoreRead.do")
	@ResponseBody
	public Object areaMoreRead(HttpServletRequest request) {
		logger.info("지역별 페이지에서 더보기 클릭했을 때 화면 보여주기");
		
		String sido=request.getParameter("sido");
		String gugun=request.getParameter("gugun");
		String perfomName=request.getParameter("perfomName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(perfomName!=null && !perfomName.isEmpty()) {
			perfomName=perfomName.replace(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 sido={}",sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={}",gugun);
		logger.info("표 설정 공연 검색 파라미터 perfomName={}",perfomName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);

		if(perfomName==null) perfomName="";
		ApiTest_areaDetail api = new ApiTest_areaDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();	
		try {
			list = api.receiveAPI(sido, gugun, perfomName, pageIndex);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/*지역별에서 조건 검색해서 넘겼을 때*/
	@RequestMapping("/areaDetail_Search.do")
	public String areaList(HttpServletRequest request,Model model){
		logger.info("뮤지컬정보 사용자가 선택한 조건 검색");
		
		String sido=request.getParameter("sido");
		String gugun=request.getParameter("gugun");
		String perfomName=request.getParameter("perfomName");
		String pageIndex=request.getParameter("pageIndex");
		
		if(pageIndex==null) {
			pageIndex="1";
		}
		
		//공연명이 널값이 아닌 경우, 띄어쓰기 없앤다 
		if(perfomName!=null && !perfomName.isEmpty()) {
			perfomName=perfomName.replaceAll(" ", "");
		}
		
		logger.info("표 설정 공연 검색 파라미터 sido={}",sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={}",gugun);
		logger.info("표 설정 공연 검색 파라미터 perfomName={}",perfomName);
		logger.info("표 설정 공연 검색 파라미터 page={}",pageIndex);
		
		if(perfomName==null) perfomName="";
		ApiTest_areaDetail apiTest = new ApiTest_areaDetail();
		
		List<PerformentListVO> list=new ArrayList<PerformentListVO>();
		
		try {
			list = apiTest.receiveAPI(sido, gugun, perfomName, pageIndex);
			
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("alist", list);
    	
		return "performSearchResult/areaSearch";
	}

}
