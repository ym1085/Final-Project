<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/main2Top.jsp" %>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="1240">

	<link href="<c:url value='https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap' />" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/pfReservation.css' />" />

	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>

	<script language="javascript" type="text/javascript">
		$(function(){
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
		
				
			$('#ticketPriceSum').hover(function() {
				if($("#ticketPriceSum").val()!=''){
					$("#ticketPriceSum").attr("readonly", "readonly");
				}  
				
				$(this).css('box-shadow', '3px 1px 6px 2px lightgray');
			},function(){
				$(this).css('box-shadow', '');
			});
			
			
			//예매자명
			if($(".UndefinedUname").val()!=''){
				$(".UndefinedUname").attr("readonly", "readonly");
				$(".UndefinedUname").css("background-color", "#f6f3f3");
			}
			
			//예매자 이메일
			if($(".UndefinedUemail").val()!=''){
				$(".UndefinedUemail").attr("readonly", "readonly");
				$(".UndefinedUemail").css("background-color", "#f6f3f3");
			}
			
			if($(".infoBox").val()!=''){
				$(".infoBox").each(function(idx){
					$(this).attr("readonly", "readonly");
					$(this).css("background-color", "#f6f3f3");
				});
			}
			
			//결제진행 체크박스
			//Import결제창 진행을 위해 2개의 form태그를 submit해주는 이벤트
			$("#agreeBt2").click(function(){
				//예매자/관람자 정보 받기
				if($("input[name=unusername]").val()==''){
					alert("예매자명은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=unuseremail]").val()==''){
					alert("예매자 이메일은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=unusername2]").val()==''){
					alert("관람자명은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else if($("input[name=unuseremail2]").val()==''){
					alert("관람자 이메일은 반드시 입력되어야합니다.");
					event.preventDefault();
				}else {
					//약관 동의
					if($("#checkAgreeSub2").is(':checked') && $("#checkAgree2").is(':checked')) {
						if($("#ticketPriceSum").val()!='' && $("#ticketPriceSubmit").val()!=''){
							alert("결제를 진행하겠습니다!");
							$("#paymentImport").submit();
						}else {
							alert("티켓 수량과 가격을 선택하시지 않았습니다!");
						}
					}else {
						alert("이용약관에 동의하셔야 결제를 진행할 수 있습니다!");
						event.preventDefault();
					}
				}
			});
			
			//티켓 * 가격
			var t1=0;
			var t2=0;
			var t3=0;
			var t4=0;
			var total=0;	//티켓 * 가격 총합
		
			//티켓 수량을 위한 변수
			var tNum1=0;
			var tNum2=0;
			var tNum3=0;
			var tNum4=0;
			var tNumtotal=0; //티켓 수량 총합
			
			//퍼센트를 읽어와서 형 변환 후 진행
			var oneSub=$("#oneSub").html();
			var twoSub=$("#oneSub2").html();
			
			var oneSub=parseInt(oneSub);
			var twoSub=parseInt(twoSub);
			
			//alert(oneSub);	//값 안들어오면 이 곳 체크해보세요
			//alert(twoSub);	//값 안들어오면 이 곳 체크해보세요
			
			$("#choosePrice").change(function(){
				var selectNum = parseInt(this.value);	//티켓수량
				var netPrice = $("#netprice").val();	//정가
				
				//티켓 수량 관련
				tNum1 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t1 = selectNum * netPrice;
				total=t1+t2+t3+t4;
				
				salePrice = (oneSub+twoSub)/100
				totalDiscountPrice = total-total*salePrice;
				
				//티켓 가격 셋팅
				$("#ticketPriceSum").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmit").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
			
			//예술 관련 학교 및 학과 장학생 SELECT-OPTION CLICK
			$("#choosestPrice").change(function(){
				var selectNum = parseInt(this.value);  
				var stPrice = $("#stprice").val();
				
				//티켓 수량 관련
				tNum2 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t2 = selectNum * stPrice;
				total=t1+t2+t3+t4;
				
				salePrice = (oneSub+twoSub)/100
				totalDiscountPrice = total-total*salePrice;
				
				//티켓 가격 셋팅
				$("#ticketPriceSum").val(totalDiscountPrice+"원");

				//비상탈출구
				$("#ticketPriceSubmit").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
				
			//장애인 SELECT-OPTION CLICK
			$("#choosedisPrice").change(function(){
				var selectNum = parseInt(this.value);  
				var disprice = $("#disprice").val();
				
				//티켓 수량 관련
				tNum3 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t3 = selectNum * disprice;
				total=t1+t2+t3+t4;
				
				salePrice = (oneSub+twoSub)/100
				totalDiscountPrice = total-total*salePrice;
				
				//티켓 가격 셋팅
				$("#ticketPriceSum").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmit").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
			
			//기초 수급 대상자 SELECT-OPTION CLICK
			$("#choosedisPrice2").change(function(){
				var selectNum = parseInt(this.value);  
				var disprice = $("#disprice").val();
				
				//티켓 수량 관련
				tNum4 = selectNum;
				tNumtotal=tNum1+tNum2+tNum3+tNum4;
				
				//티켓 가격 관련
				t4 = selectNum * disprice;
				total=t1+t2+t3+t4;
				
				salePrice = (oneSub+twoSub)/100
				totalDiscountPrice = total-total*salePrice;
				
				//티켓 가격 셋팅
				$("#ticketPriceSum").val(totalDiscountPrice+"원");
				
				//비상탈출구
				$("#ticketPriceSubmit").val(totalDiscountPrice+"원");
				
				//티켓 수량 셋팅
				$("input[name=ticketCount]").val(tNumtotal);
			});
			
	});
	</script>
	
	<style type="text/css">
		.UndefinedUname{width: 200px;padding-left: 3px;border-radius: 3px;}
		.UndefinedUemail{width: 230px;padding-left: 3px;border-radius: 3px;}
		.UndefinedUname2{width: 200px;padding-left: 3px;border-radius: 3px;}
		.UndefinedUemail2{width: 230px;padding-left: 3px;border-radius: 3px;}
		#perfomplace{width: 250px;}
		input.infoBox {border-color: lightgray;}
		#ticketPriceSum {border: none;height: 25px;text-align: left;margin-top: -7px;margin-left: 6px;}
		#wonha{float:left;}
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
            </ul>
			</nav>
		</aside>
		<!-- left side -->
	</div>
	<!-- 페이지 만들떄마다 복붙 -->
	

	<!-- div안에서작업 그외엔 건들지말것 -->
	
<div style="width: 87%; float: right; height: 1194px;">
	<h1 class="reserTitle">비회원 예매하기</h1>
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
					<c:set var="tkPrice" value="${tkVo.netprice}"/>
					<c:set var="stPriceMid" value="${tkPrice * 60 / 100}"/> 		<!-- 3400 -->
					<c:set var="stPriceFinal" value="${tkPrice - stPriceMid}" />	<!-- 20000 - 3400 -->
					
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
					<input type="hidden" id="netprice" value="${tkVo.netprice}">					<!-- 정가 -->
					<input type="hidden" id="stprice" value="${stPriceFinalTotal}"> 				
					<input type="hidden" id="disprice" value="${disPriceFinalTotal}"> 
					<input type="hidden" id="gradeName" value="${membergrade['GRADE_NAME']}">
					
					<h3 class="per-q" id="s1">가격 선택 Choose a price</h3>
					<div class="per-a" id="s11">
					<div class="i11">
						<p>일반</p><p class="fp2">만19세~64세</p>
						
						<span class="A">
							<fnt:formatNumber value="${tkVo.netprice }" pattern="#,###"/>원
						</span>
						
						<select name="choosePrice" id="choosePrice" class="B">
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
						<span class="A">
							<fnt:formatNumber value="${stPriceFinalTotal}" pattern="#,###"/>원 
						</span>
						<select name="choosestPrice" id="choosestPrice" class="B" style="margin-left: 0px;">
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
						<span class="A">
							<fnt:formatNumber value="${disPriceFinalTotal}" pattern="#,###"/>원
						</span>
						<select name="choosedisPrice" id="choosedisPrice" class="B">
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
						<span class="A">
							<fnt:formatNumber value="${disPriceFinalTotal}" pattern="#,###"/>원 
						</span>
						<select name="choosedisPrice2" id="choosedisPrice2" class="B">
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
					
					<h3 class="per-q"  id="s2">예약자 및 관람 자 정보 Reservation and audience information</h3>
					<div class="per-a" id="s12">
						<form id="paymentImport" name="importSubmit" method="post" action="<c:url value='/performance/import.do'/>">
							<div class="i12">
								<span>★</span><p>예매자 정보 Reservation Information</p><br>
								<label>예매자명 Name</label>
								<input class="UndefinedUname" type="text" name="unusername"><br>
								
								<label>예매자 이메일 Ticket Email</label>
								<input class="UndefinedUemail" type="text" name="unuseremail">
							</div>
							<div class="i12">
								<span>★</span><p>관람자 정보 Audlence Information</p><br>
									<label>관람자명 Name</label>
									<input class="UndefinedUname2" type="text" name="unusername2"><br>
									
									<label>관람자 이메일  Spectator Email</label>
									<input class="UndefinedUemail2" type="text" name="unuseremail2">							
							</div>
							
							<!-- performentController로 데이터 전송하기 위해 숨겨두었습니다. ajax를 사용하면 될 것 같기는한데 우선은..-->
							<input type="hidden" name="ticketPriceSubmit" id="ticketPriceSubmit" value="">	
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
						</form>
					</div>
					
					<h3 class="per-q" id="s3">추가 할인 Additional discount</h3>
					<div class="per-a" id="s13">
					<div class="i11">
						<p>기본</p>
						<p class="fp2" id="normalPrice">기본</p>
						<span id="oneSub">5%</span>
						<span>적용</span>
					</div>
					<div class="i11">
						<p>특별할인</p>
						<c:if test="${empty ticketVo.detail}">
							<p class="fp2">현재 특별할인이 존재하지 않습니다</p>
						</c:if>
						
						<c:if test="${!empty ticketVo.detail}">
							<p class="fp2">
								${ticketVo.detail}
							</p>
						</c:if>
						
						<c:if test="${empty ticketVo.percent}">
							<span id="oneSub2">0%</span>	<!-- 할인율 받아와서 적용 -->
						</c:if>
					
						<c:if test="${!empty ticketVo.percent}">
							<span id="oneSub2">${ticketVo.percent}%</span>	<!-- 할인율 받아와서 적용 -->
						</c:if>	
						<span>적용</span>
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
		<p>관람일</p><br><span>${tkVo.prfdate } - ${tkVo.prfhour}</span>
	</div>
	<div class="payInfo3">
		<p>티켓금액</p><br>
			<!--<span id="ticketPriceSum" name="ticketPriceSum" value=""></span>-->										<!-- 유저가 정한 티켓 총 가격 -->
			<p id="wonha">￦</p><input type="text" name="ticketPriceSum" id="ticketPriceSum" value="0원">							<!-- 티켓가격 -->
	</div>
	<div class="payInfo4">
		<p>취소수수료</p><br>
		<span>★ (관람10일전) 수수료없음</span><br>
		<span>★ (관람 9~ 7일전) 티켓금액의10%</span><br>
		<span>★ (관람 6~ 3일전) 티켓금액의20%</span><br>
		<span>★ (관람 2~ 1일전) 티켓금액의30%</span><br>
	</div>
	<div class="payInfo6">
		<input type="checkbox" id="checkAgree2"><label>취소수수료 및 취소기한을 확인 하였으며 동의합니다.</label><br>
		<input type="checkbox" id="checkAgreeSub2"><label>개인정보 제 3자가 제공에 동의합니다.</label>
	</div>
	<div class="payInfo7">
		<input type="button" name="agreeBt2" id="agreeBt2" value="결제하기 Place your payment">
	</div>
	<div class="payInfo8">
	<p>
	신용카드, 실시간 계좌이체로 결제하신 경우에만 부분취소 불가능합니다.<br>
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
    