<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/admin/salesManagement/settingList.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="situaction" id="aa1">
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
   		action='<c:url value="/admin/salesManagement/settingList.do"/>'>
<div class="card">	
	<div class="card-body">
			<div class="text-right" id="typebox">
				<span>현재 상황</span> <select name="searchKeyword" id="type"
					class="form-control-sm">
					<option value="">전체</option>
					<option value="N"
						<c:if test="${param.searchKeyword=='N' }">
			            		selected="selected"
			        </c:if>>공연
						전</option>
					<option value="Y"
						<c:if test="${param.searchKeyword=='Y' }">
			            		selected="selected"
			        </c:if>>공연
						종료</option>
				</select>
			</div>
			<div id="tablediv">
			<table class="table text-center table-bordered">
		<colgroup>
			<col style="width: 30%;">
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
			<col style="width: 3%;">
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
				<th>설정 수</th>
				<th>판매된 수</th>
				<th>현재 상황</th>
				<th>수량 변경</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="9">등록된 공연표가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<jsp:useBean id="now" class="java.util.Date" />
				<c:forEach var="map" items="${list }">
				<c:set var="prfdate" value="${fn:replace(map['PRFDATE'],'-','') }" />
				<c:set var="prfhour" value="${fn:replace(map['PRFHOUR'],':','') }"/>
				<c:set var="prf" value="${prfdate }${prfhour }"/>
				<fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" var="nowDate" />
				<fmt:parseDate value="${prf }" pattern="yyyyMMddHHmm" var="prfd"/>
				<fmt:formatDate value="${prfd }" pattern="yyyyMMddHHmm" var="prfdh"/>
					<tr>
						<td id="name">${map['PRFNM'] }</td>
						<td>${map['PRFDATE'] }</td>
						<td>${map['PRFHOUR'] }</td>
						<td>${map['SELLCLASS'] }</td>
						<td>${map['SELLTICKET'] }</td>
						<td>${map['SELLED'] }</td>
						<td>
						<c:choose>
							<c:when test="${prfdh>nowDate }">공연 전</c:when>
							<c:otherwise>공연 종료</c:otherwise>
						</c:choose>
						
						</td>
						<td>
						<c:if test="${map['SITUATION']=='N'&& (map['SELLTICKET']-map['SELLED'])>=0 }">
							<input type="button" value="수량 변경" class="btn btn-gradient-info btn-rounded btn-sm editwindow">
							<input type="hidden" value="${map['TICKET_SEQ'] }">
						</c:if>
						</td>
						<td>
						<c:if test="${map['SELLED']=='0'&&map['SITUATION']=='N' }">
						<button type="button" class="btn btn-gradient-info btn-rounded btn-sm del">삭제</button>
						<input type="hidden" value="${map['TICKET_SEQ'] }">
						</c:if>
						</td>
					</tr>
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
            <option value="prfnm" 
            	<c:if test="${param.searchCondition2=='prfnm' }">
            		selected="selected"
            	</c:if>
            >공연명</option>
            <option value="prfhour" 
            	<c:if test="${param.searchCondition2=='prfhour' }">
            		selected="selected"
            	</c:if>
            >공연일</option>
            
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
		$("#aa3").val("1");
		$("#bb1").val("");
		$("#bb2").val("");
		$("form[name=frmPage]").submit();
		
	});
	
	$(".del").click(function() {
		var seq=$(this).next().val();
		if(confirm("해당 설정을 삭제하시겠습니까?")){
			del(seq);
		}
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