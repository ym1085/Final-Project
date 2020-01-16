package com.fp.delight.admin.perfom;

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

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.fp.delight.performent.model.PerformentListVO;

public class AdminPerfomAPI {

	public Map<String, Object> ticketSearch(String type, String sido,
			String gugun,String stdate, String eddate,String perfomName,
			String curPage){
		System.out.println("검색 시작");
		String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr?"
				+ "service=4c8aebff91d74e2396fccc287989884a"
				+ "&stdate="+stdate
				+ "&eddate="+eddate
				+ "&rows=10"
				+ "&signgucode="+sido
				+ "&signgucodesub="+gugun
				+ "&shcate="+type
				+ "&cpage="+curPage;
		Map<String, Object> map=new HashMap<String, Object>();
		List<PerformentListVO> list2=new ArrayList<PerformentListVO>();
		
		try {
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
			
			
			int pageCount=0;
			ObjectMapper mapper = new ObjectMapper();
			if(st.toString().length()>44) {
				Object xm=xmlJSONObj.getJSONObject("dbs").get("db");
				if(xm instanceof JSONArray) {
					JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");
					pageCount=pageCount(type, sido, gugun, stdate, eddate, perfomName);
					list2=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentListVO>>() {});
					map.put("list", list2);
					map.put("pageCount", pageCount);
				}else if(xm instanceof JSONObject) {
					JSONObject json=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
					list2.add((PerformentListVO) mapper.readValue(json.toString(), new TypeReference<PerformentListVO>() {}));
					pageCount=pageCount(type, sido, gugun, stdate, eddate, perfomName);
					map.put("list", list2);
					map.put("pageCount", pageCount);
				}
			}
			
			
		}catch(MalformedURLException e) {
			e.printStackTrace();
		}catch(IOException ea) {
			ea.printStackTrace();
		}
		return map;
		
	}

	//페이지 새는 메서드
	public int pageCount(String type, String sido,
			String gugun,String stdate, String eddate,String perfomName) throws MalformedURLException, IOException {
		System.out.println("카운트 시작");
		int cnt=0;
		int cpa=1;

		int length=1;

		while(length==1){
			String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr?"
					+ "service=4c8aebff91d74e2396fccc287989884a"
					+ "&stdate="+stdate
					+ "&eddate="+eddate
					+ "&rows=10"
					+ "&signgucode="+sido
					+ "&signgucodesub="+gugun
					+ "&shcate="+type
					+ "&cpage="+cpa;
			
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
				Object xm=xmlJSONObj.getJSONObject("dbs").get("db");

				if(xm instanceof JSONArray) {
					JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");
					System.out.println("jsonarray");
					int len=jsonarr.length();
					if(len>0) {
						cnt++;
						cpa++;	
						System.out.println(cnt+"페이지 카운트 샜음");
					}
				}else if(xm instanceof JSONObject) {
					System.out.println("jsonobject");
					JSONObject json=xmlJSONObj.getJSONObject("dbs");
					if(json.length()>0) {
						cnt++;
						cpa++;
						System.out.println(cnt+"페이지 카운트 샜음");
					}else {
						length=0;
					}
				}
			}else {
				length=0;
			}
		}//while
		return cnt;
	}
}
