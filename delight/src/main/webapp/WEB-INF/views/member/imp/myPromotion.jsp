<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">나의 홍보내역</h2>
			
			<c:if test="${empty vo }">
				<a class="mytitSub" href="<c:url value='/member/PromotionReview.do' />">작성</a>
			</c:if>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:344px">
					<col style="width:275px">
					<col style="width:275px">
					<col style="width:140px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">내용</th>
						<th id="heading" scope="col">등록일</th>
						<th id="heading" scope="col">마일리지 지급 상태</th>
						<th id="heading" scope="col">작성자</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty vo }">
				<tr>
					<td colspan="6" style="text-align: center;">작성된 홍보글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${!empty vo }">
				<!-- 반복 시작-->
					<tr>
						<!-- 마일리지 지급받지 않은 경우, N-->
						<td style="text-align: left">
							<p><a href="<c:url value='/member/PromotionDetail.do?promoteSeq=${vo.promoteSeq }' />">${vo.promoteTitle}</a></p>
						</td>
						<td style="text-align: left;">
							<p>${vo.promoteContent}</p>
						</td>					
						<td style="text-align: center">
							<p>${vo.reviewRegdate}</p>							
						</td>
						<td style="text-align: center">
							<p>${vo.mileagegive}</p>
						</td>
						<td style="text-align: center">
							<p>${vo.userid}</p>
						</td>
					</tr>
				<!-- 반복 끝-->
				</c:if>
				</tbody>
			</table>		
		</div>	
	</section>