<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/main2Top.jsp" %>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="1240">

	<link href="<c:url value='https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap' />" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/pfReservation.css' />" />

	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>

	<script language="javascript" type="text/javascript">
		$(function(){
			//회원권 구매
			$("#memberShip").click(function(){
				window.open(ctx+"/member/mymemberShip.do","맴버십 구입",
				"width=650,height=500,left=500,top=250,location=yes,resizable=yes");
			}); 
			
			var usermileage=$("#mileage").html();
			//alert(usermileage);
			
			mileagePoint = parseInt(usermileage);
			
			$("#checkM").click(function(){
				tmp = $('[id=checkM]').is(':checked'); 
				
				if(tmp==true){
					$("#mileagePoint").val(mileagePoint);
				}else if(tmp==false){
					$("#mileagePoint").val(0);
				}
			});
			
			//per slider
			$(".per-q").on("click", function(){
				var $q = $(this);
				var $ct = $(this).next(".per-a");
				$(".per-a").not($ct).slideUp('fast', function(){
					$(".per-q").not($q).removeClass("on");
				});
				$q.toggleClass("on");
				$ct.stop().slideToggle('fast');
			});
			
			//[1]
			$('#ticketPriceSumUser').hover(function() {
				if($("#ticketPriceSumUser").val()!=''){
					$("#ticketPriceSumUser").attr("readonly", "readonly");
				}
				
				$(this).css('box-shadow', '3px 1px 6px 2px lightgray');
			},function(){
				  $(this).css('box-shadow', '');
			});
			
			
			//예매자명
			if($(".username").val()!=''){
				$(".username").attr("readonly", "readonly");
				$(".username").css("background-color", "#f6f3f3");
			}
			
			//예매자 이메일
			if($(".useremail").val()!=''){
				$(".useremail").attr("readonly", "readonly");
				$(".useremail").css("background-color", "#f6f3f3");
			}
			
			if($(".infoBox").val()!=''){
				$(".infoBox").each(function(idx){
					$(this).attr("readonly", "readonly");
					$(this).css("background-color", "#f6f3f3");
				});
			}
			
			//결제진행 체크박스
			//Import결제창 진행을 위해 2개의 form태그를 submit해주는 이벤트
			$("#agreeBt").click(function(){
				//예매자/관람자 정보 받기
				if($("input[name=username]").val()==''){
					alert("예매자명은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=useremail]").val()==''){
					alert("예매자 이메일은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=username2]").val()==''){
					alert("관람자명은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=useremail2]").val()==''){
					alert("관람자 이메일은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else {
					//약관 동의
					if($("#checkAgree").is(':checked') && $("#checkAgreeSub").is(':checked')) {
						if($("#ticketPriceSumUser").val()!='' && $("#ticketPriceSubmitUser").val()!=''){
							alert("결제를 진행하겠습니다!");
							$("#paymentimport").submit();
						}else {
							alert("티켓 수량과 가격을 선택하시지 않았습니다!");
						}
					}else {
						alert("이용약관에 동의하셔야 결제를 진행할 수 있습니다!");
						event.preventDefault();
					}
				}
			});
			
			
			//티켓 가격 총합 
			var t1=0;
			var t2=0;
			var t3=0;
			var t4=0;
			var total=0;
			
			//티켓 수량 총합
			var tNum1=0;
			var tNum2=0;
			var tNum3=0;
			var tNum4=0;
			var tNumtotal=0; 
			
			var one=$(".one").html();
			var two=$(".one2").html();
			var three=$(".one3").html();
			var four=$(".one4").html();
			var mileage=$("#mileage").html();
			
			var one = parseInt(one);
			var two = parseInt(two);
			var three = parseInt(three);
			var four = parseInt(four);
			var five = parseInt(mileage);
			
			var salePrice = 0;
			var totalDiscountPrice = 0;
			var tmp = false;
			
			$("#checkM").click(function(){
				tmp = $('[id=checkM]').is(':checked'); 
				//alert(tmp);
			});
			
			$("#choosePricepf").change(function(){
				var selectNum = parseInt(this.value);  
				var netPrice = $("#netprice").val();
				
				//티켓 수량 관련
				tNum1 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t1 = selectNum * netPrice;
				total=t1+t2+t3+t4;
				
				if(tmp==true) {
					if(selectNum==0){
						salePrice = (one+two+three+four)*0
						totalDiscountPrice = total-total*salePrice;
					}else {
						salePrice = (one+two+three+four)/100
						totalDiscountPrice = (total-total*salePrice)-five;
					}
				}else if(tmp==false){
					salePrice = (one+two+three+four)/100
					totalDiscountPrice = total-total*salePrice;
				}
		
				//티켓 가격 셋팅
				$("#ticketPriceSumUser").val(totalDiscountPrice+"원");
				
				//For submit to store
				$("#ticketPriceSubmitUser").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
			
			//예술 관련 학교 및 학과 장학생 SELECT-OPTION CLICK
			$("#choosePricepfst").change(function(){
				var selectNum = parseInt(this.value);  
				var stPrice = $("#stprice").val();
				
				//티켓 수량 관련
				tNum2 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t2 = selectNum * stPrice;
				total=t1+t2+t3+t4;

				if(tmp==true) {
					if(selectNum==0){
						salePrice = (one+two+three+four)*0
						totalDiscountPrice = total-total*salePrice;
					}else {
						salePrice = (one+two+three+four)/100
						totalDiscountPrice = (total-total*salePrice)-five;
					}
				}else if(tmp==false){
					salePrice = (one+two+three+four)/100
					totalDiscountPrice = total-total*salePrice;
				}
		
				//티켓 가격 셋팅
				$("#ticketPriceSumUser").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmitUser").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
				
			//장애인 SELECT-OPTION CLICK
			$("#choosePricedis").change(function(){
				var selectNum = parseInt(this.value);  
				var disprice = $("#disprice").val();
				
				//티켓 수량 관련
				tNum3 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				t3 = selectNum * disprice;
				total=t1+t2+t3+t4;
	
				if(tmp==true) {
					if(selectNum==0){
						salePrice = (one+two+three+four)*0
						totalDiscountPrice = total-total*salePrice;
					}else {
						salePrice = (one+two+three+four)/100
						totalDiscountPrice = (total-total*salePrice)-five;
					}
				}else if(tmp==false){
					salePrice = (one+two+three+four)/100
					totalDiscountPrice = total-total*salePrice;
				}
		
				//티켓 가격 셋팅
				$("#ticketPriceSumUser").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmitUser").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
			
			//기초 수급 대상자 SELECT-OPTION CLICK
			$("#choosePricedis2").change(function(){
				var selectNum = parseInt(this.value);  
				var disprice = $("#disprice").val();
				
				//티켓 수량 관련
				tNum4 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
		
				//티켓 가격 관련 
				t4 = selectNum * disprice;
				total=t1+t2+t3+t4;
	
				
				if(tmp==true) {
					if(selectNum==0){
						salePrice = (one+two+three+four)*0
						totalDiscountPrice = total-total*salePrice;
					}else {
						salePrice = (one+two+three+four)/100
						totalDiscountPrice = (total-total*salePrice)-five;
					}
				}else if(tmp==false){
					salePrice = (one+two+three+four)/100
					totalDiscountPrice = total-total*salePrice;
				}
				
				//티켓 가격 셋팅
				$("#ticketPriceSumUser").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmitUser").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
		});
	</script>
	
	<style>
		.username{width: 200px;padding-left: 2px;border-radius: 3px;}
		.useremail{width: 230px;padding-left: 2px;border-radius: 3px;}
		.username2{width: 200px;padding-left: 2px;border-radius: 3px;}
		.useremail2{width: 230px;padding-left: 2px;border-radius: 3px;}
		#perfomplace{width: 250px;}
		input.infoBox {border-color: lightgray;}
		#ticketPriceSumUser{border: none;height: 25px;text-align: left;margin-top: -7px;margin-left: 6px;}
		#wonha2{float:left;}
		input:focus { outline: none;}
		#choosePricepfst{margin-left: 0px;}
	</style>
	
	<!-- 페이지 만들떄마다 복붙 -->

	<div style="width: 13%; float: left; height: 100%;">
		<!-- left side -->
		<aside class="left-sidebar" style="width: 13%;">
			<div class="logo" style="margin-bottom: 63%;">
				<a href="<c:url value='/index.do'/>"
					style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
					Delight </a>
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
	</div>
	<!-- 페이지 만들떄마다 복붙 -->

	<!-- div안에서작업 그외엔 건들지말것 -->
	
<div style="width: 87%; float: right; height: 1194px;">
	<h1 class="reserTitle">회원 예매하기</h1>
	<hr>
<div class="MentInfo">
	<input class="infoBox" id ="perfomplace" type="text" name="fcltynm" value="${param.fcltynm }">				<!-- 공연장소 -->
	<input class="infoBox" type="text" name="prfnm" value="${param.prfnm }">									<!-- 공연제목 -->
	<input class="infoBox" type="text" name="genrenm" value="${param.genrenm }">								<!-- 공연타입 -->
	<input class="infoBox" type="text" name="prfdate" value="${tkVo.prfdate }">									<!-- 공연날짜 -->			
	<input class="infoBox" type="text" name="prfhour" value="${tkVo.prfhour }">									<!-- 공연시간 -->
	
</div>

 <div id="pfReservation">
	
	<div class="inner">
		<!-- Board pfReservation -->
			<div class="board-pfReservation">
				<!-- 일반 게시판 리스트 -->
				<div class="per-list">
					<!-- <p class="no-ct">등록된 게시물이 없습니다.</p> -->
					<c:set var="tkPrice" value="${tkVo.netprice}"/>
					<c:set var="stPriceMid" value="${tkPrice * 60 / 100}"/> 		
					<c:set var="stPriceFinal" value="${tkPrice - stPriceMid}" />	
					
					<!-- 소수 나머지 자리 제거 -->
					<fmt:parseNumber var="stPriceFinalTotal" integerOnly="true" value="${stPriceFinal}"/>
					
					<!-- 학생가 할인 17% 가격 -->
					<%-- <c:out value="${stPriceFinalTotal}"/> --%>
					
					<c:set var="disPriceMid" value="${tkPrice * 50 / 100}" />
					<c:set var="disPriceFinal" value="${tkPrice - disPriceMid}" />
					
					<!-- 소수 나머지 자리 제거 -->
					<fmt:parseNumber var="disPriceFinalTotal" integerOnly="true" value="${disPriceFinal}"/>
					
					<!-- 장애인/기초수급대상자 50% -->
					<%-- <c:out value="${disPriceFinalTotal }"/> --%>
					
					<!-- 여기 지우지 마세요 -->
					<input type="hidden" id="netprice" value="${tkVo.netprice}">
					<input type="hidden" id="stprice" value="${stPriceFinalTotal}"> 
					<input type="hidden" id="disprice" value="${disPriceFinalTotal}"> 
					<input type="hidden" id="gradeName" value="${membergrade['GRADE_NAME']}">
			
					<h3 class="per-q" id="s1">가격 선택 Choose a price</h3>
					<div class="per-a" id="s11">
					<div class="i11">
						<p>일반</p><p class="fp2">만19세~64세</p>
						<span>
							<fnt:formatNumber value="${tkVo.netprice }" pattern="#,###"/>원
						</span>
						<select name="choosePricepf" id="choosePricepf" class="selectOne">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
					<div class="i11">
						<p>예술 관련 학교 및 학과 재학생 (현장 확인)</p><p class="fp2">학생증지참</p>
						<span>
							<fnt:formatNumber value="${stPriceFinalTotal}" pattern="#,###"/>원
						</span>
						<select style="margin-left:0px;" name="choosePricepfst" id="choosePricepfst" class="selectOne">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
					<div class="i11">
						<p>장애인</p><p class="fp2">1~3급 장애인 [현장에서 신분증 확인 필요]</p>
						<span>
							<fnt:formatNumber value="${disPriceFinalTotal}" pattern="#,###"/>원
						</span>
						<select name="choosePricedis" id="choosePricedis" class="selectOne">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
					<div class="i11">
						<p>기초수급대상자</p><p class="fp2"># 증빙서류 지참</p>
						<span>
							<fnt:formatNumber value="${disPriceFinalTotal}" pattern="#,###"/>원 
						</span>
						
						<select name="choosePricedis2" id="choosePricedis2" class="selectOne">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select>
					</div>
				</div>

					<!-- 넘겨주지 않아도 될듯 -->					
					<h3 class="per-q"  id="s2">예약자 및 관람 자 정보 Reservation and audience information</h3>
					<div class="per-a" id="s12">
						<div class="i12">
						<form id="paymentimport" name="importSubmit" method="post" action="<c:url value='/performance/importuser.do'/>">
								<span>★</span><p>예매자 정보 Reservation Information</p><br>
								<label>예매자명 Name</label>
								<input class="username" type="text" name="username" value="${memberVo.username }"><br>
								
								<label>예매자 이메일 Ticket Email</label>
								<input class="useremail" type="text" name="useremail" value="${email}">
							</div>
							<div class="i12">
								<span>★</span><p>관람자 정보 Audlence Information</p><br>
								<label>관람자명 Name</label>
								<input class="username2" type="text" name="username2"><br>
								
								<label>관람자 이메일  Spectator Email</label>
								<input class="useremail2" type="text" name="useremail2">							
							</div>
						
							<!-- performentController로 데이터 전송하기 위해 숨겨두었습니다. ajax를 사용하면 될 것 같기는한데 우선은..-->
							<input type="hidden" name="ticketPriceSubmitUser" id="ticketPriceSubmitUser" value="">		
							<input type="hidden" name="mt20id" value="${param.mt20id }">												<!-- 공연id -->
							<input type="hidden" name="mt10id" value="${param.mt10id }">												<!-- 공연시설id -->
							<input type="hidden" name="prfdate" value="${tkVo.prfdate }">												<!-- 공연날짜 -->
							<input type="hidden" name="prfhour" value="${tkVo.prfhour }">												<!-- 공연시간 -->
							<input type="hidden" name="ticketCount" value="">															<!-- 티켓수량 --> 
							<input type="hidden" name="fcltynm" value="${param.fcltynm }">												<!-- 공연장소 -->
							<input type="hidden" name="prfnm" value="${param.prfnm }">													<!-- 공연제목 -->
							<input type="hidden" name="genrenm" value="${param.genrenm }">												<!-- 공연타입 -->
							<input type="hidden" name="ticketSeq" value="${tkVo.ticketSeq }">											<!-- 티켓SEQ --> 			
							<input type="hidden" name="ticketSeat" value="${tkVo.sellclass }">											<!-- 선택한 좌석 SEQ-->
							<input type="hidden" name="mileagePoint" id="mileagePoint" value="0">										<!-- 해당 유저의 마일리지 포인트 -->
						</form>
					</div>
					
					<h3 class="per-q" id="s3">추가 할인 Additional discount</h3>
					<div class="per-a" id="s13">
					<div class="i11">
						<p>기본</p>
						<p class="fp2" id="normalPrice">기본</p>
						<span class="one">5%</span>
						<span>적용</span>
					</div>
					<div class="i11">
						<p>특별할인</p>
						<c:if test="${empty ticketVo.detail}">
							<p class="fp2">현재 특별할인이 존재하지 않습니다</p>
						</c:if>
						
						<c:if test="${!empty ticketVo.detail}">
							<p class="fp2">${ticketVo.detail}</p>
						</c:if>
						
						<c:if test="${empty ticketVo.percent}">
							<span class="one2">0%</span>	<!-- 할인율 받아와서 적용 -->
						</c:if>
					
						<c:if test="${!empty ticketVo.percent}">
							<span class="one2">${ticketVo.percent}%</span>	<!-- 할인율 받아와서 적용 -->
						</c:if>	
						<span>적용</span>
					</div>
					<div class="i11">
						<p>등급할인</p>
						<p class="fp2">
							<c:if test="${empty membergrade['GRADE_NAME']}">
								현재등급 : <mark style="background-color:#fdfd6b; color: black;">회원 등급이 존재하지 않습니다.</mark> 
							</c:if>
							
							<c:if test="${!empty membergrade['GRADE_NAME']}">
								현재등급 : <mark style="background-color:#fdfd6b; color: black;">${membergrade['GRADE_NAME']}</mark> 
							</c:if>
						</p>
						
						<span class="one3">${membergrade['GRADE_BENEFIT']}%</span> <!-- -->
						<span>적용</span>
					</div>
					<div class="i11">
						<p>회원권 할인</p>
							<c:if test="${empty map_membership['NAME']}">
								<p class="fp2">
									회원권 : <mark id="memberShip" style="background-color:#fdfd6b; color: black;">
												회원권 구매로 이동
										   </mark>
								</p>
								<span class="one4">0%</span>
							</c:if>
							
							<c:if test="${!empty map_membership['NAME']}">
								<p class="fp2">
									회원권 : <mark id="memberShip" style="background-color:#fdfd6b; color: black;">
										${map_membership['NAME']}
									</mark>
								</p>
							
								<span class="one4">10%</span>
							</c:if>
						<span>적용</span>
					</div>
					<div class="i11">
						<p>마일리지 사용</p>
						<p class="fp2">
							<c:if test="${empty memberVo.mileagePoint}">
								소유하신마일리지 : <mark id="mileage" style="background-color:#fdfd6b; color: black">0</mark> 
							</c:if>
							
							<c:if test="${!empty memberVo.mileagePoint}">
								소유하신마일리지 : <mark id="mileage" style="background-color:#fdfd6b; color: black">${memberVo.mileagePoint}</mark> <!--  --> 
							</c:if>
						</p>
						<input type="checkbox" id="checkM" name="checkbox"><span>적용</span>	<!--  -->
					</div>
					</div>
				</div>
			</div>

 </div><!--END Wrap-->
</div>
<div class="Rightpayment">
	<div class="payInfo1">
		[클래식/무용]LOOK_Second Sight
	</div>
	<div class="payInfo2">
		<p>관람일</p><br><span>${tkVo.prfdate} - ${tkVo.prfhour}</span>
	</div>
	<div class="payInfo3">
		<p>티켓금액</p><br>
		<!-- <span id="ticketPriceSumUser"></span> -->
		<p id="wonha2">￦</p><input type="text" name="ticketPriceSumUser" id="ticketPriceSumUser" value="">	
	</div>
	<div class="payInfo4">
		<p>취소수수료</p><br>
		<span>★ (관람10일전) 수수료없음</span><br>
		<span>★ (관람 9~ 7일전) 티켓금액의10%</span><br>
		<span>★ (관람 6~ 3일전) 티켓금액의20%</span><br>
		<span>★ (관람 2~ 1일전) 티켓금액의30%</span><br>
	</div>
	<div class="payInfo6">
		<input type="checkbox" id="checkAgree" name="checkAgree"><label>취소수수료 및 취소기한을 확인 하였으며 동의합니다.</label><br>
		<input type="checkbox" id="checkAgreeSub" name="checkAgreeSub"><label>개인정보 제 3자가 제공에 동의합니다.</label>
	</div>
	<div class="payInfo7">
		<form name="importSubmit" method="post" action="<c:url value='/performance/import.do'/>">
			<input type="button" name="agreeBt" id="agreeBt" value="결제하기 Place your payment">
		</form>
	</div>
	<div class="payInfo8">
	<p>
	신용카드, 실시간 계좌이체로 결제하신 경우에만 부분취소 가능합니다.<br>
	결제 진행 중 취소 후 재 진행 시 다른 사용자의 예매로 인해 동일 좌석의 재예매가 불가할 수 있습니다.<br>
	가상계좌로 결제하신 경우 예매변경 및 부분 취소 불가하므로 전체 취소 후 재예매해야 합니다.<br>
	예매취소 시 시점에 따라 수수료가 부과되므로 취소 가능기한 및 취소수수료를 꼭 확인해주십시오.
	</p>
	</div>
</div>
</form>
</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
<%@ include file="../inc/main2Bottom.jsp" %>
    