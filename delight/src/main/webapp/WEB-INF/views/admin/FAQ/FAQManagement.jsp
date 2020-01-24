<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>

<form action="<c:url value='/admin/FAQ/FAQManagement.do'/>" 
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
			<span>질문 유형</span>
			<select name="searchKeyword" id="type" class="form-control-sm">
				<option value="">전체</option>
				<option value="가입"
					<c:if test="${param.searchKeyword=='가입' }">
			            		selected="selected"
			        </c:if>
				>가입</option>
				<option value="예매/결제"
					<c:if test="${param.searchKeyword=='예매/결제' }">
			            		selected="selected"
			        </c:if>
				>예매/결제</option>
				<option value="마일리지"
					<c:if test="${param.searchKeyword=='마일리지' }">
			            		selected="selected"
			        </c:if>
				>마일리지</option>
				<option value="이벤트"
					<c:if test="${param.searchKeyword=='이벤트' }">
			            		selected="selected"
			        </c:if>
				>이벤트</option>
				<option value="기타"
					<c:if test="${param.searchKeyword=='기타' }">
			            		selected="selected"
			        </c:if>
				>기타</option>
			</select>
			</div>
			<form id="frm">
			<div id="tablediv">
				<table class="table text-center table-bordered">
				<colgroup>
					<col style="width: 5%">
					<col style="width: 15%">
					<col style="width: 60%">
					<col style="width: 15%">
					<col style="width: 5%">
				</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="chkAll"></th>
							<th style="font-weight: bold;">유형</th>
							<th style="font-weight: bold;">제목</th>
							<th style="font-weight: bold;">작성일</th>
							<th style="font-weight: bold;">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
						</c:if>
						<c:if test="${!empty list }">
						<c:set var="idx" value="0" />
						<c:forEach var="vo" items="${list }">
						<tr>
							<td>
							<input type="checkbox" id="chk_${idx }" 
							name="faqList[${idx }].faqSeq" 
							value="${vo.faqSeq }">
							</td>
							<td>${vo.faqType }</td>
							<td><a href="#">${vo.faqTitle }</a></td>
							<td>
							<fmt:formatDate value="${vo.faqRegdate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><input type="button" value="삭제" class="btn btn-dark btn-sm"></td>
						</tr>
						<c:set var="idx" value="${idx+1}" />
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div id="btbox" class="text-right">
				<input type="button" value="작성" id="write" class="btn btn-inverse-success btn-sm">
				<input type="button" value="선택 삭제" id="multiDel" class="btn btn-inverse-danger btn-sm">
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
			            <option value="faq_title" 
			            	 <c:if test="${param.searchCondition2=='faq_title' }">
			            		selected="selected"
			            	</c:if> 
			            >제목</option>
			            
			            <option value="faq_regdate" 
			            	 <c:if test="${param.searchCondition2=='faq_regdate' }">
			            		selected="selected"
			            	</c:if> 
			            >작성일</option>
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
	$("#announcement").addClass("active");
	$("#ann").addClass("show");
	
	$("#write").click(function() {
		window.open("/delight/admin/FAQ/FAQWrite.do", "FAQWrite",
		"width=800,height=890,left=0,top=0,location=yes,resizable=yes");
	});
	
	$("table tbody a").click(function() {
		var seq=$(this).parent().parent().find("input[type=checkbox]").val();
		window.open("/delight/admin/FAQ/FAQDetail.do?faqSeq="+seq, "FAQDetail",
		"width=800,height=890,left=0,top=0,location=yes,resizable=yes");
	});
	
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
	
	$("#chkAll").click(function() {
		$("table tbody input[type=checkbox]").prop("checked",this.checked);
	});
	
	$("table tbody input[type=button]").click(function() {
		var faqs=$(this).parent().parent().find("input[type=checkbox]").val();
		if(confirm("해당 FAQ를 삭제 하시겠습니까?")){
			faqDel(faqs);
		}
	});
	
	$("#multiDel").click(function() {
		if($("#tablediv tbody input[type=checkbox]:checked").length>0){
			if(confirm("선택한 FAQ를 삭제하시겠습니까?")){
				$('#frm').prop("action",
				"<c:url value='/admin/FAQ/faqMultiDel.do'/>");	
				$('#frm').submit();
			}
		}else{
			alert("노출 취소 할 이벤트글을 선택해주세요.");
		}
	});
	
});

function faqDel(faqseq){
	$.ajax({
		url: "<c:url value='/admin/FAQ/faqDel.do'/>",
		type:"post",
		data: {
			faqSeq:faqseq
		},
		success:function(res){
			if(res==1){
				alert("해당 FAQ를 삭제하였습니다.");
				$("form[name=frmPage]").submit();
			}else{
				alert("삭제 중 오류 발생!");
			}
		},
		error:function(xhr,status,error){
			alert("Error : "+status+", "+error);
		}
	});
}


</script>