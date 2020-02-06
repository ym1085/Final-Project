package com.fp.delight.api;

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

public class ApiTest_reservation {
	
	public Map<String, Object> receiveAPI(String mt20id) 
			throws MalformedURLException, IOException{
		
	String detail="http://www.kopis.or.kr/openApi/restful/pblprfr/"
			+ mt20id
			+ "?"
			+ "service=8ed6ff2c63da4f9fae5108fdc9bfcd02";
	
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
	
}//class

