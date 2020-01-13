package com.fp.delight.excel.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ExcelService {
	public List<AreaSidoVO> ExcelSido(MultipartFile file, HttpServletRequest request);
	public List<AreaGugunVO> ExcelGugun(MultipartFile file, HttpServletRequest request);
	public int insertSido(AreaSidoVO areaSidoVo);
	public int insertGugun(AreaGugunVO areaGugunVo);
}
