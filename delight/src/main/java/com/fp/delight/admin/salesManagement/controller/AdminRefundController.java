package com.fp.delight.admin.salesManagement.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.delight.admin.salesManagement.Model.AdminRefundService;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.SearchVO;
import com.fp.delight.common.Utility;

@Controller
@RequestMapping("/admin/salesManagement")
public class AdminRefundController {
	private static final Logger logger=LoggerFactory.getLogger(AdminRefundController.class);
	
	@Autowired
	private AdminRefundService adminRefundService;
	
	@RequestMapping("/refundReqList.do")
	public void refundReqList(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("환불 목록 보이기 파라미터 searchVo={}",searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=adminRefundService.refundListTotal(searchVo);
		
		logger.info("totalRecord={}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("셋팅 후 searchVo={}",searchVo);
		
		List<Map<String, Object>> list=adminRefundService.refundList(searchVo);
		
		logger.info("검색 결과 list.size()={}",list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
}
