<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />
	
<script type="text/javascript">
    	function pageFunc(curPage){
    		$("#currentPage").val(curPage);
    		
    		$("form[name=frminq1]").submit();
    	}
    	
    	function mileTitle1(){
    		//alert("체크");		
    		location.href = "<c:url value='/member/myMileageTitle1.do'/>";
    	}
    	
    	function mileTitle2(){
    		//alert("체크");		
    		location.href = "<c:url value='/member/myMileageTitle2.do'/>";
    	}
    	
    	function mileTitle3(){
    		//alert("체크");		
    		location.href = "<c:url value='/member/myMileageTitle3.do'/>";
    	}
    	
</script>

<!-- 페이지 만들떄마다 복붙 -->
<div style="width: 13%; float: left; height: 100%;">
	<!-- left side -->
	<aside class="left-sidebar" style="width: 13%;">
		<div class="logo" style="margin-bottom: 63%;">
			<a href="<c:url value='/index.do'/>"
				style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
				Delight</a>
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
	<form name="frminq1" method="post" action="<c:url value='/member/myMileageTitle1.do'/>">
		<input type="hidden" name="currentPage" id="currentPage">
	</form>
	
	<section class="mysec" style="margin-top: 5%;">
		<div class="mysecDiv">
			<h2 class="mytit" style="margin-bottom: 0px;">적립금</h2>
			<br><br>
			
			<div id="myMileageSubDiv" style="width:84%; height:300px; border-top:3px solid black;margin-top:7px;">
				<p id="myMileageSubP1" style="margin-bottom: 10px;margin-top: 10px;">현재 적립금</p>
				<p id="myMileageSubP2" style="font-size:1.5em;font-weight: bold;font-family: 맑은고딕;margin-bottom: 10px;">2,500원</p>
				<br>
				<p id="myMileageSubP3">
					- 적립금은 구매 확정시 지급됩니다.
				</p>
				<p id="myMileageSubP4">
					- 후기/홍보 게시판 글 작성 시 적립금이 지급됩니다.
				</p>
			</div>
			
			<ul>
				<li id="mileTitle1" style="float:left;padding-bottom:1%;padding-right:1%" onclick="mileTitle1();">전체</li>
				<li id="mileTitle2" style="float:left;padding-bottom:1%;padding-right:1%" onclick="mileTitle2();">사용</li>
				<li id="mileTitle3" style="float:left;padding-bottom:1%;" onclick="mileTitle3();">적립</li>
			</ul>
			<table class="mytable">
				<colgroup>
					<col style="width: 200px">
					<col style="width: 400px">
					<col style="width: 400px">
					<col style="width: 400px">
				</colgroup>

				<thead>
					<tr>
						<th id="heading" scope="col">상태</th>
						<th id="heading" scope="col">적립금</th>
						<th id="heading" scope="col">등록날짜</th>
						<th id="heading" scope="col">적립날짜</th>
					</tr>
				</thead>

				<tbody id="mybody">
					<c:if test="${empty list }">
						<tr class="likeTr">
							<td colspan="4" style="text-align: center;">
								마일리지 내역이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
					
					<c:if test="${!empty list }">
						<!-- 반복 시작-->
						<c:forEach var="map" items="${list}">
						<tr class="likeTr">
							<td style="text-align: center; padding-right: 20px;">
								<c:set var="mileageExplain" value="${map['MILEAGE_BEC']}"/>
								
								<p class="mybodylikeP">
									${fn:split(mileageExplain,' ')[1]} 
								</p>
							</td>
							
							<td style="text-align: center;">
								<c:set var="mileaebacSeq" value="${map['MILEAEBEC_SEQ']}" />
								<c:if test="${mileaebacSeq==1}">
									<p class="mybodylikeP" >
										+${map["MILEAGE_POINT"]}원
									</p>
								</c:if>
							
								<c:if test="${mileaebacSeq==5}">
									<p class="mybodylikeP" >
										-${map["MILEAGE_POINT"]}원
									</p>
								</c:if>
							</td>
							
							<td style="text-align: center;">
								<p class="mybodylikeP" >
									<fmt:parseDate value="${map['MILEAGE_REG']}" var='mileage_date' pattern='yyyy-MM-dd HH:mm'/>
									<fmt:formatDate value="${mileage_date}" pattern="yyyy-MM-dd HH:mm"/>
								</p>
							</td>
							
							<td style="text-align: center;">
								<p class="mybodylikeP" >
									<fmt:parseDate value="${map['MILEAGE_REG']}" var='mileage_date' pattern='yyyy-MM-dd HH:mm'/>
									<fmt:formatDate value="${mileage_date}" pattern="yyyy-MM-dd HH:mm"/>
								</p>
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<!-- 반복 끝-->
			</table>
			
			<div id="page">
				<!-- 이전블럭으로 이동 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<a class="imgblock" href="#" onclick="pageFunc(1)"> <img
						src="<c:url value='/resources/images/first.gif'/>" alt="처음으로">
					</a>
					<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
						src="<c:url value='/resources/images/first2.gif'/>" alt="이전 블럭으로">
					</a>
				</c:if>

				<!-- 페이지 번호 추가 -->
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<span> ${i}</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<a href="#" onclick="pageFunc(${i})"> ${i }</a>
					</c:if>
				</c:forEach>
				<!--  페이지 번호 끝 -->

				<!-- 다음블럭으로 이동 -->
				<c:if test="${pagingInfo.lastPage< pagingInfo.totalPage}">
					<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value='/resources/images/last2.gif'/>" alt="다음 블럭으로">
					</a>
					<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.totalPage})"> <img
						src="<c:url value='/resources/images/last.gif'/>" alt="다음 블럭으로">
					</a>
				</c:if>
			</div>
					
		</div>
	</section>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>