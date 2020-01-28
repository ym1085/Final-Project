<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<th id="heading" scope="col">결제번호</th>
						<th id="heading" scope="col">후기종류</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">
							<div>
							<img alt="" src="<c:url value='/resources/images/del3.jpg' />">
							</div>
							<p class="mybodyP">내용</p>
						</td>
						<td style="text-align: left;">
						<img style="height: 25px;" alt="" src="<c:url value='/resources/images/star5.png' />">
						<p style="margin-left: 15px;">&nbsp;&nbsp; 2020-01-22&nbsp;&nbsp; | &nbsp;&nbsp; 승인완료(100적립)</p>
						<p style="margin-top: 10px;">제목</p><br>
						<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
						</td>
						<td style="text-align: center">000081234552-1121123</td>
						<td style="text-align: center">포토</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>
