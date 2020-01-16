<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>

<style type="text/css">
   .top1 {height: 450px;padding: 30px;width: 75%;margin: 30px;}
   .top2 {height: 100%;width: 400px;float: left;margin-left: 15px;}
   .top1>img {height: 100%;width: 250px;float: left;}
   .top2>div{border: 1px solid #dfd5d5;width:10px;height:50px;margin-right: 8px;}
   .top2>label {padding-left: 15px;line-height: 1.7em;padding-right: 30px;font-family: 맑은고딕;color:#000;}
   #performtitle{text-align: center;font-family: 맑은고딕; font-weight: bold; margin-top: 25px;}
   .type{margin-left:27px;}
   span{color:#000;}
   #home{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #home>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #like{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #like>a>img{z-index:-1;margin: 10px 0px 0px 12px;}
   #likecount{width: 64px; height:63px;z-index:1;float:left;margin-top:115px;box-shadow: 0px 1px 4px 0px grey;}
   #likecount>div{z-index:-1;text-align: center;line-height: 3.5em; font-weight: 600;}
   div#calandar {width: 258px;height: 393px;position: absolute;top:162px;left:1186px; border:0.5px solid #f3eeee;padding: 10px 10px 10px 30px;background-color: #f7f7f7;} /* 수정필요 */ 
   .body{height:100%; padding:30px;width:75%;margin:30px;border-top: 0.7px dotted gray;}
   .section {width:70%;height:100%;float:left; padding: 5px 5px 5px 5px;}
   .aside{width:25%;height:90%; border: 1px solid #efe7e7;float:left;margin-left:50px;padding: 5px 5px 5px 5px;}
   img.imgbox {margin: 10px 10px 10px 40px;}
   span.util {padding-left: 60px;font-weight:400;}
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
   .starRaite {padding-bottom: 10px;border-bottom: 3px solid black;}
   .box-more {background-color: #fafafa;padding: 15px 15px 15px 125px;font-size: 15px;height: 100%;}    
    .explainPark {border: 1px solid lightgray;width: 100%;height: 100%;}
    h4.park {margin-top: 20px;}
    .explainParkSub {width: 100%;height: 500px;border:1px solid lightgray;padding: 20px 20px 20px 20px;background-color: #f9f9f9;}
    span#explainParkImpl {font-size: 12px;font-family:-webkit-pictograph;line-height: 0px;}
    h4.parkInfo {margin-bottom: 10px;}
    #calandarSub h6{font-size: 12px; font-family:-webkit-body;}
    #dateWhile{font-size: 11px; font-family:-webkit-body; font-weight: 400;}
    select#selectDate {border: none;margin-top: 7px;font-weight: 400;}
    button#ticketing {width: 200px;height: 45px;border: none;background: red;border-radius: 5px;color: white;font-size: 1.1em;font-weight: bold;margin-top: 45px;  box-shadow: 6px 6px 8px 1px #a05260;}
    #selectDate > option{font-size: 10px;}
    .cancellationTable > th,td{height: 50px;}
    .cancellationTable  tr  th {background-color:#fbfbfb;}
    
    .cancellationTable{border-collapse: collapse;border-color: lightgray;}
    .booking{margin-bottom: 5px;}
    
    /* 다 없애고 수정해야 될 가능성이 있음(밤샘각) */
   ul{list-style:none;}
   .tabmenu{width:100%; margin: 0 auto; position:relative; }
   .tabmenu ul li{display:inline-block;width:25%; float:left;  text-align:center; background:#f2f4f7;line-height:40px;}
   .tabmenu label{display:block;width:100%; height:40px;line-height:40px;font-weight: 400;}
   .tabmenu input{display:none;}
   .tabCon{display:none; text-align:left; padding: 20px;position:absolute; left:0; top:40px; box-sizing:border-box;}
   div#tabConOne>div{margin-top:20px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}
   div#tabConTwo>div{margin-top:20px;padding-top:10px; width: 775px;border-top: 0.7px solid gray;font-weight: 400;}
   div#tabConFirth {width: 100%;height: 100%;}    
   img.performtit {margin-right: 5px;}
 
   .tabmenu input:checked ~ label{background:white;border: 0.2px solid #efe7e7; border-bottom: none;font-weight: bold;} 
   .tabmenu input:checked ~ .tabCon{display:block;}
   .box-more{background-color: #fafafa;padding: 25px 20px 25px 130px;}
   .tabmenu ul li { line-height: 30px;}
}
</style>
<script type="text/javascript" src="<c:url value ='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('button#ticketing').hover(function() {
			  $(this).css('box-shadow', '5px 5px 7px 1px #8952a0');	/* box-shadow: 6px 6px 8px 1px #a05260; */
			}, function(){
			  $(this).css('box-shadow', '');
			});
	});
</script>
 
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
               <li class="active"><a href="#contact-form">Contact Form</a></li>
               <li><a href="#subscription-form">Subscription Form</a></li>
               <li><a href="#video">Video Tutorial</a></li>
               <li><a href="#credit">Source and Credit</a></li>
               <li>
               <div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
            </ul>
         </nav>
      </aside>
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
   
   <!-- 페이지 만들떄마다 복붙 -->
   <!-- div안에서작업 그외엔 건들지말것 -->
   <div style="width: 87%;float: right;" class="pfdetail">
      
      <!----------구분---------->
      <h1 id="performtitle">공연 제목 영역</h1><br><hr>
      <div class="top1">
      <!-- 이미지는 디자인 때문에 넣어놨음  --><!-- API사용 뿌려줄거임  -->
      <img alt="포스터 이미지 보여주기" src="<c:url value='/resources/images/perform2.jpg' />"> 
                                                                           
      <div class="top2">
         <label id="performplace">공연장소</label>
         <span id="performplace">김포아트홀 기본 공연장</span>
         <br>
         
         <label id="performterm">공연기간</label>
         <span id="performterm">2020.01.17</span>~<span>2020.01.27</span>
         <br>
         
         <label id="limitage">입장연령</label>
         <span id = "limitage">전체관람가</span>
         <br>
         
         <label id="performtime">관람시간</label>
         <span id="performtime">120분</span>
         <br>
         
         <label id="performtype">장 르</label>
         <span id="performtype" class = "type">연 극</span>
         <br>
         
         <label id="ticketprice">티켓가격</label>
         <span id = "ticketprice">전석 30,000원</span>
         <br>
         
         <!-- 홈으로 -->
         <div id="home">
            <a href = "<c:url value = '#'/>">
               <img src="<c:url value ='/resources/images/home2.png'/>">
            </a>
         </div>
         
         <!-- 좋아요 -->
         <div id="like">
            <a href = "<c:url value= '#'/>">
               <img src="<c:url value ='/resources/images/like.png'/>">
            </a>
         </div>
         
         <!-- 좋아요 개수 -->
         <div id="likecount">
            <div>1000</div>
         </div>
         
         <div id = "calandar">
	         <div id="calandarSub">
	      		<h6>예매가능 공연 일자</h6>   
	         	<span id="dateWhile">2020.03.14 ~ 2020.04.19</span>
	         </div>
	         <select id="selectDate" size="10" style="width: 200px">
	         	<!-- 반복시작 -->
	         	<option value="1">요일:시간:남은 표 장수</option>	<!-- value==ticket_seq -->	<!-- 공연별 판매가능 수량 테이블의 티켓_seq를 참조 -->
	         	<option value="2">요일:시간:남은 표 장수</option>	<!-- value==ticket_seq -->	<!-- 공연별 판매가능 수량 테이블의 티켓_seq를 참조 -->
	         	<option value="3">요일:시간:남은 표 장수</option>	<!-- value==ticket_seq -->	<!-- 공연별 판매가능 수량 테이블의 티켓_seq를 참조 -->
	         	<!-- 반복 끝 -->
	         </select> 
	         
	         <button id="ticketing">예매하기></button>
         </div>
      </div>
      </div>
   </div>      
   
   <div style="width: 87%;float: right;" class="pfdetail">
      <div class="body">
         <div class="section"><!-- 영역만 조절해줌 -->
         <div class="tabmenu">
            <ul>
               <!-- 장소(Map_API) 지도는 건들지 말아주세요 -->
               <li id="tab4" class="btnCon">
               <input type="radio" checked name="tabmenu" id="tabmenu4"> 
               <label for="tabmenu4" style="margin-bottom: 0;" class = "lab">장소</label>
                  <div class="tabCon" id="tabConFirth">
                    <!-- MAP_API -->
                  <div id="map" style="width: 100%; height: 400px;"></div>
                  <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10fa2266e01525ae7b07ab1cc6053105"></script>
                  <script>
                     var mapContainer = document
                           .getElementById('map'), // 지도를 표시할 div 
                     mapOption = {
                        center : new kakao.maps.LatLng(37.52112,
                              127.12836360000005), // 지도 중심좌표
                        level : 4   // 지도 확대 레벨
                     };

                     var map = new kakao.maps.Map(mapContainer,
                           mapOption);

                     // 마커가 표시될 위치입니다 - API 작업 후 각 위도/경도 변경해줄겁니다.
                     var markerPosition = new kakao.maps.LatLng(
                           37.52112, 127.12836360000005);

                     // 마커를 생성합니다
                     var marker = new kakao.maps.Marker({
                        position : markerPosition
                     });

                     // 마커가 지도 위에 표시되도록 설정합니다
                     marker.setMap(map);
                     
                     //API 작업 후 - 위도/경도 변경 해줄겁니다.
                     var iwContent = '<div style="padding:5px;font-weight:bold">공연장소이름<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>',
                     // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                     iwPosition = new kakao.maps.LatLng(37.52112,
                           127.12836360000005); //인포윈도우 표시 위치입니다.

                     // 인포윈도우를 생성합니다
                     var infowindow = new kakao.maps.InfoWindow({
                        position : iwPosition,
                        content : iwContent
                     });

                     // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                     infowindow.open(map, marker);
                  </script>
                  <!-- MAP_API -->
   				  
   				  <h4 class="park">주차장</h4>
                  <div class="explainPark">
           	       	<div class="explainParkSub">
           	       		<h4 class="parkInfo"><mark>주차 안내</mark></h4>
           	       		<span id="explainParkImpl" class="explainParkImpl" style="line-height: 5px">
           	       		Delight 주차장은 상시 만차되며 공연장 주변의 교통이 매우 혼잡하여 주차에 많은 시간이 걸리오니
           	       		대중교통을 적극 이용해 주시기 바랍니다.
           	       		특히 공연장 특성상 공연 종료 후 한꺼번에 출차가 진행되어 출차 시간이 많이 걸리며 귀가시간에 지장이 있을 수 있습니다.
           	       		<br><br>또한 Delight 주차장 만차에 대비하여 인근 주차장 정보를 사전에 확인 후 방문해 주시기 바라며,
           	       		주차요금은 해당 주차장의 요금기준으로 <br>적용됩니다.<br><br>
           	       		
           	       		<mark>1.</mark> 주차장 운영시간 : 07:00~24:00(단, 공연 종료 시간에 따라 유동적으로 운영)<br>
           	       		 ※ 공연 종료 후 30분 이내 출차 부탁드립니다.<br>
           	       		 ※ 주말, 공휴일(2회공연)인 경우 낮공연을 관람하신 분들은 다음 공연괌람 손님을 위해 바로 출차 부탁드립니다.<br><br>
           	       		<mark>2.</mark> 주차요금 : 공연관람객에 한해 4시간 5,000원(4시간 초과 시 10분당 1,000원 부과)
           	       		<br><br>
           	       		<mark>3.</mark> 주차권 구매
           	       		 - Delight홈 : Delight홈 객석 2층 매표소 주차정산창구<br>
           	       		</span>
           	       	</div>
                  </div>
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
                     		<img class="performtit" src="<c:url value='/resources/images/time-and-date.png'/>">
                                                                화요일 ~ 금요일(20:00), 토요일(16:00,19:00), 일요일(15:00,18:00)
                         </span>
                     </div><br>
                     
                     <h2>포스터</h2>
                     <div>
                        <img id="mainposter" alt="포스터 보여주기" src="<c:url value = '/resources/images/theater.png'/>">
                     </div><br>
                     
                     <!-- Map이든, list든 똑같이 뿌려주시면 됩니다.  -->
                     <h2>공연 상세설명</h2> 
                     <div>
                        <table>
                           <colgroup>
                              <col style="width: 20%">
                              <col style="width: 20%">
                              <col style="width: 20%">
                              <col style="width: 20%">
                           </colgroup>
                        
                           <!-- td에 API데이터 가져오면 됨 -->
                           <tbody>
                              <tr>
                                 <th>주최</th>
                                 <td>하남예술회관</td>
                              </tr>
                              <tr>
                                 <th>등장인물</th>
                                 <td>김영민,정주리,유재석</td>
                              </tr>
                              <tr>
                                 <th>관람등급</th>
                                 <td>18세이상</td>
                              </tr>
                              <tr>
                                 <th>장소</th>
                                 <td>하남예술회관</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </li>
               
                <!-- 후기 -->
               <li id="tab3" class="btnCon">
               <input type="radio" name="tabmenu" id="tabmenu3" > 
               <label for="tabmenu3" style="margin-bottom: 0;" class = "lab">관람후기</label>
                  <div class="tabCon" id="tabConThree">
                  <div class="shownView">
                      <h2 class="review">관람후기</h2>
                 </div>
                 <div class="starRaite">
                     <img alt="별점이미지" src="<c:url value='/resources/images/star5.png'/>">    
                 </div>        
                   
                   <!-- 반복시작 -->
                   <div class="box-wrap">
                       <div class="box">
                             <div class="box-depth">
                                <div class="left">
                                   <span class="umail">youngmin1085@**</span>
                                </div>
                                <div class="right">
                                   <span class="tit">
                                      	말이 필요 없어요. 진짜 최고의 크리스틴, 팬텀, 라울입니다. 내한 해주셔서 정말
                                     </span>
                                   <p class="date">2020.01.15</p>
                                </div>
                                <div>
                                   <span class="star-rating">
                                      <!-- IF -->
                                      <img alt="별점이미지" src="<c:url value='/resources/images/star5_.png'/>">
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
                  
                   <!-- 샘플 데이터 삭제 시작 영역 -->
                   <!-- 반복시작 -->
                   <div class="box-wrap">
                       <div class="box">
                             <div class="box-depth">
                                <div class="left">
                                   <span class="umail">youngmin1085@**</span>
                                </div>
                                <div class="right">
                                   <span class="tit">말이 필요 없어요. 진짜 최고의 크리스틴, 팬텀, 라울입니다. 내한 해주셔서 정말</span>
                                   <p class="date">2020.01.15</p>
                                </div>
                                <div>
                                   <span class="star-rating">
                                      <!-- IF -->
                                      <img alt="별점이미지" src="<c:url value='/resources/images/star5_.png'/>">
                                      <!-- IF -->
                                   </span>
                                </div>
                             </div>
                            <!--  <div class="box-more" style="display: block;">
                                sub값
                             </div> -->
                       </div>
                     </div>
                  <!-- 반복 끝 -->
                  
                   <!-- 반복시작 -->
                   <div class="box-wrap">
                       <div class="box">
                             <div class="box-depth">
                                <div class="left">
                                   <span class="umail">youngmin1085@**</span>
                                </div>
                                <div class="right">
                                   <span class="tit">말이 필요 없어요. 진짜 최고의 크리스틴, 팬텀, 라울입니다. 내한 해주셔서 정말
                                      					감사합니다. 다음에도 꼭 와주세요!! 
                                   </span>
                                   <p class="date">2020.01.15</p>
                                </div>
                                <div>
                                   <span class="star-rating">
                                      <!-- IF -->
                                      <img alt="별점이미지" src="<c:url value='/resources/images/star5_.png'/>">
                                      <!-- IF -->
                                   </span>
                                </div>
                             </div>
                             <!-- <div class="box-more" style="display: block;">
                                sub값
                             </div> -->
                       </div>
                     </div>
                  <!-- 반복 끝 -->
                  <!-- 샘플 데이터 삭제 끝 영역 --> 
                     
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
                  		<span><mark style="color: red;font-weight: bold;">
                  			관람일 전일 (평일/주말/공휴일/토요일) 17:00시 
                  			</mark>취소가 마감됩니다.</span>
                  	</div>
    
                  	<div class="cancellationfee" style="border: none">
                  		<h4 style="font-weight: bold" class="booking">취소 수수료 안내</h4>
						<table class="cancellationTable" border="1" style="width:100%">
							<colgroup>
								<col style="width: 25%;">
								<col style="width: 80%;">
							</colgroup>

							<tr>
								<th scope="col">예매후~관람일 10일 전</th>
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
						<div>
							<span>예매 당일 밤 12시 이전 취소 시 취소수수료가 없으며 
							익일부터는 관람일까지의 기간에 따라 취소수수료가 부과됩니다.</span>
							<br><span>- 부분취소는 신용카드, 실시간계좌이체로 결제하신 건에 
							한하여 부분취소가 가능합니다.</span>
						</div>
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
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/perform1.jpg'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 우리연애할까</span><br>
                     </span>
                     <span>
                     <!-- stDate~endDate -->
                         <span class="util">2020.01.17</span>~<span>2020.01.27</span>   
                     </span>
                  </div>
               </li>
               <!-- 반복끝 -->
               
               <!-- 여기부터 로직 다 제거 할겁니다. --> 
               <!-- 샘플 데이터 -->
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/perform2.jpg'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 연애의발견</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/perform3.jpg'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 미이라</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/perform4.jpg'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 지킬 앤 하이드</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
               <li>
                  <div>
                     <span>
                        <a href = "<c:url value= '#'/>">
                              <img class ="imgbox" 
                                 width="208px" height="284px" src="<c:url value ='/resources/images/perform5.jpg'/>">
                        </a>
                     </span>
                     <span>
                        <span class="util">[공연명] : 캣츠</span><br>
                     </span>
                     <span>
                        <span class="util">2020.01.17</span>~<span>2020.01.27</span>
                     </span>
                  </div>
               </li>
            </ul>
            <!-- 여기까지 다 제거할겁니다. -->
            
         </div>
         </div>
      </div>
      
   <!-- div안에서작업 그외엔 건들지말것 -->   
<%@ include file="../inc/main2Bottom.jsp" %>
