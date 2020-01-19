<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<%--<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/myPage.css' />" />--%>

<style type="text/css">
	.mysecDiv{width: 100%; height: 100%;margin-left: 35px; margin-right: 20px; margin-top: 15px;}
	.mytit{margin-bottom: 20px;float: left;}
	.mytable{border-collapse: collapse;clear: both;}
	th#heading {border-top: 3px solid black;line-height: 2;border-bottom: 1.5px solid #a7a4a4;text-align: center;
	padding-top: 10px;padding-bottom: 10px;}
	.mytitSub {float: left;line-height: 2.5;margin-left: 76%;}
    #mybody > tr > td{border-bottom: 1px solid #f3ebeb;padding-left: 10px;}
	#mybody > tr{height: 120px;}
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
	<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">주문내역 조회</h2>
			
			<a class="mytitSub" href="#">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:275px">
					<col style="width:275px">
					<col style="width:275px">
					<col style="width:275px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">칼럼1</th>
						<th id="heading" scope="col">칼럼2</th>
						<th id="heading" scope="col">칼럼3</th>
						<th id="heading" scope="col">칼럼4</th>
						<th id="heading" scope="col">칼럼5</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
<%@ include file="../inc/main2Bottom.jsp" %>