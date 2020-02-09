<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/review.css' />" />
	
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


<div style="width: 87%; float: right;">

	<section class="mysec">
	<form action="<c:url value='/member/PromotionReview.do' />" method="post" name="reviewfrm" enctype="multipart/form-data">
		<div class="mysecDiv">
		<div class="writeReview">
			<h2 class="mytit">관람했던 공연 홍보하기</h2>
			<input type="hidden" value="2" name="reviewType">
			<input type="hidden" value="${param.reservationSeq }" name="reservationSeq">
			<input type="hidden" value="${vo.mt20id }" name="reviewMt20id">
			<input type="hidden" value="50" id="reviewMg" name="reviewMileage">
		</div>
		<div class="writeReview2">
			<p>- 작성된 홍보는 Delight 콘텐츠로 사용될 수 있습니다.<br>
			   - 등록하신 홍보는 회원 본인과 관리자만 열람 가능합니다.<br>
			   - 마일리지가 지급된 홍보는 수정 불가능하며 신중하게 작성 부탁드립니다.</p>
		</div>
		<div class="writeReview3">
		<img alt="" src="${poster }">
		<p class="mybodyP">${vo.perfomtype }<br>${vo.prfnm }</p>
		</div>
		<div class="writeReview5">
		<p class="filesear">- 홍보하실 공연의 제목을 입력해주세요.</p>
		<input type="text" maxlength="30" id="inqueryTitle" name="reviewTitle" value=""/>
		</div>
		<p class="contenttitle">
		<input type="file" name="reviewPho1" id="file1" value="">
		<input type="button" id="fileM" value="-">
		<input type="button" id="fileP" value="+">
		<input type="hidden" id="filelength" name="fileLength" value="1">
		<span class="fileError">* 이미지파일은 JPG,PNG만 등록이가능합니다.</span><br><br>
		<span  class="filesear">- 홍보하실 공연의 내용을 작성 해 주세요.(10자이상)</span>
		</p>
		<div class="writeReview6">
		<textarea id="inqueryContent" name="reviewContent"></textarea>
		<!-- keyUp걸기 -->
		<p class="review6info"><span class="chklength">0</span>자 / 20자 이상</p>
		</div>
		<div class="writeReview7">
		<input type="submit" value="등록하기" class="infoWrite">
		</div>
		</div>
		</form>
	</section>
	
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>