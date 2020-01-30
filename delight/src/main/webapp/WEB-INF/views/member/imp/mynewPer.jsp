<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />

	<section class="mysec" style="float: left;">
		<div class="mysecDiv">
			<h2 class="mytit">최근 본 공연</h2>

			<a class="mytitSubnewper" href="<c:url value='/member/mysnewPerList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width: 600px">
					<col style="width: 100px">
				</colgroup>

				<thead>
					<tr>
						<th id="heading" scope="col">내용</th>
						<th id="heading" scope="col">예매하기</th>
					</tr>
				</thead>

				<tbody id="mybody">
					<!-- 반복 시작-->
					<tr class="likeTr">
						<td style="text-align: left">
							<p class="mybodylikeP" >제목</p>
						</td>
						<td>
							<input type="button" class="newPerReser" value="예매하기">
						</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>
		</div>
	</section>

