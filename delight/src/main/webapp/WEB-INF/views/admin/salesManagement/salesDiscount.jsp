<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>

<div class="content-wrapper">

<div class="card">
	<div>
		<form name="searchfrm" id="searchfrm">
			<div id="frmdiv">
				<span>공연명 검색</span>
				<input type="text" class="form-control" style="width: 150px;" id="pfmname">
				<button type="button" class="btn btn-gradient-danger btn-md">검색</button>
			</div>
		</form>	
	</div>
	
	<div class="card-body">
		<table class="table text-center table-bordered">
		<colgroup>
			<col style="width: 30%;">
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			<col style="width: 3%;">
			<col style="width: 5%;">
			<col style="width: 10%;">
			<col style="width: 5%;">
		</colgroup>
		
		<thead class="table-danger">
			<tr>
				<th>공연명</th>
				<th>공연일</th>
				<th>공연 시간</th>
				<th>좌석 등급</th>
				<th>장 수</th>
				<th>현재 상황</th>
				<th>할인 등록 유무</th>
				<th>설정</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="8">등록된 공연표가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<jsp:useBean id="now" class="java.util.Date" />
				<c:forEach var="map" items="${list }">
				<c:set var="prfdate" value="${fn:replace(map['PRFDATE'],'-','') }" />
				<c:set var="prfhour" value="${fn:replace(map['PRFHOUR'],':','') }"/>
				<c:set var="prf" value="${prfdate }${prfhour }"/>
				<fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" var="nowDate" />
				<fmt:parseDate value="${prf }" pattern="yyyyMMddHHmm" var="prfdh"/>
					<tr>
						<td>${map['PRFNM'] }</td>
						<td>${map['PRFDATE'] }</td>
						<td>${map['PRFHOUR'] }</td>
						<td>${map['SELLCLASS'] }</td>
						<td>${map['SELLTICKET'] }</td>
						<td>
						<c:if test="${prfdh>nowDate }">공연 전</c:if>
						<c:if test="${prfdh<=nowDate }">공연 종료</c:if>
						</td>
						<td>
							<c:if test="${map['count']==0 }">N</c:if>
							<c:if test="${map['count']==1 }">Y</c:if>
						</td>
						<td><button type="button" class="btn btn-gradient-info btn-rounded btn-sm">설정</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		</table>
	</div>
</div>


</div>

<%@include file="../inc/adminBottom.jsp" %>

<style type="text/css">
#searchfrm{
	padding: 2% 2% 0 2%;
}
#pfmname{
	margin: 0 20px 0 20px;
}
#frmdiv span{
	padding-top: 3%;
}
th{
	font-weight: bold;
}
</style>

<script type="text/javascript">
$(function() {
	$("#salesManagement").addClass("active");
	$("#sell").addClass("show");
	$("#frmdiv *").css("float","left");
	$("#frmdiv").css("float","right");
	$("form[name=searchfrm]").css("overflow","hidden");
	
});

</script>