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
public class ApiTest3_ranking {
	public static int INDENT_FACTOR = 4;

	public List<PerformentBoxOfficeVO> rankingAPI(String ststype, String date, String catecode, String area) throws MalformedURLException, IOException {   		   
		//date의 파라미터는 컨트롤러에서 생성하여 받아옴.
		
		//아래 파라미터 date2는 해당 날짜의 데이터가 없을 때 사용
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -2);
		String date2=sdf.format(cal.getTime());
		
		List<PerformentBoxOfficeVO> rlist=null;
	
			//컨트롤러에서 가져온 날짜를 사용 
			String url = "http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27"
							+"&ststype="+ststype +"&date="+date +"&catecode="+catecode +"&area="+area;			
			
			//API 자체적으로 생성한 날짜를 사용
			String url2 = "http://kopis.or.kr/openApi/restful/boxoffice?service=607d00f7f3574532b4fd3c970ebb4f27"
							+"&ststype="+ststype +"&date="+date2 +"&catecode="+catecode +"&area="+area;				
			
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
			
			//해당 API에 호출 된 데이터
			System.out.println(xmlJSONObj);
			System.out.println(xmlJSONObj.length());
			System.out.println(st.toString().length());
			
			//해당 API의 데이터 판별
			if(st.toString().length()>47) {
				Object xm=xmlJSONObj.getJSONObject("boxofs").get("boxof");
				if(xm instanceof JSONObject || xm instanceof JSONArray) {
					JSONArray jsonarr=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");						
					rlist=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
				}
				
			}else {			
			
				System.out.println("=== '오늘'날짜에 해당되는 자료가 없을 시 실행===");
				
				urlcon=(HttpURLConnection) new URL(url2).openConnection();
				System.out.println(url);
				urlcon.connect();
				bis = new BufferedInputStream(urlcon.getInputStream());
				reader = new BufferedReader(new InputStreamReader(bis));
				st = new StringBuffer();
				line="";
		      
				while ((line = reader.readLine()) != null) {
					st.append(line);
				}
		      
				xmlJSONObj = XML.toJSONObject(st.toString());
				System.out.println(xmlJSONObj);
				System.out.println(xmlJSONObj.length());
				System.out.println(st.toString().length());
				mapper = new ObjectMapper();
				
				if(st.toString().length()>47) {
					Object xm=xmlJSONObj.getJSONObject("boxofs").get("boxof");
					if(xm instanceof JSONObject || xm instanceof JSONArray) {
						JSONArray jsonarr2=xmlJSONObj.getJSONObject("boxofs").getJSONArray("boxof");						
						rlist=mapper.readValue(jsonarr2.toString(), new TypeReference<List<PerformentBoxOfficeVO>>() {});
					}
				}
			}
			//디버깅. 예매상황판 API에서는 리스트 제한을 둘 수 없어 강제적으로 5에 고정
			for(int i=0;i<5;i++) {
				PerformentBoxOfficeVO vo=rlist.get(i);
				System.out.println("공연 id="+vo.getMt20id());
			}
			
		return rlist;
	}
}
