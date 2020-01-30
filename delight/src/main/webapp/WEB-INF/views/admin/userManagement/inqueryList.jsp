<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>

<form action="<c:url value='/admin/userManagement/inqueryList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="faq_type" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
	
	<input type="hidden" name="searchCondition2"
		value="${param.searchCondition2}" id="bb1">
	<input type="hidden" name="searchKeyword2" 
		value="${param.searchKeyword2}" id="bb2">
</form>

<div class="content-wrapper">
	<div class="card">
		<div class="card-body">
			<div class="text-right" id="typebox">
			<span>답변 상태</span>
			<select name="searchKeyword" id="type" class="form-control-sm">
				<option value="">전체</option>
				<option value="N"
					<c:if test="${param.searchKeyword=='N' }">
			            		selected="selected"
			        </c:if>
				>답변 전</option>
				<option value="Y"
					<c:if test="${param.searchKeyword=='Y' }">
			            		selected="selected"
			        </c:if>
				>답변완료</option>
			</select>
			</div>
			<form id="frm">
			<div id="tablediv">
				<table class="table text-center table-bordered">
				<colgroup>
					<col style="width: 60%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 10%">
				</colgroup>
					<thead>
						<tr>
							<th style="font-weight: bold;">제목</th>
							<th style="font-weight: bold;">문의일</th>
							<th style="font-weight: bold;">회원유무</th>
							<th style="font-weight: bold;">답변 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
						<tr>
							<td colspan="4">등록된 문의 글이 없습니다.</td>
						</tr>
						</c:if>
						<c:if test="${!empty list }">
						<c:forEach var="map" items="${list }">
						<tr>
							<td><a href="#">${map['INQUERY_TITLE'] }</a>
							<input type="hidden" value="${map['INQUERY_SEQ'] }">
							</td>
							<td>
							<fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${map['usertype'] }</td>
							<td>${map['INQUERY_CONDITION'] }</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div id="btbox" class="text-right">
				
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
			
			
				<div class="divSearch text-center">
   	
			        <select name="searchCondition2" id="searchCondition2" class="form-control-sm">
			            <option value="inquery_title" 
			            	 <c:if test="${param.searchCondition2=='inquery_title' }">
			            		selected="selected"
			            	</c:if> 
			            >제목</option>
			            
			            <option value="i.reg_date" 
			            	 <c:if test="${param.searchCondition2=='i.reg_date' }">
			            		selected="selected"
			            	</c:if> 
			            >문의일</option>
				        </select>   
				        <input type="text" name="searchKeyword2" title="검색어 입력" id="searchKeyword2" class="form-control-sm"
				        	value="${param.searchKeyword2}">   
						<input type="submit" value="검색" id="searchbt" class="btn btn-gradient-dark btn-rounded btn-sm">
				</div>
			</form>
		</div>
	</div>
			
</div>

<%@include file="../inc/adminBottom.jsp" %>

<style type="text/css">
#btbox{
	margin: 10px 0 10px 0;
}
.divPage{
	margin: 0 0 10px 0;
}
#typebox{
	margin: 0 0 10px 0;
}
</style>

<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

$(function() {
	$("#userManagement").addClass("active");
	$("#user").addClass("show");
	
	$("#type").change(function() {
		$("#aa2").val($("#type option:selected").val());
		$("#aa3").val("1");
		$("#bb1").val("");
		$("#bb2").val("");
		$("form[name=frmPage]").submit();
	});
	
	$("#frm").submit(function() {
		event.preventDefault();
		$("#bb1").val($("#searchCondition2 option:selected").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("#aa3").val("1");
		$("form[name=frmPage]").submit();
	});
	
	$("#tablediv tbody a").click(function() {
		var seq=$(this).next().val();
		window.open("/delight/admin/userManagement/inqAnwDetail.do?inqSeq="+seq, "inqAnwDetail",
		"width=800,height=890,left=0,top=0,location=yes,resizable=yes");
		
	});
});




</script>