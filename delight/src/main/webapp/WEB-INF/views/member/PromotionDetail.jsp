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
				<h2 class="mytit">나의 홍보내역</h2>
			</div>
			<br><br>
			
			<div class="writeReview6" style="height:600px;">
				<p class="contenttitle">
				<span  class="filesear">제목  :  </span> <span >${vo.promoteTitle}</span><br><br>
				<span  class="filesear">내용  :  </span> <span>${vo.promoteContent}</span><br><br>
				<span><img alt="" style="width: 250px; height: 250px;" 
							src="<c:url value='/promotionupload/${vo.promoteP1}'/>"></span><br><br>
				<span  class="filesear">등록일  :  </span> <span>${vo.reviewRegdate}</span><br><br>
				<span  class="filesear">마일리지 지급상태  :  </span> <span>${vo.mileagegive}</span><br><br>
				<span  class="filesear">작성자  :  </span> <span>${vo.userid}</span><br>
				</p>
			</div>
			
			<div class="writeReview7">
				<c:if test="${vo.mileagegive == 'N'}">
					<a href='<c:url value="/member/PromotionEdit.do?promoteSeq=${param.promoteSeq}"/>'>수정</a>&nbsp;|&nbsp;
					<a href='<c:url value="/member/PromotionDelete.do?promoteSeq=${param.promoteSeq}"/>'>삭제</a>
				</c:if>
			</div>
		</div>
		</form>
	</section>
	
</div>
<!-- div안에서작업 그외엔 건들지말것 -->


