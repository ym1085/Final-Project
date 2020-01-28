<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
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
			<h2 class="mytit">예매취소 내역</h2>

			<form name="frm1" method="post"
				action="<c:url value='/shop/order/orderList.do'/>">
				<!-- 조회기간 include -->
				<c:import url="imp/dateTerm.jsp"></c:import>
				<input type="submit" value="조회" id="listsubmit">
			</form>

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
						<th id="heading" scope="col">취소일시</th>
						<th id="heading" scope="col">상태</th>
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

					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>

					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>
		</div>
	</section>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>