<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />"/>

<section class="mysec" style="float: left;">
	<div class="mysecDiv">
		<h2 class="mytit">마일리지 적립 내역</h2>

		<a class="mytitSubnewper" style="margin-left: 65%;" href="<c:url value='/member/myMileageList.do' />">전체</a>
		
		<table class="mytable">
			<colgroup>
				<col style="width: 450px">
				<col style="width: 170px">
				<col style="width: 170px">
			</colgroup>

			<thead>
				<tr>
					<th id="heading" scope="col">날짜</th>
					<th id="heading" scope="col">마일리지 금액</th>
					<th id="heading" scope="col">사유</th>
				</tr>
			</thead>

			<tbody id="mybody">
				<c:if test="${empty list}">
					<tr class="likeTr">
						<td colspan="2" style="text-align: center;">
							데이터가 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
				
				<c:if test="${!empty list}">
					<!-- 반복 시작-->
					<c:forEach var="map" items="${list}">
					<tr class="likeTr">
						<td style="text-align: left">
							<p class="mybodylikeP" >
								<fmt:parseDate value="${map['MILEAGE_REG']}" var='mileage_date' pattern='yyyy-MM-dd HH:mm'/>
								<fmt:formatDate value="${mileage_date}" pattern="yyyy-MM-dd HH:mm"/>
							</p>
						</td>
				
						<td style="text-align: center">
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
							<p class="mybodylikeP">
								${map["MILEAGE_BEC"]}
							</p>
						</td>
					</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<!-- 반복 끝-->
		</table>
	</div>
</section>

