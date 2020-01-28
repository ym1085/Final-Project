package com.fp.delight.excel.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.fp.delight.member.model.MemberVO;

public interface ExcelService {
	public List<AreaSidoVO> ExcelSido(MultipartFile file, HttpServletRequest request);
	public List<AreaGugunVO> ExcelGugun(MultipartFile file, HttpServletRequest request);
	public int insertSido(AreaSidoVO areaSidoVo);
	public int insertGugun(AreaGugunVO areaGugunVo);
	public SXSSFWorkbook makeExcelDown(List<MemberVO> list);
}
