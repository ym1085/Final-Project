package com.fp.delight.admin.salesManagement.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.perfom.AdminCommon;
import com.fp.delight.admin.perfom.AdminPerfomAPI;
import com.fp.delight.admin.salesManagement.Model.TicketDiscountVO;
import com.fp.delight.admin.salesManagement.Model.TicketSettingService;
import com.fp.delight.admin.salesManagement.Model.TicketSettingVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.SearchVO;
import com.fp.delight.common.Utility;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/admin/salesManagement")
public class SalesController {
	private static final Logger logger=LoggerFactory.getLogger(SalesController.class);
	
	@RequestMapping("/salesSetting.do")
	public void salesSetting() {
		logger.info("판매 표 수량 설정 페이지 보이기");
	}
	
	@Autowired
	private TicketSettingService ticketSettingService;
	
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
		logger.info("sdate={}",sdate);
		String eddate=(String) map.get("prfpdto");
		logger.info("eddate={}",eddate);
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
		String now=sdf.format(d);
		String[] nowymd=now.split("\\.");
		String[] sdateymd=sdate.split("\\.");
		Date sd=new Date(Integer.parseInt(sdateymd[0])-1900, Integer.parseInt(sdateymd[1])-1, Integer.parseInt(sdateymd[2]));
		logger.info("시작일 sd={}",sdf.format(sd));
		logger.info("현재 now={}",sdf.format(d));
		logger.info("비교={}",sd.compareTo(d));
		if(sd.compareTo(d)>0) {
			//map.put("sdateymd",nowymd );
			map.put("sdateymd", sdateymd);
		}else {
			//map.put("sdateymd", sdateymd);
			map.put("sdateymd",nowymd );
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
		Date d=new Date(Integer.parseInt(dateArr[0]),Integer.parseInt(dateArr[1])-1
				, Integer.parseInt(dateArr[2])-1);
		logger.info("받아온 날짜 date 출력={}",d);
		int dow=d.getDay(); //선택된 날의 요일
		logger.info("선택된 날의 요일={}",dow);
		int okidx=0;
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(dayhour.indexOf(", ")!=-1) {
			String[] dayhourArr=dayhour.split(", ");
			
			for(int i=0;i<dayhourArr.length;i++) {
				String dh=dayhourArr[i];
				if(dh.indexOf(" ~ ")!=-1) {
					String temp=dh.substring(0, dh.indexOf("("));
					String[] tmp=temp.split(" ~ ");
					int[] res=adminCommon.getdoubledow(tmp);
					if(res[0]>res[1]) {
						if(res[1]==0) {
							if((res[0]<=dow && dow<=6)||dow==0) {
								okidx=i;
								break;
							}
						}else {
							logger.info("이경우는 잠깐 여기서 다시 생각좀");
						}
					}else {
						if(dow>=res[0] && dow<=res[1]) {
							okidx=i;
							break;
						}
					}
				}else {
					String temp=dh.substring(0, dh.indexOf("("));
					int res=adminCommon.getDayofWeek(temp);
					if(res==dow) {
						okidx=i;
						break;
					}
					
				}
			}//for
			
			logger.info("선택된 날에 걸린 인덱스 idx={}",okidx);
			
			String sel=dayhourArr[okidx].substring(dayhourArr[okidx].indexOf("(")+1, dayhourArr[okidx].lastIndexOf(")"));
			
			
			
			if(sel.indexOf(",")!=-1) {
				String[] hour=sel.split(",");
				map.put("hour", hour);
				map.put("result", 1);
			}else {
				String hour=sel;
				map.put("hour", hour);
				map.put("result", 0);	
			}
			
		}else {
			String temp=dayhour.substring(0, dayhour.indexOf("("));
			if(temp.indexOf(" ~ ")!=-1) {
				String[] arr=temp.split(" ~ ");
				int[] qq=adminCommon.getdoubledow(arr);
				if(qq[0]>qq[1]) {
					if(qq[1]==0) {
						if((qq[0]<=dow && dow<=6)||dow==0) {
							String aa=temp.substring(temp.indexOf("(")+1, temp.lastIndexOf(")"));
							if(aa.indexOf(",")!=-1) {
								String[] hour=aa.split(",");
								map.put("hour", hour);
								map.put("result", 1);
							}else {
								String hour=aa;
								map.put("hour", hour);
								map.put("result", 0);
							}
						}
					}else {
						if(qq[0]<=dow && dow<=qq[1]) {
							String aa=temp.substring(temp.indexOf("(")+1, temp.lastIndexOf(")"));
							if(aa.indexOf(",")!=-1) {
								String[] hour=aa.split(",");
								map.put("hour", hour);
								map.put("result", 1);
							}else {
								String hour=aa;
								map.put("hour", hour);
								map.put("result", 0);
							}
						}
					}
				}
			}
		}//if~ else(요일 시간 구하기 끝)
		
		if(seat.indexOf(", ")!=-1) {
			String[] seatprice=seat.split(", ");
			map.put("seatprice", seatprice);
			map.put("seatresult", 1);
		}else {
			map.put("seatprice", seat);
			map.put("seatresult", 0);
		}
		
		return map;
	}
	
