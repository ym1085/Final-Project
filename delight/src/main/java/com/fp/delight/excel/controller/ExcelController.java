package com.fp.delight.excel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fp.delight.admin.userManagemet.model.MemberManagerService;
import com.fp.delight.excel.model.AreaGugunVO;
import com.fp.delight.excel.model.AreaSidoVO;
import com.fp.delight.excel.model.ExcelService;
import com.fp.delight.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class ExcelController {
	private static final Logger logger=LoggerFactory.getLogger(ExcelController.class);
	
	@Autowired
	private ExcelService excelService;
	
	@Autowired
	private MemberManagerService memberManagerService;
	
	@RequestMapping("/exceluploadImport.do")
	public String excelImport() {
		logger.info("엑셀 임포트 화면 보여주기");
		return "excelImport/exceluploadImport";
	}
	
	@RequestMapping(value = "/uploadExcelFile.do", method = RequestMethod.POST)
	public String excelUpandImport(@RequestParam String area,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("엑셀 인서트 시작 파라미터 area={}",area);
		MultipartHttpServletRequest req=
				(MultipartHttpServletRequest) request;
		MultipartFile file= req.getFile("fileInput");
		int cnt=0;
		if(area.equals("sido")) {
			List<AreaSidoVO> list=excelService.ExcelSido(file, request);
			for(int i=0;i<list.size();i++) {
				AreaSidoVO vo=list.get(i);
				cnt=excelService.insertSido(vo);
			}
		}else if(area.equals("gugun")) {
			List<AreaGugunVO> list=excelService.ExcelGugun(file, request);
			for(int i=0;i<list.size();i++) {
				AreaGugunVO vo=list.get(i);
				cnt=excelService.insertGugun(vo);
			}
		}
		String msg="인서트 실패", url="/admin/exceluploadImport.do";
		if(cnt>0) {
			msg=area+"테이블 인서트 완료";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/userListExcelDown.do")
	public ModelAndView downloadExcelFile() {
		logger.info("엑셀 다운 시작");
		
		List<MemberVO> list=memberManagerService.userAll();
		
		SXSSFWorkbook workbook=excelService.makeExcelDown(list);
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("locale", Locale.KOREA);
		map.put("workbook", workbook);
		map.put("workbookName", "회원목록");
		
		ModelAndView mav=new ModelAndView("excelDownloadView", map);
        
        return mav;
		
	}
	
}
