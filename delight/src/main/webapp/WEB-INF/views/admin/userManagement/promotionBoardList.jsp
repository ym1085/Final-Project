<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/userManagement/promotionBoardList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="mileagegive" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
	
	<input type="hidden" name="searchCondition2"
		value="${param.searchCondition2}" id="bb1">
	<input type="hidden" name="searchKeyword2" 
		value="${param.searchKeyword2}" id="bb2">
</form>
<div class="content-wrapper">

	<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/userManagement/promotionBoardList.do"/>'>
<div class="card">	
	<div class="card-body">
			<div class="text-right" id="typebox">
				<span>지급 유무</span> <select name="searchKeyword" id="type"
					class="form-control-sm">
					<option value="">전체</option>
					<option value="N"
						<c:if test="${param.searchKeyword=='N' }">
			            		selected="selected"
			        </c:if>>지급 전</option>
					<option value="Y"
						<c:if test="${param.searchKeyword=='Y' }">
			            		selected="selected"
			        </c:if>>지급 후</option>
				</select>
			</div>
			<div id="tablediv">
			<table class="table text-center table-bordered">
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 25%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 10%;">

		</colgroup>
		
		<thead class="table-danger">
			<tr>
				<th><input type="checkbox" id="chk"></th>
				<th>제목</th>
				<th>등록일</th>
				<th>아이디</th>
				<th>지급 유무</th>
				<th>지급</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="7">등록된 홍보글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:set var="idx" value="0" />
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>
						<c:if test="${vo.mileagegive=='N' }">
						<input type="checkbox" id="chk_${idx }" 
						name="promotionList[${idx }].promoteSeq" 
						value="${vo.promoteSeq }">
						</c:if>
						</td>
						<td><a href="#">${vo.promoteTitle }</a>
						<input type="hidden" value="${vo.promoteSeq }">
						</td>
						<td>
						<fmt:formatDate value="${vo.reviewRegdate }" pattern="yyyy-MM-dd"/>
						</td>
						<td>${vo.userid }</td>
						<td>${vo.mileagegive }</td>
						<td>
						<c:if test="${vo.mileagegive=='N' }">
						<button type="button" class="btn btn-gradient-success btn-sm give">지급</button>
						</c:if>
						</td>
						<td>
						<c:if test="${vo.mileagegive=='N' }">
						<button type="button" class="btn btn-gradient-danger btn-sm del">삭제</button>
						</c:if>
						</td>
					</tr>
					<c:set var="idx" value="${idx+1}" />
				</c:forEach>
			</c:if>
		</tbody>
		</table>
		</div>
		<div id="btdiv" class="text-right">
			<button type="button" class="btn btn-gradient-success btn-sm" id="multiGive">선택 지급</button>
			<button type="button" class="btn btn-gradient-danger btn-sm" id="multiDel">선택 삭제</button>
		</div>
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
	
	<div class="divSearch text-center">
   	
        <select name="searchCondition2"  class="form-control-sm" id="searchCondition2">
            <option value="promote_title" 
            	<c:if test="${param.searchCondition2=='promote_title' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="review_regdate" 
            	<c:if test="${param.searchCondition2=='review_regdate' }">
            		selected="selected"
            	</c:if>
            >등록일</option>
            <option value="userid" 
            	<c:if test="${param.searchCondition2=='userid' }">
            		selected="selected"
            	</c:if>
            >아이디</option>
        </select>   
        <input type="text" name="searchKeyword2" title="검색어 입력" id="searchKeyword2"
        	value="${param.searchKeyword2}"  class="form-control-sm">   
		<input type="submit" value="검색" id="searchbt" class="btn btn-gradient-dark btn-rounded btn-sm">
    
</div>
</div> <!-- 카드 -->
</form>
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
.divPage{
	margin-bottom: 10px;
}
#tablediv{
	width: 100%;
}
#typebox{
	margin-bottom: 10px;
}
.divSearch{
	margin-bottom: 20px;
}
#btdiv{
	margin-top: 10px;
}
</style>

<script type="text/javascript">
$(function() {
	$("#userManagement").addClass("active");
	$("#user").addClass("show");
	$("#frmdiv *").css("float","left");
	$("#frmdiv").css("float","right");
	$("form[name=searchfrm]").css("overflow","hidden");
	
	$("#type").change(function() {
		$("#aa2").val($("#type option:selected").val());
		$("#bb1").val("");
		$("#bb2").val("");
		$("form[name=frmPage]").submit();
		
	});
	
	$(".del").click(function() {
		var seq=$(this).parent().parent().find("input[type=checkbox]").val();
		location.href="<c:url value='/admin/userManagement/promoDel.do?proseq="+seq+"'/>";
	});
	
	$(".give").click(function() {
		var seq=$(this).parent().parent().find("input[type=checkbox]").val();
		location.href="<c:url value='/admin/userManagement/pointGive.do?proseq="+seq+"'/>";
	});
	
	$("table a").click(function() {
		var proseq=$(this).next().val();
		window.open("/delight/admin/userManagement/promotionDetail.do?proseq="+proseq,"detail",
		"width=800,height=890,left=0,top=0,location=yes,resizable=yes");
		
	});
	
	$("#multiDel").click(function() {
		if($("tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/userManagement/multiDel.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("삭제할 홍보글을 선택해주세요.");
		}
	});
	
	$("#multiGive").click(function() {
		if($("tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/userManagement/multiGive.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("삭제할 홍보글을 선택해주세요.");
		}
	});
	
	$("thead input[type=checkbox]").click(function(){
		$("tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});
	
});



function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}

</script>