	@RequestMapping("/insertticket.do")
	@ResponseBody
	public int insertticket(@RequestParam String seldate,@RequestParam String selhour,
			@RequestParam String selseat,@RequestParam int ticketNum,
			@RequestParam String mt20id,@RequestParam String prfnm) {
		logger.info("표 수량 등록 파라미터 선택날짜={},선택시간={}",seldate,selhour);
		logger.info("선택 좌석,정가={},정한 표수={}",selseat,ticketNum);
		logger.info("공연 id={},공연명={}",mt20id,prfnm);
		TicketSettingVO vo=new TicketSettingVO();
		logger.info("세팅 전 vo={}",vo);
		vo.setMt20id(mt20id);
		vo.setPrfdate(seldate);
		vo.setPrfhour(selhour);
		vo.setSellticket(ticketNum);
		vo.setSellclass(selseat.substring(0, selseat.indexOf("석")+1));
		String price="";
		int netprice=0;
		if(selseat.indexOf(") ")!=-1) {  // ') '를 가지고 있음
			price=selseat.substring(selseat.indexOf(") ")+2,selseat.lastIndexOf("원"));
			price=price.replace(",", "");
			netprice=Integer.parseInt(price);
		}else {
			price=selseat.substring(selseat.indexOf("석 ")+2,selseat.lastIndexOf("원"));
			price=price.replace(",", "");
			netprice=Integer.parseInt(price);
		}
			
		vo.setNetprice(netprice);
		vo.setPrfnm(prfnm);
		logger.info("세팅 후 vo={}",vo);
		
		int cnt=ticketSettingService.insertticket(vo);
		
		
		return cnt;
		
	}
	
