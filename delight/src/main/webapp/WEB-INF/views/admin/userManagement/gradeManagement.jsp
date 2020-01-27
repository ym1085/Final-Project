<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>

<div class="content-wrapper">
	<div class="card">
		<div class="card-body">
			<table class="table text-center table-bordered">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: 50%;">
					<col style="width: 15%;">
					<col style="width: 20%;">
				</colgroup>
				<thead>
					<tr class="font-weight-bold">
						<th>등급명</th>
						<th>등급 기준</th>
						<th>등급 혜택</th>
						<th>변경</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list }">
					<tr>
					<td colspan="4">등록된 혜택이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.gradeName }</td>
							<td>누적 결제액  : 
							<fmt:formatNumber value="${vo.gradeStandard }" pattern="#,###"/>
							</td>
							<td>${vo.gradeBenefit } %</td>
							<td>
							<button type="button" class="btn btn-inverse-success btn-rounded btn-sm">설정</button>
							<input type="hidden" value="${vo.gradeSeq }">
							</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@include file="../inc/adminBottom.jsp" %>

<script type="text/javascript">
$(function() {
	$("#userManagement").addClass("active");
	$("#user").addClass("show");
	
	$("table button").click(function() {
		var gradeseq=$(this).next().val();
		window.open("/delight/admin/userManagement/gradeSetting.do?gradeSeq="+gradeseq,"edit",
		"width=500,height=328,left=0,top=0,location=yes,resizable=yes");
		
	});
	
});

</script>