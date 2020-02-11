<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<%
	pageContext.setAttribute("newLine", "\r\n");
%>
<style type="text/css">
   /* 마지막에 링크 빼서 연결할거임 수정하지말아주세요 틀 깨져요. */
   .top1 {height: 450px;padding: 30px;width: 75%;margin: 30px;}
   .top2 {height: 100%;width: 400px;float: left;margin-left: 15px;}
   .top1>img {height: 100%;width: 250px;float: left;}
   .top2>div{border: 1px solid #dfd5d5;width:10px;height:50px;margin-right: 8px;}
   .top2>label {padding-left: 15px;line-height: 1.7em;padding-right: 30px;font-family: 맑은고딕;color:#000;}
   #performtitle{text-align: center;font-family: 맑은고딕; font-weight: bold; margin-top: 25px;padding-right: 25%;}
   .type{margin-left:27px;}
   span{color:#000;}
   #home{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #home>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #like{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #like img{z-index:-1;margin: 11px 0px 0px 8px;}
   #likecount{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #likecount>div{z-index:-1;text-align: center;line-height: 3.5em; font-weight: 600;}
   div#calandar {width: 350px;height: 420px;position: absolute;top:162px;left:1123px; border:0.5px solid #f3eeee;padding: 33px 10px 10px 30px;background-color: #f7f7f7;} /* 수정필요 */ 
   .body{height:100%; padding:30px;width:75%;margin:30px;border-top: 0.7px dotted gray;}
   .section {width:70%;height:100%;float:left; padding: 5px 5px 5px 5px;}
   .aside{width:25%;height:90%; border: 1px solid #efe7e7;float:left;margin-left:50px;padding: 5px 5px 5px 5px;}
   img.imgbox {margin: 10px 10px 10px 40px;}
   span.util {padding-left: 60px;font-weight:400;line-height: 1.5;}
   .eventReviews {width: 100%;height: 100px;border: 1px solid lightgray;margin-bottom: 15px;margin-top: 15px;}
   div#tabConThree {width: 810px;}
   .box-wrap {width: 100%;height: 100%;border-bottom: 1px solid lightgray;}
   .box {width: 770px;height: 100px;}
   .box-depth {padding: 20px;width: 100%;height: 100%;}
   .left {float: left;width: 109px;font-size: 13px;}
   .right {float: left;width: 520px;padding-left: 60px;  font-size: 13px;line-height: 1.7em;}
   span.star-rating {margin-left: 10px;}
   h2.review {margin-bottom: 8px;}
   .shownView {float: left;margin-right: 10px;}
   .starRaite {padding-bottom: 23px;border-bottom: 3px solid black;}
   .box-more {background-color: #fafafa;padding: 15px 15px 15px 125px;font-size: 15px;height: 100%;}    
    .explainPark {border: 1px solid lightgray;width: 100%;height: 100%;}
    h4.park {margin-top: 20px;}
    .explainParkSub {width: 100%;height: 500px;border:1px solid lightgray;padding: 20px 20px 20px 20px;background-color: #f9f9f9;}
    span#explainParkImpl {font-size: 12px;font-family:-webkit-pictograph;line-height: 0px;}
    h4.parkInfo {margin-bottom: 10px;}
    #calandarSub h6{font-size: 12px; font-family:-webkit-body;}
    #dateWhile{font-size: 17px; font-family:맑은고딕; font-weight: 400;margin-bottom: 8px;}
    select#selectDate {border: none;margin-top: 10px;outline-style: none;border-radius: 7px;}
    input#ticketing {margin-left: 35px;width: 200px;height: 45px;border: none;background: red;border-radius: 5px;color: white;font-size: 1.1em;font-weight: bold;margin-top: 25px;  box-shadow: 6px 6px 8px 1px #a05260;}
    #selectDate > option{font-size: 17px;font-family: 맑은고딕;font-weight: 600;padding-left: 5px;}
    .cancellationTable > th,td{height: 50px;}
    .cancellationTable tr th {background-color:#fbfbfb;padding-left: 10px; font-weight: 400;font-family: serif;}
    .cancellationTable tr td{padding-left: 13px;font-family: serif;}
    .cancellationTable{border-collapse: collapse;border-color: lightgray;}
    .booking{margin-bottom: 8px;}
    div#cancellationExplain {margin-top: 23px;}
    button.banner {width: 231px;height: 56px;border: none;background: #93f26c;color: white;font-size: 1.4em;font-weight: bold;box-shadow: 3px 1px 6px 2px #7df183}
    #mainposter{width: 100%; height: 100%;}
    .performDetailtable > tbody > tr th{background-color:#fbfbfb;padding-left: 10px; font-weight: 400;font-family: serif;margin-bottom:80px;}
 	.performDetailtable > tbody > tr td{padding-left: 13px;font-family: serif;}
 	.explinToperform {width:100%;height:130px;margin-top: 30px;border: 0.3px dotted;}  
    .explinToperform > div > span > span:nth-child(1){margin-left: 10px;}
	span#firtstspan {margin-left: 110px;}
	span#firtstspan2 {margin-left: 95px;}
    span#firtstspan4 {margin-left: 77px;}
    span#firtstspan3 {margin-left: 78px;}
    span#firtstspan5 {margin-left: 60px;}
    span#parentSpan1 {margin-left: 10px;}
    span#parentSpan2 {margin-left: 10px;}
    span#parentSpan3 {margin-left: 10px;}
    span#parentSpan4 {margin-left: 10px;}
    table.performDetailtable {margin-bottom: 70px;}
    button#likeBt {background: white;border: none;outline: none;}
    select#selectDate2 {width: 265px;height: 35px;border: 0.5px solid #ece8e8;outline-style: none;border-radius: 5px;}
    h5#finalTest {margin-bottom: 5px;font-family: 맑은고딕;}
    
    
   /*다 없애고 수정해야 될 가능성이 있음(밤샘각)*/
   ul{list-style:none;}
   .tabmenu{width:100%; margin: 0 auto; position:relative; }
   .tabmenu ul li{display:inline-block;width:25%; float:left;  text-align:center; background:#f2f4f7;line-height:40px;}
   .tabmenu label{display:block;width:100%; height:40px;line-height:40px;font-weight: 400;}
   .tabmenu input{display:none;}
   .tabCon{display:none; text-align:left; padding: 20px;position:absolute; left:0; top:40px; box-sizing:border-box;}
   div#tabConOne>div{margin-top:25px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}
   div#tabConTwo>div{margin-top:25px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}
   div#tabConFirth {width: 100%;height: 100%;}    
   img.performtit {margin-right: 5px;}
 
   .tabmenu input:checked ~ label{background:white;border: 0.2px solid #efe7e7; border-bottom: none;font-weight: bold;} 
   .tabmenu input:checked ~ .tabCon{display:block;}
   
   .box-more{background-color: #fafafa;padding: 25px 20px 25px 130px;}
   .tabmenu ul li {line-height: 30px;}
    button.moreReview {margin-left:42%; width: 16%;height: 49px;text-align: center;margin-top: 25px;background-color: rgb(255, 0, 102);color: white;font-size: 1.2em;font-weight: bold;outline: none;border: 1px solid;}
  	.box-reviewimg {width: 101px;height: 36px;float: right;margin-top: 32px;}
	.box-reviewimg img {float: left;width: 30%;height: 100%;margin-right: 2px;margin-left: 1px;} 
   .starRaite>img {height: 18px;margin-top: 9px;}
   span.tit {word-break: break-all;}
   /* 삭제하지마세요 - 사이드 배너 */
   #floatMenu {position: absolute;width: 230px;height:780px;left: 1550px;top:120px;border: 0.2px solid #efe7e7;}
}
</style>

<script type="text/javascript" src="<c:url value ='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		$("form[name=payfrm]").submit(function(){
			if($("#selectDate option").val()=='dateN'){
				alert("현재 공연중이 아닙니다!");
				event.preventDefault();
			}else if(!$("#selectDate option").text()){
				alert("예매할 일자를 선택해주세요.");
				$("#selectDate2").focus();
				event.preventDefault();
			}
		});
		
		$("#likeBt").click(function(){
			$.ajax({
				type:"post",
				url:"<c:url value='/like.do'/>",
				data:{"perfomid":$("#perfomid").val(),
					"performtitle":$("#performtitle").html(),
					"performtype":$(".type").html()},
				dataType:"json",
				success:function(res){
					$(".llqqllqq").text(res.count);
					if(res.img=='like'){
						$("#likeimgbt").attr("src","<c:url value='/resources/images/like.png'/>");
					}else{
						$("#likeimgbt").attr("src","<c:url value='/resources/images/like2.png'/>");
					}
				},
				error:function(x,e){
					if(x.status==500){
						alert("로그인해주세요.");
						location.href="<c:url value='/login/login.do' />";
					}
				}
			});	
		});

		
		$('button#ticketing').hover(function() {
			$(this).css('box-shadow', '3px 1px 6px 2px #a05260');	/* box-shadow: 6px 6px 8px 1px #a05260; */
		},function(){
			$(this).css('box-shadow', '');
		});
		
		$('button.banner').hover(function() {
			$(this).html("메인으로");
			$(this).css('box-shadow', '5px 5px 7px 1px #7df183')
		},function(){
			$(this).html("최근 본 공연");
		});
	
		$('#firtstspan3').hover(function() {
			$(this).css('backgroundColor', '#fcf8e3');
			$(this).css('color', 'red');
			$(this).css('font-weight', 'bold');
		},function(){
			$(this).css('backgroundColor', '');
			$(this).css('color', 'black');
			$(this).css('font-weight', '');
		});
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 400);

		}).scroll();
		
		if($("#selectDate2 select option").val()!=''){
			$("#selectDate2").change(function(){
				if($("#selectDate select option:selected").val("dateY")){
					$("#selectDate option").text("");
				}
				$.ajax({
					type:"post",
					url:"<c:url value='/ticketCategory.do'/>",
					data:{"ticketSeq":$("#selectDate2").val()},
					dataType:"json",
					success:function(res){
						var last=res.sellticket-res.selled;
						var result=res.sellclass+", "+"잔여석:"+last+"석";
						$("#selectDate option").text(result);
					},
					error:function(xhr,status,error){
					}
				});	
			});
		}
		
		var CurrentPage=1;
		$("#reviewMore").click(function(){
			++CurrentPage;
			$.ajax({
				type:"post",
				url:"<c:url value='/member/reviewMore.do'/>",
				data:{"CurrentPage":CurrentPage,
					  "mt20id":$("input[name=mt20id]").val()},
				success:function(res){
					var str="";
					if(res==null || res==''){
						alert("마지막페이지입니다!");
						$("#reviewMore").hide();
					}else {
					$.each(res,function(idx,value){
					   var date = new Date(value.REVIEW_REGDATE);
					   date=getFormatDate(date);
                       var content=value.REVIEW_CONTENT;
                       content=content.replace("\r\n","");
                       if(content.length>70){
                       content=content.substr(0,70)+'...'
                       }
						//ㅇㅇ
						 str+='<div class="box-wrap">'
	                       +'<div class="box">'
	                       +'<div class="box-depth">'
	                        +'<div class="left">'
	                       +'<span class="umail">'+value.USERID+'</span>'
	                       +'</div>'
	                        +'<div class="right">'
	                       +'<span class="tit">'
	                       +content
	                       +'</span>'
	                       +'<p class="date">'+date+'</p>'
                            +'</div>'
                            +'<div class="box-reviewimg">'
                            +'<img alt="" src="<c:url value="/reviewupload/'+value.REVIEW_P1+'"/>">'
	                        +'<img alt="" src="<c:url value="/reviewupload/'+value.REVIEW_P2+'"/>">'
                            +'<img alt="" src="<c:url value="/reviewupload/'+value.REVIEW_P3+'"/>">'
                            +'</div>'
                            +'<div>'
	                        +'<span class="star-rating">'
	                        +'<img alt="별점이미지" src="<c:url value="/resources/images/star'+value.REVIEW_SCORE+'.png"/>">'
	                        +'</span>'
	                        +'</div>'
	                        +'</div>'
	                       	+'</div>'   
	                     	+'</div>'
					});
					$(".moreReview").before(str);
					}
				},
				error:function(xhr,status,error){
				}
			});	
		});
	});
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;
	}
</script>
 
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
               <li class="active"><a href="#">랭킹</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value='/performSearchResult/theaterSearch.do?type=AAAA'/>">연극</a></li>
               <li><a href="<c:url value='/performSearchResult/musicalSearch.do?type=AAAB'/>">뮤지컬</a></li>
               <li><a href="<c:url value='/performSearchResult/areaSearch.do'/>">지역별</a></li>
               <li><a href="<c:url value='/performSearchResult/periodSearch.do'/>">기간별</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/mainSearchResult/doReservation.do"/>">예매하기</a></li>
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
	<!-- div안에서작업 그외엔 건들지말것 -->
   
   <!-- 페이지 만들떄마다 복붙 -->
   <!-- div안에서작업 그외엔 건들지말것 -->
   <div style="width: 87%;float: right;" class="pfdetail">
   <input type="hidden" name="perfomid" id="perfomid" value="${param.perfomid }">
	  <c:if test="${empty map2}">
	  	  <span style="color: red;font-weight: bold;">데이터가 존재하지 않습니다.</span>
	  </c:if>
	  
	  <c:if test="${!empty map2}">
		      <h1 id="performtitle">${map2['prfnm']}</h1><br><hr>
		      <div class="top1">
		      <!-- 이미지는 디자인 때문에 넣어놨음  --><!-- API사용 뿌려줄거임  -->
		      <img alt="공연이미지" src="${map2['poster']}">
		                                                                           
		      <div class="top2">
		         <label id="performplace">공연장소</label>
		         <%-- <c:set var = "performName" value="${map2['fcltynm']}"/>
		          --%>
		         <%-- <c:if test="${fn:length(performName)>10 }">
		         </c:if> --%>
		         <%--<c:if test="${fn:length(performName)<=10}">
		         </c:if>--%>
		         <span id="performplace" style="width:400px">${map2_location['fcltynm']}</span>
		         <br>
		         
		         <label id="performterm">공연기간</label>
		         <span id="performterm">${map2['prfpdfrom'] }</span>~<span>${map2['prfpdto'] }</span>
		         <br>
		         
		         <label id="limitage">입장연령</label>
		         <span id = "limitage">${map2['prfage'] }</span>
		         <br>
		         
		         <label id="performtime">관람시간</label>
		         <span id="performtime">${map2['prfruntime'] }</span>
		         <br>
		         
		         <label id="performtype">장 르</label>
		         <span id="performtype" class = "type">${map2['genrenm'] }</span>
		         <br>
		         
		         <label id="ticketprice">티켓가격</label>
		         <span id = "ticketprice">${map2['pcseguidance'] }</span>
		         <br>
	         <!-- 반복 끝 -->
		
		
	         <!-- 홈으로 -->
	         <div id="home">
	            <a href = "<c:url value = '/index.do'/>">
	               <img src="<c:url value ='/resources/images/home2.png'/>">
	            </a>
	         </div>
	         
	         <!-- 좋아요 -->
	         <div id="like">
	         	<button id="likeBt">
              	 <img id="likeimgbt" src="<c:url value ='/resources/images/${heart }'/>">
	         	</button>
	         </div>
	         <!-- 좋아요 개수 -->
	         <div id="likecount">
	            <div class="llqqllqq">${likeCount }</div>
	         </div>
	         
	         <div id = "calandar">
		         <div id="calandarSub">
		      		<h5 id="finalTest">예매가능 공연 일자</h5>   
		         	<p id="dateWhile">${map2['prfpdfrom'] }~${map2['prfpdto'] }</p>
		         </div>
		         <!-- commit용 -->
		         <!-- 예매 버튼 클릭 시 -> pfReservationController로 이동 후 결제 진행   -->
				  <form name = "payfrm" method="post" 
				  		<c:if test="${empty sessionScope.userid }">
				  			action="<c:url value='/performance/pfNoReservation.do'/>"
				  		</c:if>
				  		<c:if test="${!empty sessionScope.userid }">
				  			action="<c:url value='/performance/pfReservation.do'/>"
				  		</c:if>		
				  >
				  
			 	 		<input type="hidden" name="mt20id" value="${map2['mt20id']}"> 				<!-- 공연id -->
			  			<input type="hidden" name="mt10id" value="${map2['mt10id']}">				<!-- 공연시설id -->
			  			<input type="hidden" name="prfnm" value="${map2['prfnm']}">	 				<!-- 공연명 -->
			  			<input type="hidden" name="genrenm" value="${map2['genrenm']}"> 			<!-- 공연장르 -->
			  			<input type="hidden" name="fcltynm" value="${map2_location['fcltynm']}"> 	<!-- 공연시설명 -->
			  	
			  	<c:if test="${!empty tclist }">
				  	<select id="selectDate2" name="ticketSeq">
				  	<option value='dateY'>선택해주세요</option>
		         	<!-- 반복시작 -->
		         	<c:forEach var="tcvo" items="${tclist }">
		         		<!-- value==ticket_seq -->	<!-- 공연별 판매가능 수량 테이블의 티켓_seq를 참조 -->
		         		<option value="${tcvo.ticketSeq}">날짜 : ${tcvo.prfdate }, 시간 : ${tcvo.prfhour }</option>	
		         	</c:forEach>
		         	<!-- 반복 끝 -->
		         	</select>
		         	
		         	<select id="selectDate" size="8" style="width:295px;">
		         		<option></option>
		        	 </select> 
			  	</c:if>
			  	
		         	<c:if test="${empty tclist}">
		    	     <select id="selectDate" size="8" style="width: 295px;">
			         	<option value="dateN">예매가능한 공연 일자가  없습니다.</option>	
		    	     </select> 
		         	</c:if>
		         	
		         <input type="submit" id="ticketing" value="예매하기>" />
	         	</form>
	         </div>
	      </div>
	      </div>
   </c:if>  
</div>      
   
   
   <div style="width: 87%;float: right;" class="pfdetail">
      <div class="body">
         <div class="section"><!-- 영역만 조절해줌 -->
         <div class="tabmenu">
            <ul>
               <!-- 장소(Map_API) 지도는 건들지 말아주세요 -->
               <li id="tab4" class="btnCon">
               <input type="radio" checked="checked" name="tabmenu" id="tabmenu4"> 
               <label for="tabmenu4" style="margin-bottom: 0;" class = "lab">장소</label>
                  <div class="tabCon" id="tabConFirth">
                    <!-- MAP_API -->
                  <div id="map" style="width: 800px; height: 400px;"></div>
                  <input type="text" value="${map2_location['la']}" id="x">
				  <input type="text" value="${map2_location['lo']}" id="y">	
                  
                  <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10fa2266e01525ae7b07ab1cc6053105"></script>
                  <script>
                     var x=document.getElementById('x').value;
					 var y=document.getElementById('y').value;
       
					 var mapContainer = document
                           .getElementById('map'), // 지도를 표시할 div 
					 
                     mapOption = {
                        center : new kakao.maps.LatLng(x,y), // 지도 중심좌표
                        level : 4   // 지도 확대 레벨
                     };

                     var map = new kakao.maps.Map(mapContainer,
                           mapOption);

                     // 마커가 표시될 위치입니다 - API 작업 후 각 위도/경도 변경해줄겁니다.
                     var markerPosition = new kakao.maps.LatLng(
                           x, y);

                     // 마커를 생성합니다
                     var marker = new kakao.maps.Marker({
                        position : markerPosition
                     });

                     // 마커가 지도 위에 표시되도록 설정합니다
                     marker.setMap(map);
                     
                     //API 작업 후 - 위도/경도 변경 해줄겁니다.
                     var iwContent = '<div style="padding:5px;font-weight:bold;width:170px;">${map2_location['fcltynm']}<br><a href="https://map.kakao.com/link/map/${map2_location['fcltynm']},'+x+','+y+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>',
                     // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                     iwPosition = new kakao.maps.LatLng(x,y); //인포윈도우 표시 위치입니다.

                     // 인포윈도우를 생성합니다
                     var infowindow = new kakao.maps.InfoWindow({
                        position : iwPosition,
                        content : iwContent
                     });

                     // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                     infowindow.open(map, marker);
                  </script>
                  <!-- MAP_API -->
   				  <div class="explinToperform">
						<div>
							<span id="parentSpan1">
								주소  <span id="firtstspan">${map2_location["adres"]}</span>
							</span> 
						</div>
						<div>
							<span id="parentSpan2">
								연락처  <span id="firtstspan2">${map2_location["telno"]}</span>
							</span> 
						</div>
   				  		<div>
   				  			<c:set var="url" value="${map2_location['relateurl']}"/>
							<c:if test="${!empty url}">
	   				  			<a href="${map2_location['relateurl']}">
	   								<span id="parentSpan3">
	   				  					홈페이지  <span id="firtstspan3">${map2_location["relateurl"]}</span>
   				  					</span>		
	 				  			</a> 
							</c:if>
							
							<c:if test="${empty url}">
   				  				<span id="parentSpan3">
   				  					홈페이지  <span style="color:red;font-style: bold;" 
   				  						id="firtstspan4">홈페이지가 존재하지 않습니다!</span>
  				  				</span>
							</c:if>
 				  		</div>
						<div>
							<span id="parentSpan4">
								공연시설명  <span id="firtstspan5">${map2_location["fcltynm"]}</span>
							</span>	
						</div>
   				  </div>
   				  
   				  <h4 class="park" style="font-weight: bold;">주차장</h4>
                  <div class="explainPark">
           	       	<div class="explainParkSub">
           	       		<h4 class="parkInfo" style="font-weight: bold;">주차 안내</h4>
           	       		<span id="explainParkImpl" class="explainParkImpl" style="line-height: 5px">
           	       		Delight 주차장은 상시 만차되며 공연장 주변의 교통이 매우 혼잡하여 주차에 많은 시간이 걸리오니
           	       		대중교통을 적극 이용해 주시기 바랍니다.
           	       		특히 공연장 특성상 공연 종료 후 한꺼번에 출차가 진행되어 출차 시간이 많이 걸리며 귀가시간에 지장이 있을 수 있습니다.
           	       		<br><br><mark style="color:red;">또한 Delight 주차장 만차에 대비하여 인근 주차장 정보를 사전에 확인 후 방문해 주시기 바라며,
           	       		주차요금은 해당 주차장의 요금기준으로 <br>적용됩니다.</mark><br><br>
           	       		
           	       		1. 주차장 운영시간 : 07:00~24:00(단, 공연 종료 시간에 따라 유동적으로 운영)<br>
           	       		 ※ 공연 종료 후 30분 이내 출차 부탁드립니다.<br>
           	       		 ※ 주말, 공휴일(2회공연)인 경우 낮공연을 관람하신 분들은 다음 공연괌람 손님을 위해 바로 출차 부탁드립니다.<br><br>
           	       		2. 주차요금 : 공연관람객에 한해 4시간 5,000원(4시간 초과 시 10분당 1,000원 부과)
           	       		<br><br>
           	       		3. 주차권 구매
           	       		 - Delight홈 : Delight홈 객석 2층 매표소 주차정산창구<br>
           	       		</span>
           	       	</div>
                  </div>
   				  <!-- E -->     
                </div>
              </li>
               
            
               <li id="tab1" class="btnCon">
               <input type="radio" name="tabmenu" id="tabmenu1"> 
               <label for="tabmenu1" style="margin-bottom: 0;" class = "lab">소개</label>
                  <div class="tabCon" id="tabConOne">
                     <h2>공연 시간</h2>
                     <div class="performtime">
                        <!-- 공연 API_(dtguidance) -->
                         <span class="performtimesub">
                     		<img class="performtit" src="<c:url value='/resources/images/clock.png'/>">
                            	${map2['dtguidance'] }                                 
                         </span>
                     </div><br>
                     
                     <h2>포스터</h2>
                     <div>
                     	<!-- 아 이부분 죽고싶었다.. 진짜 -->
                     	<c:set var="variable" value="${map2.styurls.styurl}"></c:set> 
  						<%-- <c:out value="${variable}"></c:out> --%> 
  						
  						<c:if test="${fn:contains(variable,',')}">
	    					<c:forEach var="i" begin="0" end="5">
	  		                    <c:if test="${!empty map2.styurls.styurl[i]}">
		  		                    <img id="mainposter" alt="포스터 보여주기" src="${map2.styurls.styurl[i]}">
	  		                    </c:if>
	    					</c:forEach> 
						</c:if>
  						<!-- 김영민 -->
						<c:if test="${not fn:contains(variable,',')}">
	  		                <img id="mainposter" alt="포스터 보여주기" src="${map2.styurls['styurl']}">
						</c:if>
                     </div><br>
                     
                     <!-- Map이든, list든 똑같이 뿌려주시면 됩니다.  -->
                     <h2>공연 상세설명</h2> 
                     <div>
                        <table class="performDetailtable" border="1">
                           <colgroup>
                              <col style="width: 20%">
                              <col style="width: 30%">
                           </colgroup>
                        
                           <!-- td에 API데이터 가져오면 됨 -->
                           <tbody>
                              <tr>
                                 <th>주최</th>
                                 <td>${map2['entrpsnm'] }</td>
                              </tr>
                              <tr>
                                 <!-- IF -->
                                 <th>등장인물</th>
                                 <c:if test="${empty map2['prfcast'] }">
                                 	<td style="color:red;font-weight: bold;">등장인물 정보는 비공개입니다.</td>
                                 </c:if>
  									
  								 <c:if test="${!empty map2['prfcast'] }">
                                 	<td>등장인물 정보는 비공개입니다.</td>
                                 </c:if>
                              </tr>
                              <tr>
                                 <th>관람등급</th>
                                 <td>${map2['prfage'] }</td>	
                              </tr>
                              <tr>
                                 <th>장소</th>
                                 <td>${map2['fcltynm'] }</td>	
                              </tr>
                           </tbody>
                        </table>
                     </div><!--  -->
                  </div>
               </li>
               
                <!-- 후기 -->
               <li id="tab3" class="btnCon">
               <input type="radio" name="tabmenu" id="tabmenu3" > 
               <label for="tabmenu3" style="margin-bottom: 0;" class = "lab">관람후기</label>
                  <div class="tabCon" id="tabConThree">
                  <div class="shownView">
                      <h2 class="review">관람후기 (<fmt:formatNumber value="${reviewmap.TOTAL }" pattern="#,###" />)</h2>
                 </div>
                 <div class="starRaite">
                     <img alt="" src="<c:url value='/resources/images/star${reviewmap.AVG}.png'/>">
                 </div>        
                   
                   <c:if test="${empty rlist }">
                   <div class="box-wrap">
                   	<div class="box" style="text-align: center; font-size: 1.2em;padding-top: 35px;">
                   		등록된 후기가 존재하지 않습니다.
                   	</div>
                   </div>
                   </c:if>
                   <c:if test="${!empty rlist }">
                   <c:forEach var="rmap" items="${rlist }">
                   <!-- 반복시작 ㅇㅇ-->
                   <div class="box-wrap">
                       <div class="box">
                             <div class="box-depth">
                                <div class="left">
                                   <span class="umail">${rmap['USERID'] }</span>
                                </div>
                                <div class="right">
                                   <span class="tit">
                                   <c:set var="content" value="${fn:replace(rmap['REVIEW_CONTENT'], newLine,'<br>') }" />
                                      	<c:if test="${fn:length(content)>70 }">
											${fn:substring(content,0,70) }...
										</c:if>
										<c:if test="${fn:length(content)<70 }">
											${content }
										</c:if>
                                     </span>
                                   <p class="date"><fmt:formatDate value="${rmap['REVIEW_REGDATE'] }" pattern="yyyy-MM-dd"/></p>
                                </div>
                                <div class="box-reviewimg">
                                <c:if test="${!empty rmap['REVIEW_P1'] }">
                                <img alt="후기" src="<c:url value='/reviewupload/${rmap["REVIEW_P1"] }' />">
                                </c:if>
                                <c:if test="${!empty rmap['REVIEW_P2'] }">
                                <img alt="후기" src="<c:url value='/reviewupload/${rmap["REVIEW_P2"] }' />">
                                </c:if>
                                <c:if test="${!empty rmap['REVIEW_P3'] }">
                                <img alt="후기" src="<c:url value='/reviewupload/${rmap["REVIEW_P3"] }' />">
                                </c:if>
                                </div>
                                <div>
                                   <span class="star-rating">
                                      <!-- IF -->
                                      <img alt="별점이미지" src="<c:url value='/resources/images/star${rmap["REVIEW_SCORE"] }.png'/>">
                                      <!-- IF -->
                                   </span>
                                </div>
                             </div>
                            <!--<div class="box-more" style="display: block;">
                                sub값
                             </div> -->
                       </div>   
                     </div>
                  <!-- 반복 끝 -->
                  </c:forEach>
                  <c:if test="${reviewmap.TOTAL>5}">
                  	<button class="moreReview" id="reviewMore">
                  	더보기
                  	</button>
                  </c:if>
                  	</c:if>
                  </div>
               </li>
               
               <!-- 취소/환불안내 -->
               <li id="tab2" class="btnCon">
               <input type="radio"name="tabmenu" id="tabmenu2"> 
               <label for="tabmenu2" style="margin-bottom: 0;" class = "lab">취소/환불안내</label>
                  <div class="tabCon" id="tabConTwo">
                  	<div class="refund" style="border: none">
                  		<!-- 그냥 style 걸겠습니다.. -->
                  		<h4 style="font-weight: bold" class="booking">예매 마감 안내</h4>
                  		<span>관람일 전일 (평일/공휴일/토요일) 17:00시 예매가 마감됩니다.</span>
                  	</div>
                  	
                  	<div class="cancellationInfo" style="border: none">
                  		<h4 style="font-weight: bold" class="booking">예매 취소 안내</h4>
                  		<span><mark style="color: red;">
                  			관람일 전일 (평일/주말/공휴일/토요일) 17:00시 
                  			</mark>취소가 마감됩니다.</span>
                  	</div>
    
                  	<div class="cancellationfee" style="border: none">
                  		<h4 style="font-weight: bold" class="booking">취소 수수료 안내</h4>
						<table class="cancellationTable" border="1" style="width:100%">
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 80%;">
							</colgroup>

							<tr>
								<th>예매후~관람일 10일 전</th>
								<td>없음</td>
							</tr>
							<tr>
								<th>관람일 9일 전~7일 전</th>
								<td>티켓 금액의 10%</td>
							</tr>
							<tr>
								<th>관람일 6일 전~3일 전</th>
								<td>티켓 금액의 20%</td>
							</tr>
							<tr>
								<th>관람일 2일 전~1일 전</th>
								<td>티켓 금액의 30%</td>
							</tr>
						</table>
						
						<div id="cancellationExplain">
							<img alt="화살표" src="<c:url value='/resources/images/right.png'/>">
							<span id="cancellationExplainSub">
								예매 당일 밤 12시 이전 취소 시 취소수수료가 없으며 익일부터는 관람일까지의 기간에 따라 
								취소수수료가 부과됩니다.&nbsp;<mark style="color: red;">
								부분취소는 신용카드, 실시간계좌이체로 결제하신 건에 한하여 부분취소가 가능합니다.</mark>
							</span>
						</div>
                  		<br>
                  		<div id="cancellationExplain2">
                  		<img alt="화살표" src="<c:url value='/resources/images/right.png'/>">
							<span id="cancellationExplainSub2">
								예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다. 
							</span>
                  		</div>
                  		<br>
                  		<div id="cancellationExplain3">
                  			<img alt="화살표" src="<c:url value='/resources/images/right.png'/>">
							<span id="cancellationExplainSub2">
                  				<mark style="color: red;">배송 및 반송처리 된 티켓의 배송료는 환불되지 않습니다.</mark> 
                  			</span>
                  		</div>
                  		<br>
                  	</div>
                  </div><!-- E -->
               </li>
            </ul>
         </div>
      </div>
      
         <!-- 추천/전시 영역 -->
         <div class="aside">
            <h4 style="text-align: center">추천 공연 & 전시</h4>
            <ul>
             <!-- 반복 시작 -->
             <!-- list,map[]이용 -->
               <li>
                  <div>
          			 <!-- 반복 시작 -->
          			 <!-- 예진씨 메서드 참고해 사용 -->
                     <c:forEach var="vo" items="${list}">
	                     <span>
	                        <a href = "<c:url value= '/recentInsert.do?perfomid=${vo.mt20id }'/>">
	                              <img class ="imgbox" 
	                                 width="208px" height="284px" src="${vo.poster}">
	                        </a>
	                     </span>
	                     <span>
	                     	<c:set var="pName" value="${vo.prfnm}"/> 
	                     	<c:if test="${fn:length(pName)>10}"> 
	 	                       <span class="util">
	 	                       		[공연명] : ${fn:substring(pName,0,9)}..
 	                       	   </span><br>
	                     	</c:if>
	                     	
	                     	<c:if test="${fn:length(pName)<=10}"> 
	 	                       <span class="util">
	 	                       		[공연명] : ${fn:substring(pName,0,8)}
 	                       	   </span><br>
	                     	</c:if>    
	                     </span>
	                     <span>
	                     <!-- stDate~endDate -->
	                         <span class="util">${vo.prfpdfrom }</span>~<span>${vo.prfpdto}</span>   
	                     </span>
                     </c:forEach>
	                 <!-- 반복끝 -->
                  </div>
               </li>
            
         </div>
         </div>

		 <div id="floatMenu">
	 		<a href="<c:url value='/index.do'/>">
	 			<button class="banner">최근 본 공연</button>
 			</a>
 			<c:forEach var="posterImg" items="${poster}">
				<img style="width: 150px;height: 150px;margin-left: 40px;margin-top: 20px;" src="${posterImg}">
 			</c:forEach>
		 </div>

</div>
      
   <!-- div안에서작업 그외엔 건들지말것 -->   
<%@ include file="../inc/main2Bottom.jsp" %>

