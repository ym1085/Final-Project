<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/main2Top.jsp" %>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />

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
	
	<div style="width: 87%; float: right;">
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">후기</h2>
			
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:776px">
					<col style="width:150px">
					<col style="width:140px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">예매정보</th>
						<th id="heading" scope="col">내용</th>
						<th id="heading" scope="col">결제번호</th>
						<th id="heading" scope="col">후기종류</th>
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
						<td style="text-align: left;">
						<img style="height: 25px;" alt="" src="<c:url value='/resources/images/star5.png' />">
						<p style="margin-left: 15px;">&nbsp;&nbsp; 2020-01-22&nbsp;&nbsp; | &nbsp;&nbsp; 승인완료(100적립)</p>
						<p style="margin-top: 10px;">제목</p><br>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
						</td>
						<td style="text-align: center">000081234552-1121123</td>
						<td style="text-align: center">포토</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp" %>