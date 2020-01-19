<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/salesManagement/salesDiscount.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }">
</form>
<div class="content-wrapper">

<div class="card">
	<div>
		<form name="searchfrm" id="searchfrm"
		 method="post"  action="<c:url value='/admin/salesManagement/salesDiscount.do'/>">
		<input type="hidden" value="prfnm" name="searchCondition">
			<div id="frmdiv">
				<span>공연명 검색</span>
				<input type="text" class="form-control" style="width: 150px;" id="pfmname" name="searchKeyword" value="${param.searchKeyword}">
				<button type="submit" class="btn btn-gradient-danger btn-md">검색</button>
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
						<td id="name">${map['PRFNM'] }</td>
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
						<td><button type="button" class="btn btn-gradient-info btn-rounded btn-sm">설정</button>
						<input type="hidden" value="${map['TICKET_SEQ'] }"></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		</table>
	</div>
	<div class="divPage text-center">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<button class='btn btn-social-icon btn-outline-youtube' onclick="pageFunc(${pagingInfo.firstPage-1})"> &lt;&lt;</button>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span class='btn btn-success'>${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<input type='button' value="${i }" class='btn btn-danger pgo' onclick="pageFunc(${i})">
			</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<button class="btn btn-social-icon btn-outline-youtube" onclick="pageFunc(${pagingInfo.lastPage+1})"> &gt;&gt;</button>
	</c:if>	
	</div><!-- 페이징 -->
</div> <!-- 카드 -->
</div> <!-- content -->




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
	
	$("table button").click(function() {
		var pfname=$(this).parent().parent().find("#name").text();
		var ticketseq=$(this).next().val();
		
		window.open("/delight/admin/salesManagement/discountsetting.do?pfname="+pfname+"&ticketseq="+ticketseq,"discount",
		"width=400,height=328,left=0,top=0,location=yes,resizable=yes");
		
	});
	
});

function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}

</script>