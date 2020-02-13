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
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/customerService/customerServiceList.do"/>">고객센터</a></li>
            </ul>
		</nav>
	</aside>
	<!-- left side -->
</div>
<!-- 페이지 만들떄마다 복붙 -->

<div style="width: 87%; float: right;">

	<section class="mysec">
	<form action="<c:url value='/member/PromotionReview.do' />" method="post" name="reviewfrm" enctype="multipart/form-data">
		<div class="mysecDiv" >
			<div class="writeReview">
				<h2 class="mytit">나의 홍보내역</h2>
			</div>
			<div class="writeReview2">
				<p>- 작성된 홍보는 Delight 콘텐츠로 사용될 수 있습니다.<br>
				   - 등록하신 홍보는 회원 본인과 관리자만 열람 가능합니다.<br>
				   - 마일리지가 지급된 홍보는 수정 불가능하며 신중하게 작성 부탁드립니다.<br>
				   - 홍보게시물 작성은 회원 1명당 1번만 작성할 수 있으니, 신중하게 작성 부탁 드립니다.
				   </p>
			</div>
			<br>
			
			<div class="writeReview6" style="height:580px; width: 100%;border: 2px solid lightgray;">
				<div class="contenttitle" style="margin-top: 2.5%;">
					
					<div  class="filesear" id="aaaaaa" style="font-size: 15px;margin-left:2%;margin-bottom:30px; ">
						<span style="color:rgb(247, 99, 158);font-weight: bold;">제목  : </span>
						<span style="letter-spacing:1px; font-size: 14px;font-weight: bold;">${vo.promoteTitle}</span> 
					</div>
					
					
					<div  class="filesear" id="bbbbbb" style="font-size: 15px;margin-left:2%;margin-bottom:30px;">
						<span style="color:rgb(247, 99, 158);font-weight: bold;">내용  : </span>
						<span style="letter-spacing:1px; font-size: 14px;font-weight: bold;">${vo.promoteContent}</span> 
					</div>
					
				
					<div id="super" style="float:left;margin-left:2%;margin-bottom:3%;">
						<img alt="" style="width: 250px; height: 250px; border: 1.5px solid lightgray; box-shadow: 1px 1px 10px 2px;" 
								src="<c:url value='/promotionupload/${vo.promoteP1}'/>">
					</div>
				
					<div class="filesear" id="ccccccc" style="font-weight: 100;font-size: 15px;margin-left: 2%;margin-bottom: 30px;">
						<span style="color:rgb(247, 99, 158);font-weight: bold;">등록일  : </span>
						<span style="letter-spacing:1px; font-size: 14px;font-weight: bold;">${vo.reviewRegdate}</span> 
					 
					<div class="filesear" id="ddddddd" style="font-weight: 100;font-size: 15px;margin-left: 2%;margin-bottom:24px;margin-top: 23px;">
						<span id="temp1" style="color:rgb(247, 99, 158);font-weight: bold;margin-left:-27px">마일리지 지급상태  : </span>
						<span id="temp2" style="letter-spacing:1px; font-size: 14px;font-weight: bold;">${vo.mileagegive}</span> 
					</div>
					
					<div class="filesear" id="eeeeeee" style="font-weight: 100;font-size: 15px;margin-left: 2%;margin-bottom: 30px;margin-top:23px;">
						<span style="color:rgb(247, 99, 158);font-weight: bold;margin-left:-27px"">작성자  :  </span>
						<span style="letter-spacing:1px; font-size: 14px;font-weight: bold;">${vo.userid}</span> 
					</div>
								
				</div>
			</div>
		</div>
			
		<div class="writeReview7" style="margin-left:0px; margin-top:10px;">
			<a style="color: #2d2c2c; font-weight: bold; font-size: 13px" href='<c:url value="/member/PromotionEdit.do?promoteSeq=${param.promoteSeq}"/>'>수정</a>&nbsp;|&nbsp;
				
			<c:if test="${vo.mileagegive == 'N'}">
				<a style="color: #2d2c2c; font-weight: bold; font-size: 13px" href='<c:url value="/member/PromotionDelete.do?promoteSeq=${param.promoteSeq}"/>'>삭제</a>
			</c:if>
		</div>	
			
		</form>
	</section>
	
</div>
<!-- div안에서작업 그외엔 건들지말것 -->


