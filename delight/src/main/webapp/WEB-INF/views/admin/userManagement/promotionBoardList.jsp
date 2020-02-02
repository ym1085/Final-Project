<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/salesManagement/refundReqList.do'/>" 
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
   		action='<c:url value="/admin/salesManagement/refundReqList.do"/>'>
<div class="card">	
	<div class="card-body">
			<div class="text-right" id="typebox">
				<span>현재 상황</span> <select name="searchKeyword" id="type"
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
			<col style="width: 40%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
			<col style="width: 10%;">

		</colgroup>
		
		<thead class="table-danger">
			<tr>
				<th>제목</th>
				<th>등록일</th>
				<th>아이디</th>
				<th>지급 유무</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">환불신청 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:set var="idx" value="0" />
				<c:forEach var="map" items="${list }">
					<tr>
						<td>${map['USERID'] }</td>
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
            <option value="u.USERID" 
            	<c:if test="${param.searchCondition2=='u.USERID' }">
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="f.REFUND_CANCLE" 
            	<c:if test="${param.searchCondition2=='f.REFUND_CANCLE' }">
            		selected="selected"
            	</c:if>
            >등록일</option>
            <option value="f.REFUND_CANCLE" 
            	<c:if test="${param.searchCondition2=='f.REFUND_CANCLE' }">
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
	

	
	$(".editwindow").click(function() {
		var ticketseq=$(this).next().val();
		window.open("/delight/admin/salesManagement/settingEdit.do?ticketseq="+ticketseq,"discount",
		"width=500,height=328,left=0,top=0,location=yes,resizable=yes");
		
	});
	
});

function del(seq){
	$.ajax({
		url:"<c:url value='/admin/salesManagement/settingDel.do'/>",
		type:"post",
		data:
			{
				ticketSeq:seq
			}
		,
		success:function(res){
			 if(res==1){
				alert("표 수량 설정 삭제완료!!");
				location.reload();
			}else {
				alert("삭제 중 오류 발생");
			}
			
		},
		error:function(xhr,status,error){
			alert("Error : "+status+", "+error);
		}
	});
}

function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	
	document.frmPage.submit();
}

</script>