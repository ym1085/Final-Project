package com.fp.delight.admin.salesManagement.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.perfom.AdminCommon;
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
		String totalP=request.getParameter("totalP");
		perfomName=perfomName.replace(" ", "");
		logger.info("표 설정 공연 검색 파라미터 type={},sido={}",type,sido);
		logger.info("표 설정 공연 검색 파라미터 gugun={},stdate={}",gugun,stdate);
		logger.info("표 설정 공연 검색 파라미터 eddate={},perfomName={}",eddate,perfomName);
		logger.info("표 설정 공연 검색 파라미터 totalP={}",totalP);
		if(perfomName==null) perfomName="";
		AdminPerfomAPI api=new AdminPerfomAPI();
		
		Map<String, Object> map=api.ticketSearch(type, sido, gugun, stdate, eddate, perfomName,curPage, totalP);
		Map<String, Object> reMap=new HashMap<String, Object>();
		List<PerformentListVO> list=(List<PerformentListVO>) map.get("list");
		
		
		int cnt=(Integer) map.get("pageCount");
		
			reMap.put("list", list);
			reMap.put("cnt", cnt);
		
		return reMap;
		
	}
	
	@RequestMapping("/settingDetail.do")
	public void settingDetail(@RequestParam String perfomid,Model model) {
		logger.info("판매표 수량 설정 상세보기 페이지 파라미터 공연id="+perfomid);
		AdminPerfomAPI api=new AdminPerfomAPI();
		
		Map<String, Object> map=api.performDetail(perfomid);
		
		String sdate=(String) map.get("prfpdfrom");
		String eddate=(String) map.get("prfpdto");
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.DD");
		String now=sdf.format(d);
		String[] nowymd=now.split("\\.");
		String[] sdateymd=sdate.split("\\.");
		Date sd=new Date(Integer.parseInt(sdateymd[0]), Integer.parseInt(sdateymd[1]), Integer.parseInt(sdateymd[2]));
		
		if(sd.compareTo(d)>0) {
			map.put("sdateymd",nowymd );
		}else {
			map.put("sdateymd", sdateymd);
		}
		
		
		String[] eddatyemd=eddate.split("\\.");
		
		
		
		map.put("eddateymd", eddatyemd);
		
		
		model.addAttribute("map", map);
		
	}
	
	@RequestMapping("/setting.do")
	@ResponseBody
	public Object setting(@RequestParam String seldate,@RequestParam String dayhour, @RequestParam String seat) {
		logger.info("날짜에 따른 시간과 좌석 보내주기");
		logger.info(" 파라미터 선택날짜={},시간 날짜={}",seldate,dayhour);
		logger.info("좌석={}",seat);
		AdminCommon adminCommon=new AdminCommon();
		String[] dateArr=seldate.split("-");
		Date d=new Date(Integer.parseInt(dateArr[0]),Integer.parseInt(dateArr[1])
				, Integer.parseInt(dateArr[2]));
		int dow=d.getDay(); //선택된 날의 요일
		int okidx=0;
		String[] dayhourArr=dayhour.split(", ");
		
		for(int i=0;i<dayhourArr.length;i++) {
			String dh=dayhourArr[i];
			if(dh.indexOf(" ~ ")!=-1) {
				String temp=dh.substring(0, dh.indexOf("("));
				int res=adminCommon.getDayofWeek(temp);
				if(res==dow) {
					okidx=i;
					break;
				}
			}else {
				String temp=dh.substring(0, dh.indexOf("("));
				String[] tmp=temp.split(" ~ ");
				int[] res=adminCommon.getdoubledow(tmp);
				if(res[0]>res[1]) {
					
				}
			}
			
		}
		
		return null;
	}
}
