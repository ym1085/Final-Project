package com.fp.delight.excel.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ExcelServiceImpl implements ExcelService{

	@Autowired
	private ExcelDAO excelDao;

	@Resource(name = "fileUpProperties")
	private Properties props;
	
	@Override
	public List<AreaSidoVO> ExcelSido(MultipartFile file, HttpServletRequest request) {
		List<AreaSidoVO> list=new ArrayList<AreaSidoVO>();
		String originFileName=file.getOriginalFilename();
		String fileName=getUniqueFileName(originFileName);
		String upPath=getFilePath(request);
		try {
			File f=new File(upPath, fileName);
			file.transferTo(f);
			
			String ext=getExt(originFileName);
			System.out.println("확장자명 = "+ext);
			if(ext.equals(".xlsx")) {
				XSSFWorkbook wb=new XSSFWorkbook(f);
				XSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					AreaSidoVO vo=new AreaSidoVO();
					XSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					
					XSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setSigngucode((int) cell.getNumericCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setSido(cell.getStringCellValue());
					
					list.add(vo);
				}
			}else {
				HSSFWorkbook wb=new HSSFWorkbook(new FileInputStream(f));
				HSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					AreaSidoVO vo=new AreaSidoVO();
					HSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					HSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setSigngucode((int) cell.getNumericCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setSido(cell.getStringCellValue());
					
					list.add(vo);
				}
			}
			
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}finally {
			File f=new File(upPath, fileName);
			if(f.exists() && f.canRead()) {
				f.delete();
			}
		}
		
		return list;
		

	}

	@Override
	public List<AreaGugunVO> ExcelGugun(MultipartFile file, HttpServletRequest request) {
		List<AreaGugunVO> list=new ArrayList<AreaGugunVO>();
		String originFileName=file.getOriginalFilename();
		String fileName=getUniqueFileName(originFileName);
		String upPath=getFilePath(request);
		try {
			File f=new File(upPath, fileName);
			file.transferTo(f);
			
			
			
			String ext=getExt(originFileName);
			if(ext.equals(".xlsx")) {
				XSSFWorkbook wb=new XSSFWorkbook(f);
				XSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					AreaGugunVO vo=new AreaGugunVO();
					XSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					
					XSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setSigngucodesub((int) cell.getNumericCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setGugun(cell.getStringCellValue());
					
					list.add(vo);
				}
			}else {
				HSSFWorkbook wb=new HSSFWorkbook(new FileInputStream(f));
				HSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					AreaGugunVO vo=new AreaGugunVO();
					HSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					HSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setSigngucodesub((int) cell.getNumericCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setGugun(cell.getStringCellValue());
					
					list.add(vo);
				}
			}
			
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}finally {
			File f=new File(upPath, fileName);
			if(f.exists() && f.canRead()) {
				f.delete();
			}
		}
		
		return list;
	}
	
	private String getFilePath(HttpServletRequest request) {
		//업로드할 경로 구하기
		String path="";
		
		String type=props.getProperty("file.upload.type");
		
		
		if(type.equals("test")) {  //테스트 경로
			path=props.getProperty("file.upload.path.test");
		}else { //배포시 실제 경로
			String upDir=props.getProperty("file.upload.path");
			path
			=request.getSession().getServletContext().getRealPath(upDir);
			
			//config.getServletContext().getRealPath(upDir);
		}
		
		
		return path;
	}

	private String getUniqueFileName(String originFileName) {
		//파일명에 현재시간(년월일시분초밀리초)을 붙여서 파일명 변경
		//abc.txt => abc20191224120350123.txt
		int idx=originFileName.lastIndexOf(".");
		String fName=originFileName.substring(0, idx); //abc
		String ext = originFileName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time=sdf.format(d);
		
		String fileName=fName+time+ext;
		
		
		return fileName;
	}
	
	private String getExt(String originFileName) {
		int idx=originFileName.lastIndexOf(".");
		String ext = originFileName.substring(idx);
		
		return ext;
	}

	@Override
	public int insertSido(AreaSidoVO areaSidoVo) {
		return excelDao.insertSido(areaSidoVo);
	}

	@Override
	public int insertGugun(AreaGugunVO areaGugunVo) {
		return excelDao.insertGugun(areaGugunVo);
	}
	
}
