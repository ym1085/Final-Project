<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />

<%@ include file="../inc/main2Top.jsp"%>

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
						style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div>
				</li>
			</ul>
		</nav>
	</aside>
	<!-- left side -->
</div>
<!-- 페이지 만들떄마다 복붙 -->

<!-- div안에서작업 그외엔 건들지말것 -->

<div style="width: 87%; float: right;">
	<section class="mysec" style="margin-top: 5%;">
		<div class="mysecDiv">
			<h2 class="mytit">예매 취소</h2>
			<dl class="cansledl"><dt>결제번호</dt><dd>123123<dd><dt>결제일자</dt>124124124</dl>
			<table class="mytable">
				<colgroup>
					<col style="width: 350px">
					<col style="width: 159px">
					<col style="width: 185px">
					<col style="width: 275px">
					<col style="width: 275px">
					<col style="width: 140px">
				</colgroup>

				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">예매일</th>
						<th id="heading" scope="col">예매번호</th>
						<th id="heading" scope="col">매수/가격</th>
						<th id="heading" scope="col">관람일시</th>
						<th id="heading" scope="col">좌석</th>
					</tr>
				</thead>

				<tbody id="mybody">
					<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">
							<div>
								<img alt="" src="<c:url value='/resources/images/del3.jpg' />">
							</div>
							<p class="mybodyP">내용</p>
						</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>
			
			<div class="canslereser2">
			 취소사유
			</div>
			<div class="cansleList2">
 			<label class="cansleTitle">환불사유 선택해주세요.</label> 
			<input type="radio"> <label>사유1</label>
			<input type="radio"> <label>사유1</label>
			<input type="radio"> <label>사유1</label>
			<input type="radio"> <label>사유1</label>
			</div>
			
			<div class="canslereser">
			결제금액
			</div>
			<div class="cansleList_layout">
			<div>
			<div class="cansleList">
 			<label class="cansleTitle">주문합계</label> <p>얼마?</p>
			</div>
			<div class="cansleList">
 			<label class="cansleTitle">기본할인</label> <p class="gkfdls">얼마?</p>
			</div>
			<div class="cansleList">
 			<label class="cansleTitle">마일리지사용</label> <p class="gkfdls">얼마?</p>
			</div>
			<div class="cansleList">
 			<label class="cansleTitle">등급할인</label> <p class="gkfdls">얼마?</p>
			</div>
			<div class="cansleList">
 			<label class="cansleTitle">회원권</label> <p class="gkfdls">얼마?</p>
			</div>
			<div class="cansleList">
 			<label class="cansleTitle">최종금액</label> <p>얼마?</p>
			</div>
			</div>
			<div class="MycanInfo">
				
			</div>
			</div>
			<label class="cansletjfaud"> - 주문취소 후 마일리지는 즉시 반환되며 다시 사용하실 수 있습니다.</label><br>
			<input type="submit" class="cansleSub" value="취소하기">
		</div>
	</section>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>