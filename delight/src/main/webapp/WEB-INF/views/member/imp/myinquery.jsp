<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">나의 문의내역</h2>
			
			<a class="mytitSubinq" href="">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:155px">
					<col style="width:647px">
					<col style="width:250px">
					<col style="width:347px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">번호</th>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">문의날짜</th>
						<th id="heading" scope="col">답변상태</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: center">1</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">답변예정</td>
					</tr>
					
					<tr>
						<td style="text-align: center">2</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
					
					<tr>
						<td style="text-align: center">3</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>