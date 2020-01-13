<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<style type="text/css">
.top1 {
    height: 450px;
    padding: 30px;
    width: 75%;
    margin: 30px;
}

.top2 {
    height: 100%;
    width: 400px;
    float: left;
    margin-left: 15px;
}
.top1>img {
    height: 100%;
    width: 250px;
    float: left;
}
.top2>div{
	border: 1px solid black;
	width: 10px;
	height: 50px;
	margin-right: 50px;
}
</style>
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
		<h1 id="title">제목:명숙씨와아이들</h1><br>
		<hr>
		<div class="top1" style="border: 1px solid black;">
		<img alt="" src="<c:url value='/resources/images/del3.jpg' />">
		<div class="top2">
			<label>공연장소</label><p>[이젠]컴퓨터학원</p><br>
			<label>공연장소</label><p>[이젠]컴퓨터학원</p><br>
			<label>공연장소</label><p>[이젠]컴퓨터학원</p><br>
			<label>공연장소</label><p>[이젠]컴퓨터학원</p><br>
			<label>공연장소</label><p>[이젠]컴퓨터학원</p><br>
			<div class="top2home"></div><div class="top2love"></div>
		</div>
		</div>
	</div>		
	<!-- div안에서작업 그외엔 건들지말것 -->	
<%@ include file="../inc/main2Bottom.jsp" %>