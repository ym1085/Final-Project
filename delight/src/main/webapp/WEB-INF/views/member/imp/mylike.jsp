<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">좋아요</h2>
			
			<a class="mytitSublike" href="#">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:1390px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">
							<div>
							<img alt="" src="<c:url value='/resources/images/del3.jpg' />">
							</div>
							<p class="mybodylikeP">제목</p>
							<p class="mybodylikeP">장르</p>
							<p class="mybodylikeP">하트/하트개수</p>
						</td>
					</tr>
					
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>