<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/salesManagement/nonuserRefundReqList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="f.COMPFLAG" id="aa1">
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
   		action='<c:url value="/admin/salesManagement/nonuserRefundReqList.do"/>'>
<div class="card">	
	<div class="card-body">
			<div class="text-right" id="typebox">
				<span>현재 상황</span> <select name="searchKeyword" id="type"
					class="form-control-sm">
					<option value="">전체</option>
					<option value="N"
						<c:if test="${param.searchKeyword=='N' }">
			            		selected="selected"
			        </c:if>>환불 진행 중</option>
					<option value="Y"
						<c:if test="${param.searchKeyword=='Y' }">
			            		selected="selected"
			        </c:if>>환불 완료</option>
				</select>
			</div>
			<div id="tablediv">
			<table class="table text-center table-bordered">
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 17.5%;">
			<col style="width: 7.5%;">

			<col style="width: 20%;">
			<col style="width: 15%;">
			<col style="width: 5%;">
			<col style="width: 15%;">
			<col style="width: 15%;">
		</colgroup>
		
		<thead class="table-danger">
			<tr>
				<th><input type="checkbox" id="chk"></th>
				<th>메일</th>
				<th>환불 금액</th>

				<th>환불사유</th>
				<th>환불 신청일</th>
				<th>완료 상황</th>
				<th>환불 승인일</th>
				<th>환불승인</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="8">환불신청 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:set var="idx" value="0" />
				<c:forEach var="map" items="${list }">
					<tr>
						<td>
						<c:if test="${map['COMPFLAG']=='N' }">
						<input type="checkbox" id="chk_${idx }" 
						name="seqList[${idx }]" 
						value="${map['NONEUSERID'] }!${map['REFUND_SEQ']}!${map['PAY_SEQ']}!${map['RESERVATION_SEQ']}!${map['TICKET_SEQ']}">
						</c:if>
						</td>
						<td>${map['NONEUSERID'] }</td>
						<td>
						<fmt:formatNumber value="${map['REFUND_PRICE'] }" pattern="#,###"/>원
						</td>

						<td>${map['DETAIL'] }</td>
						<td>
						<fmt:formatDate value="${map['REFUND_CANCLE'] }" pattern="yyyy-MM-dd"/>
						</td>
						<td>${map['COMPFLAG'] }</td>
						<td>
						<fmt:formatDate value="${map['REFUND_CANCLE_OK'] }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
						<c:if test="${map['COMPFLAG']=='N' }">
						<button type="button" class="btn btn-gradient-success btn-sm">승인</button>
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
		<button type="button" class="btn btn-gradient-danger btn-sm" id="multiRefund">선택 승인</button>
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
            <option value="NONEUSERID" 
            	<c:if test="${param.searchCondition2=='NONEUSERID' }">
            		selected="selected"
            	</c:if>
            >메일</option>
            <option value="f.REFUND_CANCLE" 
            	<c:if test="${param.searchCondition2=='f.REFUND_CANCLE' }">
            		selected="selected"
            	</c:if>
            >신청일</option>
            
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
	$("#salesManagement").addClass("active");
	$("#sell").addClass("show");
	$("#frmdiv *").css("float","left");
	$("#frmdiv").css("float","right");
	$("form[name=searchfrm]").css("overflow","hidden");
	
	$("#type").change(function() {
		$("#aa2").val($("#type option:selected").val());
		$("#bb1").val("");
		$("#bb2").val("");
		$("form[name=frmPage]").submit();
		
	});
	
	$("thead input[type=checkbox]").click(function(){
		$("tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});

	$("table button").click(function() {
		var seq=$(this).parent().parent().find("input[type=checkbox]").val();
		location.href="<c:url value='/admin/salesManagement/refund.do?seq="+seq+"'/>";
	});
	
	$("#multiRefund").click(function() {
		if($("tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/salesManagement/multiRefund.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("승인할 요청을 선택해주세요.");
		}
	});
	
});



function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}

</script>