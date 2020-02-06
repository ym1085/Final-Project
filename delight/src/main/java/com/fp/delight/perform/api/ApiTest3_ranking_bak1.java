package com.fp.delight.perform.api;

import java.util.Calendar;
import java.util.List;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

import com.fp.delight.performent.model.PerformentBoxOfficeVO;
import com.fp.delight.performent.model.PerformentListVO;

//랭킹 페이지
public class ApiTest3_ranking_bak1 {
	public static int INDENT_FACTOR = 4;

	public List<PerformentBoxOfficeVO> rankingAPI(String ststype, String date, String catecode, String area) 
			   																	throws JSONException, MalformedURLException, IOException{   		   
		//date의 파라미터는 컨트롤러에서 생성하여 받아옴.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String date2=sdf.format(cal.getTime());
		
		List<PerformentBoxOfficeVO> rlist=null;
		   
		String url = "http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27"
						+"&ststype="+ststype +"&date="+date  +"&catecode="+catecode +"&area="+area;
						
		HttpURLConnection urlcon=(HttpURLConnection) new URL(url).openConnection();
		System.out.println(url);
		urlcon.connect();
		BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
      
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}
      
		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		ObjectMapper mapper = new ObjectMapper();

		if(st.toString().length()>44) {
			Object xm=xmlJSONObj.getJSONObject("boxofs").get("boxof");
			if(xm instanceof JSONArray || xm instanceof JSONObject) {
				JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");						
				rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
			}else{
				
							
			}
		}
		
		for(int i=0;i<5;i++) {
			PerformentBoxOfficeVO vo=rlist.get(i);
			System.out.println("공연 id="+vo.getMt20id());
	    }
		return rlist;
	}
}

		
/*

	///1
  public List<PerformentBoxOfficeVO> rankingAPI(String ststype, String date, String catecode, String area) throws JSONException, MalformedURLException, IOException{   
		   				
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -1);
			date=sdf.format(cal.getTime());
		
			String url="http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27" 
				   		+"&ststype="+ststype +"&date="+date +"&catecode="+catecode +"&area="+area;
		   
			HttpURLConnection urlcon=(HttpURLConnection) new URL(url).openConnection();
			System.out.println(url);
			urlcon.connect();
			BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
			BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
			StringBuffer st = new StringBuffer();
			String line;
			while ((line = reader.readLine()) != null) {
				st.append(line);
			}
		   
		 
			JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
			JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");	
			System.out.println("jasonarr="+jsonarr);	
		 
		 	
			if(xmlJSONObj.getJSONObject("boxofs")!=xmlJSONObj||jsonarr==null||xmlJSONObj==null) {			   
			   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			   Calendar cal = Calendar.getInstance();
			   cal.add(Calendar.DATE, -2);
			   date=sdf.format(cal.getTime());
				
			   url="http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27" 
				 		+"&ststype="+ststype +"&date="+date +"&catecode="+catecode +"&area="+area;
				   
			   urlcon=(HttpURLConnection) new URL(url).openConnection();
			   System.out.println(url);
			   urlcon.connect();
			   bis = new BufferedInputStream(urlcon.getInputStream());
			   reader = new BufferedReader(new InputStreamReader(bis));
			   st = new StringBuffer();
			 
			   while ((line = reader.readLine()) != null) {
				  st.append(line);
			   }  
			   xmlJSONObj = XML.toJSONObject(st.toString());
			   jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");
			   System.out.println("jasonarr="+jsonarr);
			
	     		ObjectMapper mapper = new ObjectMapper();
	
				List<PerformentBoxOfficeVO> rlist=null;
				rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
		      
				//디버깅. 예매상황판 API에서는 무조건 목록 20개를 불러오므로 디버깅5개로 강제.
				for(int i=0;i<5;i++) {
					PerformentBoxOfficeVO vo=rlist.get(i);
					System.out.println("공연 id="+vo.getMt20id());
				}		      	
				return rlist;
	   		}
	   	}
	   	
	   	
	   	///2
	   		public List<PerformentBoxOfficeVO> rankingAPI(String ststype, String date, String catecode, String area) 
			   																	throws JSONException, MalformedURLException, IOException{   		   
		   //
		   // date의 파라미터는 컨트롤러에서 생성하여 받아옴.
		   //	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		   //	Calendar cal = Calendar.getInstance();
		   //	cal.add(Calendar.DATE, -1);
		   //	date=sdf.format(cal.getTime());
		   
	   
		List<PerformentBoxOfficeVO> rlist=null;
		   
		String url = "http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27"
						+"&ststype="+ststype +"&date="+date  +"&catecode="+catecode +"&area="+area;
						
		HttpURLConnection urlcon=(HttpURLConnection) new URL(url).openConnection();
		System.out.println(url);
		urlcon.connect();
		BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
      
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}
      
		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		ObjectMapper mapper = new ObjectMapper();

		if(st.toString().length()>44) {
			Object xm=xmlJSONObj.getJSONObject("boxofs").get("boxof");
			if(xm instanceof JSONArray|| xm instanceof JSONObject) {
				JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");						
				rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
			}else if(xm instanceof JSONObject) {
				JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");											
				rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
			}
		}
		
		for(int i=0;i<5;i++) {
			PerformentBoxOfficeVO vo=rlist.get(i);
			System.out.println("공연 id="+vo.getMt20id());
	    }
		return rlist;
	}
}
	   	
	   //원본
	   	public class ApiTest3_ranking {
	   public static int INDENT_FACTOR = 4;

	   public List<PerformentBoxOfficeVO> rankingAPI(String ststype, String date, String catecode, String area) throws MalformedURLException, IOException{   

		   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		   Calendar cal = Calendar.getInstance();
		   cal.add(Calendar.DATE, -1);
		   date=sdf.format(cal.getTime());
		   
		   String url = "http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27"
							+"&ststype="+ststype
							+"&date="+date 
							+"&catecode="+catecode
							+"&area="+area;
						
		      HttpURLConnection urlcon=(HttpURLConnection) new URL(url).openConnection();
		      System.out.println(url);
		      urlcon.connect();
		      BufferedInputStream bis = new BufferedInputStream(urlcon.getInputStream());
		      BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		      StringBuffer st = new StringBuffer();
		      String line;
		      while ((line = reader.readLine()) != null) {
		         st.append(line);
		      }
	
		      JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		      JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");

		      ObjectMapper mapper = new ObjectMapper();
	
		      List<PerformentBoxOfficeVO> rlist=null;
		      rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
		      for(int i=0;i<5;i++) {
		         PerformentBoxOfficeVO vo=rlist.get(i);
		         System.out.println("공연 id="+vo.getMt20id());
		      }
		      	
			return rlist;
	   }
}
*/