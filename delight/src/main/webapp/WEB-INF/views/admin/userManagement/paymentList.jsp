<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.userid }회원의 결제 내역</title>
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/css/vendor.bundle.base.css'/>">
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/css/style.css'/>">
    <!-- End layout styles -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/js/off-canvas.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/hoverable-collapse.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/misc.js'/>" ></script>
</head>
<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

$(function() {
	$("#searchtype").change(function() {
		$("#aa2").val($("#searchtype option:selected").val());
		document.frmPage.submit();
	});
});

</script>
<style type="text/css">
.divPage{
	margin: 10px 0 10px 0;
}
#selectdiv{
	margin: 0 0 10px 0;
}
</style>
<body>
<form action="<c:url value='/admin/userManagement/paymentList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="refYN" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
	<input type="hidden" name="userid" value="${param.userid }">
</form>

<div class="main-panel">
<div class="content-wrapper">
	<div class="card">
		<div class="card-body">
			<div id="total">
			<div>총 결제액 - <fmt:formatNumber value="${totalpay }" pattern="#,###"/>원</div>
			<div>총 환불액 - <fmt:formatNumber value="${totalrefund }" pattern="#,###"/>원</div>
			</div>
			<div id="selectdiv" class="text-right">
			<span>${param.userid }</span>
				<select name="searchKeyword" class="form-control-sm" id="searchtype">
					<option value="">전체</option>
					<option value="N"
					<c:if test="${param.searchKeyword=='N' }">
			            		selected="selected"
			        </c:if>
					>환불신청X</option>
					<option value="ing"
					<c:if test="${param.searchKeyword=='ing' }">
			            		selected="selected"
			        </c:if>
					>환불진행중</option>
					<option value="Y"
					<c:if test="${param.searchKeyword=='Y' }">
			            		selected="selected"
			        </c:if>
					>환불완료</option>
				</select>
			</div>
			<div id="tablediv">
				<table class="table table-bordered text-center">
				<colgroup>
					<col style="width: 25%">
					<col style="width: 25%">
					<col style="width: 25%">
					<col style="width: 25%">
				</colgroup>
				<thead>
					<tr>
						<th style="font-weight: bold">공연명</th>
						<th style="font-weight: bold">결제금액</th>
						<th style="font-weight: bold">결제일</th>
						<th style="font-weight: bold">환불여부</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list }">
					<tr><td colspan="4">결제 내역이 존재하지 않습니다.</td></tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="map" items="${list }">
					<tr>
						<td>${map['PRFNM'] }</td>
						<td>
						<fmt:formatNumber value="${map['PAY_PRICE'] }" pattern="#,###" /> 원
						</td>
						<td>
						<fmt:formatDate value="${map['RES_DATE'] }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
						<c:if test="${map['REFYN']=='N' }">환불 신청 X</c:if>
						<c:if test="${map['REFYN']=='ing' }">환불 진행중</c:if>
						<c:if test="${map['REFYN']=='Y' }">환불 완료</c:if>
						</td>
					</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			</div>
			
			
			<div class="divPage text-center">
				 <!-- 이전블럭으로 이동 -->
				<c:if test="${pagingInfo.firstPage>1 }">	
					<button type="button" class='btn btn-social-icon btn-outline-youtube btn-sm' onclick="pageFunc(${pagingInfo.firstPage-1})"> &lt;&lt;</button>
				</c:if>
				<!-- 페이지 번호 추가 -->						
				
				<c:forEach var="i" begin="${pagingInfo.firstPage }" 
					end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span class='btn btn-success btn-sm'>${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<input type='button' value="${i }" class='btn btn-danger btn-sm' onclick="pageFunc(${i})">
						</c:if>
				</c:forEach>
				<!--  페이지 번호 끝 -->
				
				<!-- 다음블럭으로 이동 -->
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<button type="button" class="btn btn-social-icon btn-outline-youtube btn-sm" onclick="pageFunc(${pagingInfo.lastPage+1})"> &gt;&gt;</button>
				</c:if>	
			</div><!-- 페이징 -->
			
		</div>
	</div>
</div>
</div>
</body>
</html>