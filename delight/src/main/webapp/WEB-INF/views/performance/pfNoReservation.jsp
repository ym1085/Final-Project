<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		});
		
	</script>
	
	<!-- 페이지 만들떄마다 복붙 -->
	<div style="width: 13%; float: left; height: 100%;">
		<!-- left side -->
		<aside class="left-sidebar" style="width: 13%;">
			<div class="logo" style="margin-bottom: 63%;">
				<a href="#welcome"
					style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
					Delight </a>
			</div>

			<nav class="left-nav" style="margin-top: 100%;">
				<ul id="nav">
					<li class="active"><a href="#contact-form">Contact Form</a></li>
					<li><a href="#subscription-form">Subscription Form</a></li>
					<li><a href="#video">Video Tutorial</a></li>
					<li><a href="#credit">Source and Credit</a></li>
					<li>
					<div
					style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
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
<form>
<div class="MentInfo">
	<input type="text">
	<input type="text">
	<input type="text" id="title">
	<input type="text">
	<input type="text">
</div>
 <div id="pfReservation">
	
	<div class="inner">

		<!-- Board pfReservation -->
			<div class="board-pfReservation">
				<!-- 일반 게시판 리스트 -->
				<div class="per-list">
					<!-- <p class="no-ct">등록된 게시물이 없습니다.</p> -->

					<h3 class="per-q" id="s1">가격 선택 Choose a price</h3>
					<div class="per-a" id="s11">
					<div class="i11">
						<p>일반</p><p class="fp2">만19세~64세</p><span>20,000원</span>
						<select>
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
						<p>예술 관련 학교 및 학과 재학생 (현장 확인)</p><p class="fp2">학생증지참</p><span>8,000원</span>
						<select>
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
						<p>장애인</p><p class="fp2">1~3급 장애인 [현장에서 신분증 확인 필요]</p><span>10,000원</span>
						<select>
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
						<p>기초수급대상자</p><p class="fp2"># 증빙서류 지참</p><span>10,000원</span>
						<select>
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
						<div class="i12">
							<span>★</span><p>예매자 정보 Reservation Information</p><br>
							<label>예매자명 Name</label><input type="text"><br>
							<label>예매자 이메일 Ticket Email</label><input type="text">
						</div>
						<div class="i12">
							<span>★</span><p>관람자 정보 Audlence Information</p><br>
							<label>관람자명 Name</label><input type="text"><br>
							<label>관람자 이메일  Spectator Email</label><input type="text">							
						</div>
					</div>
					
					<h3 class="per-q" id="s3">추가 할인 Additional discount</h3>
					<div class="per-a" id="s13">
					<div class="i11">
						<p>기본</p><p class="fp2">기본</p><span>5%</span>
						<span>적용완료</span>
					</div>
					<div class="i11">
						<p>특별할인</p><p class="fp2">얼리버드</p><span>5%</span>
						<span>적용완료</span>
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
		<p>관람일</p><br><span>2020.01.18(토) 19:00</span>
	</div>
	<div class="payInfo3">
		<p>티켓금액</p><br><span>￦ 0 원</span>
	</div>
	<div class="payInfo4">
		<p>취소수수료</p><br>
		<span>★ (관람10일전) 수수료없음</span><br>
		<span>★ (관람 9~ 7일전) 티켓금액의10%</span><br>
		<span>★ (관람 6~ 3일전) 티켓금액의20%</span><br>
		<span>★ (관람 2~ 1일전) 티켓금액의30%</span><br>
	</div>
	<div class="payInfo5">
		<p>결제수단</p>
		<select>
			<option>신용카드</option>
			<option>계좌이체</option>
			<option>무통장입금</option>
		</select>
	</div>
	<div class="payInfo6">
		<input type="checkbox"><label>취소수수료 및 취소기한을 확인 하였으며 동의합니다.</label><br>
		<input type="checkbox"><label>개인정보 제 3자가 제공에 동의합니다.</label>
	</div>
	<div class="payInfo7">
		<input type="submit" value="결제하기 Place your payment">
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
    