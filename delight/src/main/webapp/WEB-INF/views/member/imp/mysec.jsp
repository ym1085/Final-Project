<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">예매내역 조회</h2>
			
			<a class="mytitSub" href="<c:url value='/member/mysecList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:159px">
					<col style="width:185px">
					<col style="width:275px">
					<col style="width:275px">
					<col style="width:140px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">예매일</th>
						<th id="heading" scope="col">예매번호</th>
						<th id="heading" scope="col">매수/가격</th>
						<th id="heading" scope="col">관람일시</th>
						<th id="heading" scope="col">상태</th>
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
						<td style="text-align: center">${map['PAY_TICKET_NUMBER'] }</td>
						<td style="text-align: center">${map['BOOKING'] } / ${map['PAY_PRICE'] }</td>
						<td style="text-align: center">
						<fmt:formatDate value="${map['SELECT_DATE'] }" pattern="yyyy-MM-dd"/>
						 / ${map['SELECT_TIME'] }시</td>
						<td style="text-align: center">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<fmt:formatDate value="${map['SELECT_DATE'] }" pattern="yyyy-MM-dd" var="selectDate" />
						<c:if test="${today<selectDate && map['PAY_CONDITION']=='Y' && map['V']<1}">
						<!-- 예매 하면 바로 주문취소 넣어주고 만약 공연을봤다 면 후기작성으로-->
						<a class="mysecCansle" href="<c:url value='/member/myreserCancle.do?reservationSeq=${map["RESERVATION_SEQ"] }' />">예매취소</a>
						</c:if>
						<c:if test="${today==selectDate && map['PAY_CONDITION']=='Y' && map['V']<1}">
						<!-- 예매 하면 바로 주문취소 넣어주고 만약 공연을봤다 면 후기작성으로-->
						<span>취소불가</span>
						</c:if>
						<c:if test="${today>selectDate && map['PAY_CONDITION']=='Y' && map['V']<1}">
						<input class="mybodyBt" type="button" value="후기작성"
						onclick="location.href='<c:url value="/member/myWriteReviewList.do" />'"/>
						</c:if>
						<c:if test="${map['V']>0 && map['PAY_CONDITION']=='Y' && today>selectDate}">
						<span>후기작성완료</span>
						</c:if>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>