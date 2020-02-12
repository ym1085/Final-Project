<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/mysec.css' />"/>


	<!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="<c:url value='/index.do'/>" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
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
      <!-- 풀테스트 -->
   </div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
	<div style="width: 87%; float: right;margin-top: 35px;">
		<h1 class="mysecTitle">마이 페이지</h1>
	<hr class="mysecLine">
	<c:import url="/member/imp/mysec.do"></c:import>
	<c:import url="/member/imp/mysecCan.do"></c:import>
	<c:import url="/member/imp/myinquery.do"></c:import>
	<c:import url="/member/imp/myreview.do"></c:import>
	<c:import url="/member/imp/myPromotion.do"></c:import>
	<c:import url="/member/imp/mylike.do"></c:import>
	<c:import url="/member/imp/mynewPer.do"></c:import>
	<c:import url="/member/imp/myMileageSub.do"></c:import>
	
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
<%@ include file="../inc/main2Bottom.jsp" %>