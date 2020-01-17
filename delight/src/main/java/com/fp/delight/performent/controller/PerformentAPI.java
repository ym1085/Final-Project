package com.fp.delight.performent.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.json.XML;

public class PerformentAPI {
	public final int INDENT_FACTOR=4;
	
	public Map<String, Object> performDetail(String perfomid){
		String detail="http://www.kopis.or.kr/openApi/restful/pblprfr/"
				+ perfomid
				+ "?"
				+ "service=9382c5404b3046389912b28accd9b214";
		
		System.out.println("detail api주소="+detail);
		
		Map<String, Object> map=null;
		try {
		HttpURLConnection urlcon=(HttpURLConnection) new URL(detail).openConnection();

		urlcon.connect();
		BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		JSONObject obj=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
		System.out.println(obj.toMap());
		
		ObjectMapper mapper = new ObjectMapper();
		
		map=mapper.readValue(obj.toString(), new TypeReference<Map<String,Object>>() {});
		
		System.out.println(map.toString());
		
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return map;
	}
	   
	   //페이지 새는 메서드(예시)
	   /*public static int pageCount() throws MalformedURLException, IOException {
	      int cnt=0;
	      int cpa=1;

	      int length=1;

	      while(length==1){
	         String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr?"
	               + "service=4c8aebff91d74e2396fccc287989884a"
	               + "&stdate=20200110&eddate=20200110&rows=10&signgucode=42&signgucodesub=4211&cpage="+cpa;
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
	         if(st.toString().length()>44) {
	            Object xm=new JSONTokener(xmlJSONObj.getJSONObject("dbs").toString()).nextValue();

	            if(xm instanceof JSONObject) {
	               JSONObject json=xmlJSONObj.getJSONObject("dbs");
	               if(json.length()>0) {
	                  cnt++;
	                  cpa++;
	                  System.out.println(cnt+"페이지 카운트 샜음");
	               }else {
	                  length=0;
	               }
	            }else if(xm instanceof JSONArray) {
	               JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");

	               int len=jsonarr.length();
	               if(len>0) {
	                  cnt++;
	                  cpa++;   
	                  System.out.println(cnt+"페이지 카운트 샜음");
	               }
	            }
	         }else {
	            length=0;
	         }
	      }//while
	      return cnt;
	   }*/
	   
	}
	
