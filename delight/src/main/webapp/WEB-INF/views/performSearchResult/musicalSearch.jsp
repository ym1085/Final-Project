<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<%@ include file="../inc/main2Top.jsp" %>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e1e75cc358623a9f08ba62d55286068"></script> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">
<style type="text/css">
   .top1 {height: 450px;padding: 30px;width: 75%;margin: 30px;}
   .top2 {height: 100%;width: 400px;float: left;margin-left: 15px;}
   .top1>img {height: 100%;width: 250px;float: left;}
   .top2>div{border: 1px solid #dfd5d5;width:10px;height:50px;margin-right: 5px;}
   .top2>label {padding-left: 15px;line-height: 1.7em;padding-right: 30px;font-family: 맑은고딕;color:#000;}
   /* 수정된부분/예진/ */ 
   #perfomrtitleFromMain {text-align: center;font-family: 맑은고딕;font-weight: bold;margin-top: 25px;width: 94%;
   							/* border-bottom: 1px solid lightgray; */padding-bottom: 24px; margin-top: 50px;}
   .type{margin-left:27px;}
   span{color:#000;}
   #home{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #home>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #like{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #like>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #likecount{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;}
   #likecount>div{z-index:-1;text-align: center;line-height: 3.5em; font-weight: 600;}
   div#refundInfo {float: left;width: 140px;height: 63px;z-index:1;margin-top: 115px;}
  /*div#calandar {width: 420px;height: 389px;position: absolute;top: 162px;left: 1045px; border:1px solid #efe7e7;} /* 수정필요 */ 
   #refundInfo>a>img{z-index:-1;margin: 10px 0px 0px 5px;}
   #refundInfosub{font-size: 13px;font-weight: 400;}
   .body{height:100%; padding:30px;width:75%;margin:30px;border-top: 0.7px dotted gray;}
   .section {width:70%;height:100%;float:left; padding: 5px 5px 5px 5px;}
   .aside{width:25%;height:90%; border: 1px solid #efe7e7;float:left;margin-left:50px;padding: 5px 5px 5px 5px;}
   img.imgbox {margin: 10px 10px 10px 40px;}
   span.util {padding-left: 60px;font-weight:400;}
   
   ul{list-style:none;}
   .tabmenu{width:100%; margin: 0 auto; position:relative; }
   .tabmenu ul li{display:inline-block;width:25%; float:left;  text-align:center; background:#f2f4f7;line-height:40px;}
   .tabmenu label{display:block;width:100%; height:40px;line-height:40px;font-weight: 400;}
   .tabmenu input{display:none;}
   .tabCon{display:none; text-align:left; padding: 20px;position:absolute; left:0; top:40px; box-sizing:border-box;}
   div#tabConOne>div{margin-top:20px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}
   div#tabConTwo>div{margin-top:20px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}

    .tabmenu input:checked ~ label{background:white;border: 0.2px solid #efe7e7; border-bottom: none;} 
   .tabmenu input:checked ~ .tabCon{display:block;border-top: 0.2px solid #efe7e7;}
   
   /* 포스터 이미지 */
   .testImg{
   	text-align: center;
   	float: left;
   	margin-left: 20px;
   	margin-right: 20px;
   	margin-top: 20px;
   	margin-bottom: 20px;
   }
}
</style>

<script type="text/javascript" src="<c:url value ='/resources/js/jquery-3.4.1.min.js'/>"></script>
 
   <!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="#welcome" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
         </div>
         
         <nav class="left-nav" style="margin-top: 100%;">
            <ul id="nav">
               <li class="active"><a href="#">랭킹</a></li>
               <li><a href="<c:url value='/performSearchResult/theaterSearch.do?type=AAAA'/>">연극</a></li>
               <li><a href="<c:url value='/performSearchResult/musicalSearch.do?type=AAAB'/>">뮤지컬</a></li>
               <li><a href="<c:url value='/performSearchResult/areaSearch.do'/>">지역별</a></li>
               <li><a href="<c:url value='/performSearchResult/periodSearch.do'/>">기간별</a></li>
               <li>
               <div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
   
     
   <!--메인에서 검색하면 검색결과페이지로 이동,  -예진- -->
   <div style="width: 87%;float: right;" class="pfdetail">
   		<div id="perfomrtitleFromMain">
   			<form action="<c:url value="/performSearchResult/musicalDetail_Search.do"/>" method="post">
   			
			<%-- <c:import url="../inc/inc_area.do"></c:import>&nbsp;&nbsp;&nbsp; --%>
			
			<span>시작일</span>
			<input type="text" id="stdate" name="stdate" value="${param.stdate }"
				style="width:100px;height:40px;font-size:15px;" required="required">
			 
			<span>종료일</span>
			<input type="text" id="eddate" name="eddate" value="${param.eddate }"
				style="width:100px;height:40px;font-size:15px;" required="required">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span>공연명</span>
			<input type="text" id="perfomName" name="perfomName" value="${param.perfomName }"
				style="width:150px;height:40px;font-size:15px;">
				
			<input id="pSearch" name="pSearch" type="submit" class="btn_1" value="검색"><br>
			
			</form>	
   		</div>  		
   </div>
     
      <div style="width: 87%;float: right;" class="pfdetail">
	      <!-- 메인1에서 공연명 검색하면 API 뿌려주기 -예진- -->
		   <div class="API">		   
		   	<c:forEach var = "vo" items="${alist }">    
				<%-- <c:if test="${vo.genrenm == '연극' || vo.genrenm == '뮤지컬'}">  --%>     	
					<div class = "testImg">
				    	<img src="${vo.poster }" class="img-responsive" width="240px" height="240px">
				        	<br>
				            <h5><b>${vo.prfnm }</b></h5> 
							<p>${vo.prfpdfrom }</p> 
							<p>${vo.prfpdto }</p>
							<p>${vo.fcltynm }</p>  
							<p>${vo.genrenm }</p> 
				    </div>	    
				<%-- </c:if>   --%>       	          	
			</c:forEach>	 
		   </div>
	   </div>
	   <!-- 페이지 만들떄마다 복붙 -->
	   <!-- div안에서작업 그외엔 건들지말것 -->
	   
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>" ></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript">

	
	$("#stdate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	
	$("#eddate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	

</script>	
	   
     
   
   <%@ include file="../inc/main2Bottom.jsp" %>