package com.fp.delight.excel.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Color;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.delight.ann.model.FAQVO;
import com.fp.delight.member.model.MemberVO;

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
			path=props.getProperty("excel.upload.path.test");
		}else { //배포시 실제 경로
			String upDir=props.getProperty("excel.upload.path");
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

	@Override
	public SXSSFWorkbook makeExcelDown(List<MemberVO> list) {
		SXSSFWorkbook workbook=new SXSSFWorkbook();
		
		SXSSFSheet sheet=workbook.createSheet("회원목록");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		CellStyle cellStyle=workbook.createCellStyle();
		cellStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 4000);
        sheet.setColumnWidth(1, 4000);
        sheet.setColumnWidth(2, 4000);
        sheet.setColumnWidth(3, 4000);
        sheet.setColumnWidth(4, 4000);
        sheet.setColumnWidth(5, 4000);
        sheet.setColumnWidth(6, 4000);
        sheet.setColumnWidth(7, 4000);
        sheet.setColumnWidth(8, 4000);
        sheet.setColumnWidth(9, 4000);
        sheet.setColumnWidth(10, 6000);
        sheet.setColumnWidth(11, 4000);
        sheet.setColumnWidth(12, 4000);
        sheet.setColumnWidth(13, 4000);
        sheet.setColumnWidth(14, 4000);
        sheet.setColumnWidth(15, 4000);
        sheet.setColumnWidth(16, 4000);
        sheet.setColumnWidth(17, 4000);
        sheet.setColumnWidth(18, 4000);
        sheet.setColumnWidth(19, 4000);
        sheet.setColumnWidth(20, 4000);
        sheet.setColumnWidth(21, 4000);
        sheet.setColumnWidth(22, 4000);
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("아이디");
        
        headerCell = headerRow.createCell(1);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("이름");
        
        headerCell = headerRow.createCell(2);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("비밀번호");
        
        headerCell = headerRow.createCell(3);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("생년월일");
        
        headerCell = headerRow.createCell(4);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("이메일1");
        
        headerCell = headerRow.createCell(5);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("이메일2");
        
        headerCell = headerRow.createCell(6);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("휴대폰1");
        
        headerCell = headerRow.createCell(7);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("휴대폰2");
        
        headerCell = headerRow.createCell(8);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("휴대폰3");
        
        headerCell = headerRow.createCell(9);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("우편번호");
        
        headerCell = headerRow.createCell(10);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("주소");
        
        headerCell = headerRow.createCell(11);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("상세주소");
        
        headerCell = headerRow.createCell(12);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("성별");
        
        headerCell = headerRow.createCell(13);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("메일 수신 여부");
        
        headerCell = headerRow.createCell(14);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("메일 인증 여부");
        
        headerCell = headerRow.createCell(15);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("마일리지");
        
        headerCell = headerRow.createCell(16);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("로그아웃일자");
        
        headerCell = headerRow.createCell(17);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("가입일");
        
        headerCell = headerRow.createCell(18);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("탈퇴일");
        
        headerCell = headerRow.createCell(19);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("SALT");
        
        headerCell = headerRow.createCell(20);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("탈퇴이유번호");
        
        headerCell = headerRow.createCell(21);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("등급번호");
        
        headerCell = headerRow.createCell(22);
        headerCell.setCellStyle(cellStyle);
        headerCell.setCellValue("등급이름");
        
        // 과일표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            MemberVO vo=list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.getUserid());
            
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(vo.getUsername());
            
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getPassword());
            
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.getBirth());
            
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.getEmail1());
            
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.getEmail2());
            
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.getHp1());
            
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(vo.getHp2());
            
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(vo.getHp3());
            
            bodyCell = bodyRow.createCell(9);
            bodyCell.setCellValue(vo.getZipcode());
            
            bodyCell = bodyRow.createCell(10);
            bodyCell.setCellValue(vo.getAddress());
            
            bodyCell = bodyRow.createCell(11);
            bodyCell.setCellValue(vo.getAddressDetail());
            
            bodyCell = bodyRow.createCell(12);
            bodyCell.setCellValue(vo.getGender());
            
            bodyCell = bodyRow.createCell(13);
            bodyCell.setCellValue(vo.getMailAgreement());
            
            bodyCell = bodyRow.createCell(14);
            bodyCell.setCellValue(vo.getMailAuthen());
            
            bodyCell = bodyRow.createCell(15);
            bodyCell.setCellValue(vo.getMileagePoint());
            
            bodyCell = bodyRow.createCell(16);
            String logout="";
            if(vo.getLogoutDate()!=null &&!vo.getJoinDate().equals("")) {
            	logout=sdf.format(vo.getLogoutDate());
            }
            bodyCell.setCellValue(logout);
            
            bodyCell = bodyRow.createCell(17);
            String joindate="";
            if(vo.getJoinDate()!=null&&!vo.getJoinDate().equals("")) {
            	joindate=sdf.format(vo.getJoinDate());
            }
            bodyCell.setCellValue(joindate);
            
            bodyCell = bodyRow.createCell(18);
            String outdate="";
            if(vo.getOutDate()!=null && !vo.getOutDate().equals("")) {
            	outdate=sdf.format(vo.getOutDate());
            }
            bodyCell.setCellValue(outdate);
            
            bodyCell = bodyRow.createCell(19);
            bodyCell.setCellValue(vo.getSALT());
            
            bodyCell = bodyRow.createCell(20);
            bodyCell.setCellValue(vo.getOutReasonNo());
            
            bodyCell = bodyRow.createCell(21);
            bodyCell.setCellValue(vo.getGradeSeq());
            
            bodyCell = bodyRow.createCell(22);
            bodyCell.setCellValue(vo.getGradeName());
        }
        
        return workbook;
	}

	@Override
	public List<FAQVO> excelFAQ(MultipartFile file, HttpServletRequest request,HttpSession session) {
		List<FAQVO> list=new ArrayList<FAQVO>();
		String originFileName=file.getOriginalFilename();
		String fileName=getUniqueFileName(originFileName);
		String upPath=getFilePath(request);
		String userid=(String) session.getAttribute("adminUserid");
		try {
			File f=new File(upPath, fileName);
			file.transferTo(f);
			
			String ext=getExt(originFileName);
			System.out.println("확장자명 = "+ext);
			if(ext.equals(".xlsx")) {
				XSSFWorkbook wb=new XSSFWorkbook(f);
				XSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					FAQVO vo=new FAQVO();
					XSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					
					XSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setFaqTitle(cell.getStringCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setFaqContent(cell.getStringCellValue());
					cell=row.getCell(2);
					if(cell!=null)vo.setFaqType(cell.getStringCellValue());
					vo.setUserid(userid);
					list.add(vo);
				}
			}else {
				HSSFWorkbook wb=new HSSFWorkbook(new FileInputStream(f));
				HSSFSheet sheet=wb.getSheetAt(0);
				for(int i=0;i<sheet.getLastRowNum()+1;i++) {
					FAQVO vo=new FAQVO();
					HSSFRow row=sheet.getRow(i);
					if(row==null) {
						continue;
					}
					HSSFCell cell=row.getCell(0);
					if(cell!=null)vo.setFaqTitle(cell.getStringCellValue());
					cell=row.getCell(1);
					if(cell!=null)vo.setFaqContent(cell.getStringCellValue());
					cell=row.getCell(2);
					if(cell!=null)vo.setFaqType(cell.getStringCellValue());
					vo.setUserid(userid);
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
	
}