	@RequestMapping("/salesDiscount.do")
	public void salesDiscount(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("특별 공연 할인 설정 페이지");
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=ticketSettingService.settingtotal(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("totalRecord={}",totalRecord);
		
		logger.info("값 셋팅 후 searchVo={}",searchVo);
		
		List<Map<String, Object>> list=ticketSettingService.selticket(searchVo);
		
		logger.info("검색 결과 list.size()={}",list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/discountsetting.do")
	public void discountsetting(@RequestParam String pfname,@RequestParam int ticketseq,Model model) {
		logger.info("특별 공연 할인 설정 페이지 보기");
		
		TicketDiscountVO vo=ticketSettingService.seldiscountByseq(ticketseq);
		
		logger.info("설정 확인 검색 결과 vo={}",vo);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/discountInsert.do")
	@ResponseBody
	public int discountInsert(@RequestParam String detail,@RequestParam int percent,
			@RequestParam int ticketSeq,@RequestParam int type) {
		
		TicketDiscountVO vo=new TicketDiscountVO();
		
		vo.setDetail(detail);
		vo.setPercent(percent);
		vo.setTicketSeq(ticketSeq);
		
		logger.info("특별 할인 등록 파라미터 vo={},타입={}",vo,type);
		int res=0;
		
		if(type==0) {
			logger.info("type이 0 이므로 insert 진행");
			int cnt=ticketSettingService.discountInsert(vo);
			if(cnt>0) {
				res=1;
			}else {
				res=-1;
			}
		}else if(type==1) {
			logger.info("type이 1이므로 update 진행");
			int cnt=ticketSettingService.discountUpdate(vo);
			if(cnt>0) {
				res=2;
			}else {
				res=-1;
			}
		}else {
			res=-1;
		}
		
		return res;
	}
	
	@RequestMapping("/discountDel.do")
	@ResponseBody
	public int discountDel(@RequestParam int ticketSeq) {
		logger.info("특별할인 설정 삭제 시작 파라미터 ticketSeq={}",ticketSeq);
		
		int res=ticketSettingService.discountDel(ticketSeq);
		
		return res;
	}
	
	@RequestMapping("/settingchk.do")
	@ResponseBody
	public int settingchk(@RequestParam String seldate,@RequestParam String selhour,
			@RequestParam String selseat,@RequestParam String mt20id,
			@RequestParam String prfnm) {
		logger.info("표 수량 등록 파라미터 선택날짜={},선택시간={}",seldate,selhour);
		logger.info("선택 좌석,정가={}",selseat);
		logger.info("공연 id={},공연명={}",mt20id,prfnm);
		TicketSettingVO vo=new TicketSettingVO();
		logger.info("세팅 전 vo={}",vo);
		vo.setMt20id(mt20id);
		vo.setPrfdate(seldate);
		vo.setPrfhour(selhour);
		vo.setSellclass(selseat.substring(0, selseat.indexOf("석")+1));
		String price="";
		int netprice=0;
		if(selseat.indexOf(") ")!=-1) {  // ') '를 가지고 있음
			price=selseat.substring(selseat.indexOf(") ")+2,selseat.lastIndexOf("원"));
			price=price.replace(",", "");
			netprice=Integer.parseInt(price);
		}else {
			price=selseat.substring(selseat.indexOf("석 ")+2,selseat.lastIndexOf("원"));
			price=price.replace(",", "");
			netprice=Integer.parseInt(price);
		}
			
		vo.setNetprice(netprice);
		vo.setPrfnm(prfnm);
		logger.info("세팅 후 vo={}",vo);
		
		int res=ticketSettingService.settingchk(vo);
		
		return res;
		
	}
	
	@RequestMapping("/settingList.do")
	public void settingList(SearchVO searchVo,Model model) {
		logger.info("표 수량 설정 목록 파라미터 searchVo={}",searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=ticketSettingService.settingListTotal(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("표 수량 설정 목록 total={}",totalRecord);
		
		List<Map<String, Object>> list=ticketSettingService.settingList(searchVo);
		logger.info("list={}",list);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
	}
	
	@RequestMapping("/settingEdit.do")
	public void settingEdit(@RequestParam int ticketseq,Model model) {
		logger.info("표 수량 수정하기 파라미터 ticketSeq={}",ticketseq);
		
		TicketSettingVO vo=ticketSettingService.setiingBySeq(ticketseq);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/editSetting.do")
	@ResponseBody
	public int editSetting(@RequestParam int ticketSeq,
			@RequestParam int selledit) {
		logger.info("수량 설정 변경 파라미터 ticketSeq={},selledit={}",
				ticketSeq,selledit);
		TicketSettingVO vo=new TicketSettingVO();
		vo.setTicketSeq(ticketSeq);
		vo.setSellticket(selledit);
		
		int res=ticketSettingService.settingEdit(vo);
		
		return res;
	}
	
	@RequestMapping("/settingDel.do")
	@ResponseBody
	public int settingDel(@RequestParam int ticketSeq) {
		logger.info("설정 삭제 파라미터 ticketSeq={}",ticketSeq);
		
		int res=ticketSettingService.settingDel(ticketSeq);
		
		return res;
	}
}
