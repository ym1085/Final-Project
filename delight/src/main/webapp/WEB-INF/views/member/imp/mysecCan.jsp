<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">예매취소 내역</h2>
			
			<a class="mytitSub" href="<c:url value='/member/mysecCanList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:159px">
					<col style="width:185px">
					<col style="width:200px">
					<col style="width:200px">
					<col style="width:200px">
					<col style="width:100px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">예매번호</th>
						<th id="heading" scope="col">매수/가격</th>
						<th id="heading" scope="col">사유</th>
						<th id="heading" scope="col">취소신청날짜</th>
						<th id="heading" scope="col">취소완료날짜</th>
						<th id="heading" scope="col">상태</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty list }">
					<tr>
						<td colspan="7" style="text-align: center;">
							예매취소내역이 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: center;">(${map['PERFOMTYPE'] })${map['PRFNM'] }</td>
						<td style="text-align: center">${map['PAY_TICKET_NUMBER'] }</td>
						<td style="text-align: center">${map['BOOKING'] }/${map['PAY_PRICE'] }</td>
						<td style="text-align: center">${map['DETAIL'] }</td>
						<td style="text-align: center">${map['REFUND_CANCLE'] }</td>
						<td style="text-align: center">${map['REFUND_CANCLE_OK'] }</td>
						<c:if test="${map['COMPFLAG']=='N' }">
						<td style="text-align: center;color: red;">
							진행중
						</td>
						</c:if>
						<c:if test="${map['COMPFLAG']=='Y' }">
						<td style="text-align: center">
							완료
						</td>
						</c:if>
					</tr>
				<!-- 반복 끝-->
				</c:forEach>
				</c:if>
				</tbody>
			</table>		
		</div>	
	</section>