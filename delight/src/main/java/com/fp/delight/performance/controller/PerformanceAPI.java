package com.fp.delight.performance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.fp.delight.performance.model.PerformanceDetailDTO;
import com.fp.delight.performance.model.PerformanceListDTO;
import com.fp.delight.performance.model.PerformanceTheaterDetailDTO;


public class PerformanceAPI {
	
	// tag값의 정보를 가져오는 메소드
	public String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}

	public List<PerformanceListDTO> listAPI() {
		int page = 1;	// 페이지 초기값 
		List<PerformanceListDTO> alist = new ArrayList<PerformanceListDTO>();

		try{
			while(true){
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=607d00f7f3574532b4fd3c970ebb4f27&stdate=20190101&eddate=20200111&rows=15&prfstate=02&signgucode=11&signgucodesub=1111&kidstate=Y&cpage="+page;
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("db");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){

						Element eElement = (Element) nNode;
			
						PerformanceListDTO dto = new PerformanceListDTO();
						
						dto.setMt20id(getTagValue("mt20id", eElement));			//공연ID
						dto.setPrfnm(getTagValue("prfnm", eElement));			//공연명
						dto.setPrfpdfrom(getTagValue("prfpdfrom", eElement));	//공연시작일
						dto.setPrfpdto(getTagValue("prfpdto", eElement));		//공연종료일
						dto.setFcltynm(getTagValue("fcltynm", eElement));		//공연시설명
						dto.setPoster(getTagValue("poster", eElement));			//포스터 이미지 경로명
						dto.setGenrenm(getTagValue("genrenm", eElement));		//공연 장르명
						dto.setPrfstate(getTagValue("prfstate", eElement));		//공연상태
						dto.setOpenrun(getTagValue("openrun", eElement));		//오픈런
						
						alist.add(dto);						
					}// for end
				}// if end
				
				//페이지수 증가 1,2,3,4,5,6...
				page += 1;
				
				if(page > 30){	
					break;
				}
			}	
		} catch (Exception e){	
			e.printStackTrace();
		}
		return alist;		
	}
	

	public List<PerformanceListDTO> listdateAPI(String stdate, String eddate) {
		int page = 1;	// 페이지 초기값 
		List<PerformanceListDTO> aalist = new ArrayList<PerformanceListDTO>();
		
		try{
			while(true){
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=607d00f7f3574532b4fd3c970ebb4f27&stdate="+stdate+"&eddate="+eddate+"&rows=30&prfstate=02&signgucode=11&signgucodesub=1111&kidstate=Y&cpage="+page;
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("db");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){

						Element eElement = (Element) nNode;
			
						PerformanceListDTO dto = new PerformanceListDTO();
						
						dto.setMt20id(getTagValue("mt20id", eElement));			//공연ID
						dto.setPrfnm(getTagValue("prfnm", eElement));			//공연명
						dto.setPrfpdfrom(getTagValue("prfpdfrom", eElement));	//공연시작일
						dto.setPrfpdto(getTagValue("prfpdto", eElement));		//공연종료일
						dto.setFcltynm(getTagValue("fcltynm", eElement));		//공연시설명
						dto.setPoster(getTagValue("poster", eElement));			//포스터 이미지 경로명
						dto.setGenrenm(getTagValue("genrenm", eElement));		//공연 장르명
						dto.setPrfstate(getTagValue("prfstate", eElement));		//공연상태
						dto.setOpenrun(getTagValue("openrun", eElement));		//오픈런
						
						aalist.add(dto);						
					}// for end
				}// if end
				
				//페이지수 증가 1,2,3,4,5,6...
				page += 1;
				
				if(page > 30){	
					break;
				}
			}	
		} catch (Exception e){	
			e.printStackTrace();
		}
		return aalist;		
	}


	public List<PerformanceDetailDTO> detailAPI(String mt20id) {
		List<PerformanceDetailDTO> blist = new ArrayList<PerformanceDetailDTO>();
		
		try{
				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+mt20id+"?service=607d00f7f3574532b4fd3c970ebb4f27";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("db");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){

						Element eElement = (Element) nNode;
			
						PerformanceDetailDTO dto = new PerformanceDetailDTO();

						
						dto.setMt20id(getTagValue("mt20id", eElement));			//공연ID
						dto.setMt10id(getTagValue("mt10id", eElement));			//공연시설ID
						dto.setPrfnm(getTagValue("prfnm", eElement));			//공연명
						dto.setPrfpdfrom(getTagValue("prfpdfrom", eElement));	//공연시작일
						dto.setPrfpdto(getTagValue("prfpdto", eElement));		//공연종료일
						dto.setFcltynm(getTagValue("fcltynm", eElement));		//공연시설명
						dto.setPrfcast(getTagValue("prfcast", eElement));		//공연출연진
						dto.setPrfcrew(getTagValue("prfcrew", eElement));		//공연제작진
						dto.setPrfruntime(getTagValue("prfruntime", eElement)); //상영시간
						dto.setPrfage(getTagValue("prfage", eElement));			//공연등급
						dto.setEntrpsnm(getTagValue("entrpsnm", eElement));		//제작사
						dto.setPcseguidance(getTagValue("pcseguidance", eElement));  //티켓가격
						dto.setPoster(getTagValue("poster", eElement));			//포스터 이미지 경로명
						dto.setSty(getTagValue("sty",eElement));				//줄거리
						dto.setGenrenm(getTagValue("genrenm", eElement));		//공연 장르명
						dto.setPrfstate(getTagValue("prfstate", eElement));		//공연상태
						dto.setOpenrun(getTagValue("openrun", eElement));		//오픈런
						dto.setStyurls(getTagValue("styurls",eElement)); 		//소개이미지 목록
						dto.setStyurl(getTagValue("styurl",eElement)); //소개이미지, 다수
						dto.setDtguidance(getTagValue("dtguidance",eElement));	//공연시간
						blist.add(dto);
						
					}
				}
		} catch (Exception e){	
			e.printStackTrace();
		}
		return blist;		
	}
	
	public List<PerformanceTheaterDetailDTO> TheaterdetailAPI(String mt10id) {
		List<PerformanceTheaterDetailDTO> clist = new ArrayList<PerformanceTheaterDetailDTO>();
		
		try{
				String url = "http://www.kopis.or.kr/openApi/restful/prfplc/"+mt10id+"?service=607d00f7f3574532b4fd3c970ebb4f27";
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				// root tag 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("db");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){

						Element eElement = (Element) nNode;
			
						PerformanceTheaterDetailDTO dto = new PerformanceTheaterDetailDTO();

						dto.setFcltynm(getTagValue("fcltynm", eElement));
						dto.setMt10id(getTagValue("mt10id", eElement));
						dto.setMt13cnt(getTagValue("mt13cnt", eElement));
						dto.setFcltychartr(getTagValue("fcltychartr", eElement));
						dto.setOpende(getTagValue("opende", eElement));
						dto.setTelno(getTagValue("telno", eElement));
						dto.setRelateurl(getTagValue("relateurl", eElement));
						dto.setAdres(getTagValue("adres", eElement));
						dto.setLa(getTagValue("la", eElement));
						dto.setLo(getTagValue("lo", eElement));
						
						clist.add(dto);
					}
				}
		} catch (Exception e){	
			e.printStackTrace();
		}
		return clist;		
	}
}