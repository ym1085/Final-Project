<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newLine", "\r\n");
%>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">후기</h2>
			
			<a class="mytitSubre" href="<c:url value='/member/myreviewList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:776px">
					<col style="width:150px">
					<col style="width:140px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">예매정보</th>
						<th id="heading" scope="col">내용</th>
						<th id="heading" scope="col">예매번호</th>
						<th id="heading" scope="col">후기종류</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty list }">
				<tr>
					<td colspan="4" style="text-align: center;">후기내역이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">
							<p class="mybodyP">(${map['PERFOMTYPE'] })${map['PRFNM'] }</p>
						</td>
						<td style="text-align: left;">
						<img style="height: 24px;" alt="" src="<c:url value='/resources/images/star${map["REVIEW_SCORE"] }.png' />">
						<p style="margin-left: 15px;">&nbsp;&nbsp; <fmt:formatDate value="${map['REVIEW_REGDATE'] }" pattern="yyyy-MM-dd" />&nbsp;&nbsp; | &nbsp;&nbsp; 승인완료(${map['REVIEW_MILEAGE'] }적립)</p>
						<p style="margin-top: 10px;">${fn:substring(map['REVIEW_TITLE'],0,15) }...</p><br>
						<c:set var="content" value="${fn:replace(map['REVIEW_CONTENT'], newLine,'<br>') }" />		
						<p>${fn:substring(content,0,20) }...</p>
						</td>
						<td style="text-align: center">${map['PAY_TICKET_NUMBER'] }</td>
						<td style="text-align: center">
						<c:if test="${map['REVIEW_TYPE']==1 }">
							일반
						</c:if>
						<c:if test="${map['REVIEW_TYPE']==2 }">
							포토
						</c:if>
						</td>
					</tr>
				<!-- 반복 끝-->
				</c:forEach>
				</c:if>
				</tbody>
			</table>		
		</div>	
	</section>
