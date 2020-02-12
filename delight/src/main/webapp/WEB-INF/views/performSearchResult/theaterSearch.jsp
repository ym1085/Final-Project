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
   .testImg {
	   	text-align: center;
	   	float: left;
	   	margin-left: 20px;
	   	margin-right: 20px;
	   	margin-top: 20px;
	   	margin-bottom: 20px;
   }
   
   /* 더보기버튼 */
   .btn_moreRead {
   		display: inline-block;
		padding: 13px 30px;
		border-radius: 0;
		font-size: 16px;
		color: #fff;
		text-transform: capitalize;
		-webkit-transition: 0.5s;
		transition: 0.5s;
		background-color: rgb(255, 0, 102);
		font-weight: 500;
   }
}
</style>

<script type="text/javascript" src="<c:url value ='/resources/js/jquery-3.4.1.min.js'/>"></script>
 
   <!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="<c:url value='/index.do'/>" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
         </div>
         
         <nav class="left-nav" style="margin-top: 100%;">
            <ul id="nav">
               <li class="active"><a href="<c:url value='/performance/pfRanking.do'/>">랭킹</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value='/performSearchResult/theaterSearch.do?type=AAAA'/>">연극</a></li>
               <li><a href="<c:url value='/performSearchResult/musicalSearch.do?type=AAAB'/>">뮤지컬</a></li>
               <li><a href="<c:url value='/performSearchResult/areaSearch.do'/>">지역별</a></li>
               <li><a href="<c:url value='/performSearchResult/periodSearch.do'/>">기간별</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/mainSearchResult/doReservation.do"/>">예매하기</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/customerService/customerServiceList.do"/>">고객센터</a></li>               
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
   
   <!-- 메인에서 받는날짜랑 datepicker로 받는 날짜랑 형식이 다름-->
   <!-- 날짜 받을 때, / 있는지 없는지 구분-->
   <!-- 시작 날짜 -->
   <c:set  var="std" value="${param.startDay }"/>
     <c:if test='${fn:indexOf(std, "/")==-1 }'>
     	<c:set var="std" value="${param.stdate }"/>
     </c:if>
     <c:if test='${fn:indexOf(std,"/")!=-1 }'>
     	<c:set var="s" value="${fn:split(std,'/') }" />
     	<c:set var="std" value="${s[2] }${s[0] }${s[1] }"  />
     </c:if>
     
   <!-- 종료 날짜 -->
   <c:set  var="edd" value="${param.endDay }"/>
   	 <c:if test='${fn:indexOf(edd, "/")==-1 }'>
     	<c:set var="edd" value="${param.eddate }"/>
     </c:if>
     <c:if test='${fn:indexOf(edd,"/")!=-1 }'>
     	<c:set var="s" value="${fn:split(edd,'/') }" />
     	<c:set var="edd" value="${s[2] }${s[0] }${s[1] }"  />
     </c:if>
    
   <!--검색결과 페이지에서 연극 카테고리 클릭하면 나오는 화면,  -예진- -->
   <div style="width: 87%;float: right;" class="pfdetail">
   		<div id="perfomrtitleFromMain">
   			<form action="<c:url value="/performSearchResult/theaterDetail_Search.do"/>" method="post">
   			
			<c:import url="/inc/inc_area.do"></c:import>&nbsp;&nbsp;&nbsp; 
			
			<span>시작일</span>
			<input type="text" id="stdate" name="stdate" value="${std }"
				style="width:100px;height:40px;font-size:15px;" required="required">
			&nbsp;&nbsp;
			 
			<span>종료일</span>
			<input type="text" id="eddate" name="eddate" value="${edd }"
				style="width:100px;height:40px;font-size:15px;" required="required">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span>공연명</span>
			<input type="text" id="perfomName" name="performName" value="${param.performName }"
				style="width:150px;height:40px;font-size:15px;">
			&nbsp;&nbsp;
				
			<input id="pSearch" name="pSearch" type="submit" class="btn_1" value="검색"><br>
			
			</form>	
   		</div>  		
   </div>
     
      <div style="width: 87%;float: right;" class="pfdetail">
	      <!-- 연극 카테고리만 뿌려준다,  -예진- -->
		   <div class="API">		   
		   	<c:forEach var = "vo" items="${alist }">    
				<%-- <c:if test="${vo.genrenm == '연극' || vo.genrenm == '뮤지컬'}">  --%>     	
					<div class = "testImg">
						<a href="<c:url value='/recentInsert.do?perfomid=${vo.mt20id}'/>">
				    		<img src="${vo.poster }" class="img-responsive" width="240px" height="240px">
				    	</a>
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
	   
	   <!-- 더보기 버튼! 인풋은 hidden -->
	   <div id="more_btn_div" align="center" style="width: 87%;float: right;" class="pfdetail">
	   		<!-- value값에 정수로 저장되어있어도 넘길때 String으로 넘긴다 -->
	   		<input id="page" name="page" type="text" value="1" hidden="hidden">
	   		<input id="moreRead" name="moreRead" type="submit" class="btn_moreRead" value="더보기(More)" onclick="condition()">
	   </div>
	   
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>" ></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">

