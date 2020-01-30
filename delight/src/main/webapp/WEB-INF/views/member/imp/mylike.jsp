<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="mysec" style="float: left;">
		<div class="mysecDiv">
			<h2 class="mytit">좋아요</h2>
			
			<a class="mytitSublike" href="<c:url value='/member/mylikeList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:640px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">내용</th>
					</tr>
				</thead>
				
				<tbody id="mybody" style="border-bottom: 1px solid gray;">
					<c:if test="${empty list }">
					<tr class="likeTd">
						<td colspan="1" style="text-align: center;">관심있는 공연이 없습니다.</td>
					</tr>
					</c:if>
					
					<c:if test="${!empty list }">
				<!-- 반복 시작-->
					<c:forEach var="like" items="${list }">
					<tr class="likeTr">
						<td class="likeTd">
							<p class="mybodylikeP">(${like.GENRE })${like.PRFNM }
							<input type="hidden" value="${like.MT20ID }" class="likeperfomId">
							</p>
							<p class="mybodylikeimg" style="color: red;"><img class="likeListimg" alt="좋아요이미지" src="<c:url value='/resources/images/like2.png' />">
							 <span>${like.LA }</span></p>
						</td>
					</tr>
					</c:forEach>
				<!-- 반복 끝-->
					</c:if>
				</tbody>
			</table>		
		</div>	
	</section>