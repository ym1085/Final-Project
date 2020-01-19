package com.fp.delight.performent.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.codehaus.jackson.type.TypeReference;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.fp.delight.performent.model.PerformentListVO;

public class PerformentAPIPoster {
   public Map<String , Object> performDetailPoster(String perfomid)  {
      String detail="http://www.kopis.or.kr/openApi/restful/pblprfr/"
				+ perfomid
				+ "?"
				+ "service=9382c5404b3046389912b28accd9b214";
      System.out.println(detail);
      Map<String, Object> list2 = new HashMap<String, Object>();
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
      Object obj=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
      ObjectMapper mapper = new ObjectMapper();
      
      if(obj instanceof JSONArray) {
			JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");
			
			list2.put("imgstrArr", mapper.readValue(jsonarr.toString(), new TypeReference<List<String>>() {}));
			list2.put("imgstr", null);
			
      }else if(obj instanceof JSONObject) {
			JSONObject json=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
			
			list2.put("imgstr", mapper.readValue(json.toString(), new TypeReference<String>() {}));
			list2.put("imgstrArr", null);
      }else {
    	  list2.put("imgstrArr", null);
    	  list2.put("imgstr", null);
      }
      	
      }catch(MalformedURLException e) {
    	  e.printStackTrace();
      }catch(IOException e) {
    	  e.printStackTrace();
      }
      return list2;
      
      
      
 

      
   }
}