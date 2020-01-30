package com.fp.delight.api.moreRead;
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


//메인1에서 날짜,공연명 검색 했을 때 상세페이지로 넘어가서 API 뿌려주는 소스 -예진-
public class ApiTest_pfSearchMore {
   public int INDENT_FACTOR = 4;
   
   public List<PerformentListVO> totalPMoreRead(String type, String sido, String gugun, 
		   String stdate, String eddate, String performName, int page) 
		   throws MalformedURLException, IOException{
	   
	  //공연명 검색할 때, 띄어쓰기 없애기
	  String name = performName;
	  String PerformName = name.replaceAll(" ", "");
	  
	  //페이지수 default값 지정
	  int Page = page;
	  Page = 0;
	  
	  Page  = Page+1;
	   	   
	  //1~20페이지까지 랜덤으로 값을 선택해서 상세페이지를 로딩 할 때마다, 다른 값을 뿌려준다
	  //난수 생성
	  //int randomValue;
	  /*randomValue = (int)(Math.random()*20 + 1);*/
	  
	  
	  //특정 공연명을 검색할 때는 페이지 수(난수)를 1로 설정한다
	  /*if(performName!=null && !performName.isEmpty()) {
		  randomValue=1;
	  }*/
	  
	  //API 공공데이터 URL 설정
	  String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr?"
	            + "service=4c8aebff91d74e2396fccc287989884a"
	            + "&stdate="+stdate
	            + "&eddate="+eddate
	            + "&cpage="+Page
	            + "&rows=30"
	            + "&shprfnm="+PerformName;
	  
	  
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
        String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
        
        int pageCount=0;
        ObjectMapper mapper = new ObjectMapper();
        if(st.toString().length()>44) {
            Object xm=xmlJSONObj.getJSONObject("dbs").get("db");
            if(xm instanceof JSONArray) {
               JSONArray jsonarr=xmlJSONObj.getJSONObject("dbs").getJSONArray("db");
               if(pageCount==0) {
                  //pageCount=pageCount(startDay, endDay, performName);
               }
               list2=mapper.readValue(jsonarr.toString(), new TypeReference<List<PerformentListVO>>() {});
               map.put("list", list2);     
            }else if(xm instanceof JSONObject) {
               JSONObject json=xmlJSONObj.getJSONObject("dbs").getJSONObject("db");
               list2.add((PerformentListVO) mapper.readValue(json.toString(), new TypeReference<PerformentListVO>() {}));
               if(pageCount==0) {
               //   pageCount=pageCount(startDay, endDay, performName);
               }
               map.put("list", list2);
              
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