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
						<th id="heading" scope="col">취소일시</th>
						<th id="heading" scope="col">상태</th>
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
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>
					
					<tr>
						<td style="text-align: left">내용1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
						<td style="text-align: center">내용5</td>
						<td style="text-align: center">내용6</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>