package com.fp.delight.api;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.fp.delight.performent.model.PerformentListVO;

//메인1에서 지역명 검색 했을 때 상세페이지로 넘어가서 API 뿌려주는 소스 -예진-
public class ApiTest_arSearch {
	public int INDENT_FACTOR = 4;
	
	public List<PerformentListVO> receiveAPI(String sido, String gugun) 
			   throws MalformedURLException, IOException{
		
		//14일 전 날짜 변수선언
		String minus = null;
		  
		//7일 후 날짜 변수 선언
		String plus = null;
		  
		//현재 날짜 생성
		Date date = new Date();
		  
		//포멧변경(년월일)
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyyMMdd");
		  
		//캘린더 생성
		Calendar cal = Calendar.getInstance();
		  
		//캘린더에 오늘날짜 저장
		cal.setTime(date);
		  
		//현재날짜로부터 14일 전 날짜 구하고 저장
		cal.add(Calendar.DATE, -14);	  
		minus = timeformat.format(cal.getTime());
		  
		//현재날짜로부터 7일 후 날짜 구하고 저장
		cal.add(Calendar.DATE, 7);
		plus = timeformat.format(cal.getTime());
		
		//API 공공데이터 URL 설정
		String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr?"
		            + "service=4c8aebff91d74e2396fccc287989884a"
		            + "&stdate="+minus
		            + "&eddate="+plus
		            + "&cpage=1"
		            + "&signgucode="+sido
		            + "&signgucodesub="+gugun
		            + "&rows=20";
		
		  Map<String, Object> map=new HashMap<String, Object>();
	      List<PerformentListVO> list2=new ArrayList<PerformentListVO>();
		  
		  //URL 연결
	      HttpURLConnection urlcon=(HttpURLConnection) new URL(apiurl).openConnection();
	      
	      urlcon.connect();
	      BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
	        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
	        StringBuffer st = new StringBuffer();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            st.append(line);
	        }
	 
	        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
	        //String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
	        
	        int pageCount=0;
	        ObjectMapper mapper = new ObjectMapper();
	        if(st.toString().length()>44) {
	            Object xm=xmlJSONObj.getJSONObject("dbs").get("db");
	            if(xm instanceof JSONArray) {
	               JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");
	               if(pageCount==0) {
	                  //pageCount=pageCount(sido, gugun);
	               }
	               list2=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentListVO>>() {});
	               map.put("list", list2);
	               map.put("pageCount", pageCount);
	            }else if(xm instanceof JSONObject) {
	               JSONObject json=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
	               list2.add((PerformentListVO) mapper.readValue(json.toString(), new TypeReference<PerformentListVO>() {}));
	               if(pageCount==0) {
	               //   pageCount=pageCount(sido, gugun);
	               }
	               map.put("list", list2);
	               map.put("pageCount", pageCount);
	            }
	         }
	       
        
	        //디버깅
	        for(int i=0;i<list2.size();i++) {
	           PerformentListVO vo=list2.get(i);
	           System.out.println("공연 id="+vo.getMt20id());
	        }
	        
	        //Controller
	        return list2;
	   }
	
	
	}//class