<script type="text/javascript">
//왼쪽 네브바에서 연극 카테고리 클릭했을때, 알림 뜨게 한다
/* window.onload = function () {
	 alert("오늘 날짜로부터 14일 전 ~ 7일 후의 연극 정보를 로딩합니다.");
} */

/* 시도 구군 - 사용자가 선택한 값 고정시키기 */
$(function(){	
	$("#sido option").each(function(){
		if($(this).val()=='${param.sido}'){
			$(this).prop("selected","selected");
		}
	});
	
	$("#sido").trigger("change");
	
 	/* moreRead(); */ 
});

/* 날짜 */
$(function(){
	
	$("#stdate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: /* "+1m +15d", */	"+6m",
		minDate: "-6m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
				"7월","8월","9월","10월","11월","12월"]});
		
	$("#eddate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "6m",
		minDate: "-6m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
				"7월","8월","9월","10월","11월","12월"]});
	
});

/* 검색조건 변경 후 더보기 버튼 누를때 유효성 검사 */
function condition(){
	if('${param.sido}'!=$("#sido option:selected").val()){
		alert("지역(시, 도) 검색조건이 변경되었습니다. 다시 검색해주세요.");
		$('#sido').focus(); 
		$('#more_btn_div').hide();
		return false;

	}else if('${param.gugun}'!=$("#gugun option:selected").val()){
		alert("지역(구, 군)검색조건이 변경되었습니다. 다시 검색해주세요.");
		$('#gugun').focus(); 
		$('#more_btn_div').hide();
		return false;

	}else if('${std}'!=$("#stdate").val()){
		alert("시작날짜 검색조건이 변경되었습니다. 다시 검색해주세요.");
		/* $('#stdate').focus(); */ 
		$('#more_btn_div').hide();
		return false; 

	}else if('${edd}'!=$("#eddate").val()){
		alert("종료날짜 검색조건이 변경되었습니다. 다시 검색해주세요.");
		/* $('#eddate').focus(); */ 
		$('#more_btn_div').hide();
		return false; 

	}else if('${param.performName}'!=$("#perfomName").val()){
		alert('${param.performName}');
		alert("공연명 검색조건이 변경되었습니다. 다시 검색해주세요.");
		$('#perfomName').focus(); 
		$('#more_btn_div').hide();
		return false;

	}else{	
		moreRead();
	}
}


/* 더보기 ajax */
function moreRead(){
	/* 더보기 실행할 때, 검색중 알람 뜨게 하고 버튼은 없앤다*/
	alert("해당 조건 검색 중입니다. 잠시만 기다려 주세요.");	
	$('#more_btn_div').hide(); 
	
		var page = parseInt($('input[name=page]').val());
		var pageIndex = page+1;
		$("#page").val(pageIndex);
		
		$.ajax({
			url:"<c:url value='/performSearchResult/theaterMoreRead.do'/>",
			type: 'post',
			data : 
				{
					"type" : $("#type").val(),
					"sido" : $("#sido").val(),
					"gugun" : $("#gugun").val(),
					"stdate" : $("#stdate").val(),
					"eddate" : $("#eddate").val(),
					"pageIndex" : $("#page").val(),
					"performName" : $("#perfomName").val()				
				},
			success: function(res){
				 if(res.length==0){ 
					//더 불러올 API 없는 경우
					 $('#moreRead').hide();
					 alert("더 불러올 공연이 없습니다.");
					
				 }else{ 
					//불러올 API 있는 경우
					var str="";
					
					$.each(res,function(idx,value){
						if(value.genrenm=='연극' || value.genrenm== '뮤지컬'){
							str+="<div class = 'testImg'>"
							+"<img src='"+value.poster+ "' class='img-responsive' width=240px height=240px>"
							+"<br>"
							+"<h5><b>"+value.prfnm+"</b></h5>"
							+"<p>"+value.prfpdfrom+"</p>"
							+"<p>"+value.prfpdto+"</p>"
							+"<p>"+value.fcltynm+"<p>"
							+"<p>"+value.genrenm+"<p>"
							+"</div>"					
						}
						
					});
					
				  }  
				
				//클래스 API 뒤에 이어서 붙임 (더보기 버튼)
				$(".API").append(str);
				
				/* 더보기 완료하면 다시 더보기버튼 보여줌 */
				$('#more_btn_div').show();
				
			},
			
			error: function(xhr, status, error){
				/* alert(error); */
				alert("검색결과가 없습니다.");
				
			}			
		});/* ajax */
		
		//기본 이벤트 제거
		event.preventDefault();
		
}/* function moreRead()*/

	
</script>	
	     
   <%@ include file="../inc/main2Bottom.jsp" %>