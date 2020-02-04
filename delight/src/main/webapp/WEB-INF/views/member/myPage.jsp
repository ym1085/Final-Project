<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/mysec.css' />"/>


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
	
	<div style="width: 87%; float: right;margin-top: 35px;">
		<h1 class="mysecTitle">마이 페이지</h1>
	<hr class="mysecLine">
	<c:import url="/member/imp/mysec.do"></c:import>
	<c:import url="/member/imp/mysecCan.do"></c:import>
	<c:import url="/member/imp/myinquery.do"></c:import>
	<c:import url="/member/imp/myreview.do"></c:import>
	<c:import url="/member/imp/mylike.do"></c:import>
	<c:import url="/member/imp/mynewPer.do"></c:import>
	<c:import url="/member/imp/myMileage.do"></c:import>	<!-- 적립 내역  -->
	
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
<%@ include file="../inc/main2Bottom.jsp" %>