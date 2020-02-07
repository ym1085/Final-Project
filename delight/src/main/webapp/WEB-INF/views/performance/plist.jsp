<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<!-- plist에만 사용되는 css -->
<link rel="stylesheet" href="<c:url value='/resources/performance_resources/css/style_cgi.css' />">
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
	
	<!-- div안에서작업 그외엔 건들지말것 -->
	<div style="width: 87%; float: right;">		
	
	<%@ include file="../inc/inc_CardSlide.jsp" %>

	<div class="whole-wrap">
		<div class="container box_1170">
			
			<div class="section-top-border text-right">
				
				<div class="row">
					<div class="col-md-9">
						
						<p class="text-right">Before we discuss all of the things that could be affecting your PC’s
							
							performance, let’s
							talk a little about what symptoms
							이곳은 검색창입니다.</p>
					</div>
				</div>
			<div class="section-top-border">
				<h3 class="mb-30">검색div</h3>
				<div class="row">
				<c:forEach var = "vo" items="${alist }">
					<div class="col-md-3" style="width:270px; height:370px;">
						<div class="single-defination">
							<h4 class="mb-20"></h4>					
							<div style="width:255px; height:300px; border:1px solid black;" align="center">						
								<div class="pic pic-3d">						
										<img alt="공연이미지" src="${vo.poster }" class="pic-image" width="250px" height="250px">								
								<span class="pic-caption open-down">
		        				<p><a href="<c:url value='/performance/pdetail.do?mt20id=${vo.mt20id }'/>">
		        					<h1 class="pic-title" style="color:white">상세정보</a><br>
		        					<a href="#">
		        					예매하기</h1></a>

		        				</span>
								</div>
								<br>
								<p style="color:black;">
								${vo.prfnm}<br>
								
								${vo.prfpdfrom } ~ ${vo.prfpdto }<br>
								<p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
