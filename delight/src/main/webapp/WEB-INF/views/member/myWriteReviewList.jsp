<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />

<%@ include file="../inc/main2Top.jsp"%>

<script type="text/javascript">
	$(function(){		
		$("form[name=frm1]").submit(function(){
			if($("#startDay").val().length<1){
				alert("시작일을 입력하세요");
				$("#startDay").focus();
				event.preventDefault();
			}else if($("#endDay").val().length<1){
				alert("종료일을 입력하세요");
				$("#endDay").focus();
				event.preventDefault();
			}
		});
		
		
	});
	
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=frmPage]").submit();
	}
</script>
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
	<!-- 페이징 처리를 위한 form 시작-->
	<form name="frmPage" method="post" 
		action="<c:url value='/member/myWriteReviewList.do'/>">
		<input type="hidden" name="startDay" value="${dateSearchVO.startDay }">
		<input type="hidden" name="endDay" value="${dateSearchVO.endDay }">
		<input type="hidden" name="currentPage">	
	</form>
	<!-- 페이징 처리 form 끝 -->
	<section class="mysec" style="margin-top: 5%;">
		<div class="mysecDiv">
			<h2 class="mytit">구매후기(작성)</h2>

			<form name="frm1" method="post"
				action="<c:url value='/member/myWriteReviewList.do'/>">
				<!-- 조회기간 include -->
				<c:import url="imp/dateTerm.jsp"></c:import>
				<input type="submit" value="조회" id="listsubmit"><br>
				<span style="color: red;font-weight: bold;margin: 1%;">
				*관람하시는날이 아닌 예매 하신 날로 검색이 가능합니다.(후기는 포토,일반 후기중 한가지만 작성가능합니다.)</span>
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
						<th id="heading" scope="col">매수/가격</th>
						<th id="heading" scope="col">관람일시</th>
						<th id="heading" scope="col">포토후기</th>
						<th id="heading" scope="col">일반후기</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty list }">
					<tr> 
						<td colspan="6" style="text-align: center;">
							에매내역이 존재하지않습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: center;">(${map['PERFOMTYPE'] })${map['PRFNM'] }</td>
						<td style="text-align: center"><fmt:formatDate value="${map['RES_DATE'] }" pattern="yyyy-MM-dd"/></td>
						<td style="text-align: center">${map['BOOKING'] } / ${map['PAY_PRICE'] }</td>
						<td style="text-align: center">
						<fmt:formatDate value="${map['SELECT_DATE'] }" pattern="yyyy-MM-dd"/>
						 / ${map['SELECT_TIME'] }시</td>
						<td style="text-align: center">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<fmt:formatDate value="${map['SELECT_DATE'] }" pattern="yyyy-MM-dd" var="selectDate" />
						<c:if test="${today>selectDate && map['PAY_CONDITION']=='Y' && map['V']<1}">
						
						<input style="width: 129px" class="mybodyBt"
							type="button" value="작성하기"
							onclick="location.href='<c:url value="/member/PhotoReview.do?reservationSeq=${map['RESERVATION_SEQ'] }" />'"
							/>	
						
						</c:if>
						<c:if test="${map['V']>0 && map['PAY_CONDITION']=='Y' && today>selectDate}">
						<span>후기작성완료</span>
						</c:if>
						</td>
						<td style="text-align: center">
							<jsp:useBean id="now2" class="java.util.Date" />
							<fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today2" />
							<fmt:formatDate value="${map['SELECT_DATE'] }" pattern="yyyy-MM-dd" var="selectDate" />
						<c:if test="${today2>selectDate && map['PAY_CONDITION']=='Y' && map['V']<1}">
						
						<input class="mybodyBt"
							type="button" value="작성하기"
							onclick="location.href='<c:url value="/member/NmReview.do?reservationSeq=${map['RESERVATION_SEQ'] }" />'"
							/>
						
						</c:if>
						<c:if test="${map['V']>0 && map['PAY_CONDITION']=='Y' && today2>selectDate}">
						<span>후기작성완료</span>
						</c:if>
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
							<span> ${i }</span>
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