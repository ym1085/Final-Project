<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/adminTop.jsp" %>

<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage.submit();
}
function pageFunc2(curPage){
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}

$(function() {
	$("#normalbt").click(function() {
		$("#aa1").val($("#searchCondition option:selected").val());
		$("#aa2").val($("#searchKeyword").val());
		$("#bb1").val($("#searchCondition2 option:selected").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("form[name=frmPage]").submit();
	});
	$("#eventbt").click(function() {
		$("#bb1").val($("#searchCondition2 option:selected").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("#aa1").val($("#searchCondition option:selected").val());
		$("#aa2").val($("#searchKeyword").val());
		$("form[name=frmPage]").submit();
	});
	
	$("#normalExposure").click(function() {
		if($("#normal tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/announcement/normultiex.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("노출할 공지글을 선택해주세요.");
		}
	});
	
	$("#normalExpoCancle").click(function() {
		if($("#normal tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/announcement/normultiunex.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("노출 취소 할 공지글을 선택해주세요.");
		}
	});
	
	$("#eventExposure").click(function() {
		if($("#event tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch2]').prop("action",
			"<c:url value='/admin/announcement/entmultiex.do'/>");	
			$('form[name=frmSearch2]').submit();
		}else{
			alert("노출할 이벤트글을 선택해주세요.");
		}
	});
	
	$("#eventExpoCancle").click(function() {
		if($("#event tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch2]').prop("action",
			"<c:url value='/admin/announcement/entmultiunex.do'/>");	
			$('form[name=frmSearch2]').submit();
		}else{
			alert("노출 취소 할 이벤트글을 선택해주세요.");
		}
	});
	
	$("#normal thead input[type=checkbox]").click(function(){
		$("#normal tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});
	
	$("#event thead input[type=checkbox]").click(function(){
		$("#event tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});
	
	$("#normalDel").click(function() {
		if($("#normal tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/announcement/multiDel.do?type=1'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("삭제할 공지글을 선택해주세요.");
		}
	});
	
	$("#eventDel").click(function() {
		if($("#event tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch2]').prop("action",
			"<c:url value='/admin/announcement/multiDel.do?type=2'/>");	
			$('form[name=frmSearch2]').submit();
		}else{
			alert("삭제할 이벤트 글을 선택해주세요.");
		}
	});
	
	$("table a").each(function() {
		$(this).click(function() {
			var seq=$(this).parent().parent().find("input[type=checkbox]").val();
			window.open("/delight/admin/announcement/annDetail.do?annSeq="+seq,"detail",
			"width=800,height=890,left=0,top=0,location=yes,resizable=no");
			
		});
	});
	
});

</script>

<form action="<c:url value='/admin/announcement/annInc.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
	
	<input type="hidden" name="searchCondition2"
		value="${param.searchCondition2}" id="bb1">
	<input type="hidden" name="searchKeyword2" 
		value="${param.searchKeyword2}" id="bb2">
	<input type="hidden" name="currentPage2" value="${pagingInfo2.currentPage }">
</form>
    
<div id="parent">
	<!-- 일반 공지글 설정 -->
	<div class="content-wrapper" id="normal">
	<div>
		<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
		<div class="display-3">일반 공지글 설정</div>
		
		<div>
		<table class="table table-bordered table-dark text-center">
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 60%;">
			<col style="width: 10%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="chk"></th>
				<th>공지제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>설정</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list }">
			<tr style="text-align: center">
				<td colspan="5">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:set var="idx" value="0" />
			<c:forEach var="vo" items="${list }">
				<tr>
				<td><input type="checkbox" id="chk_${idx }" 
						name="annList[${idx }].annSeq" 
						value="${vo.annSeq }"></td>
				<td><a href="#">${vo.annTitle }</a>
				<sup class="text-info"><c:if test="${vo.annTop=='Y' }">상단고정</c:if></sup>
				<sub class="text-primary"><c:if test="${vo.annShow=='Y' }">노출</c:if></sub>
				</td>
				<td>${vo.userid }</td>
				<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
				<select class="setup form-control-xm">
					<option value="">선택</option>
					<option value="1">노출</option>
					<option value="2">상단고정</option>
					<option value="3">삭제</option>
				</select>
				</td>
				</tr>
			<c:set var="idx" value="${idx+1}" />
		</c:forEach>
		</c:if>
		</tbody>
		<!-- 반복 끝 -->
	</table>
	</div>
	<div id="btdiv" class="text-right">
		<button class="btn btn-gradient-danger btn-sm" id="normalExposure">선택 노출</button>
		<button class="btn btn-gradient-danger btn-sm" id="normalExpoCancle">선택 노출 취소</button>
		<button class="btn btn-gradient-danger btn-sm" id="normalDel">선택 삭제</button>
	</div>
<div class="divPage text-center">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<button class='btn btn-social-icon btn-outline-youtube btn-sm' onclick="pageFunc(${pagingInfo.firstPage-1})"> &lt;&lt;</button>
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
		<button class="btn btn-social-icon btn-outline-youtube btn-sm" onclick="pageFunc(${pagingInfo.lastPage+1})"> &gt;&gt;</button>
	</c:if>	
	</div><!-- 페이징 -->
	
	<div class="divSearch text-center">
   	
        <select name="searchCondition" id="searchCondition" class="form-control-sm">
            <option value="ann_title" 
            	 <c:if test="${param.searchCondition=='ann_title' }">
            		selected="selected"
            	</c:if> 
            >공지제목</option>
            <option value="userid" 
            	 <c:if test="${param.searchCondition=='userid' }">
            		selected="selected"
            	</c:if> 
            >작성자</option>
            <option value="ann_regdate" 
            	 <c:if test="${param.searchCondition=='ann_regdate' }">
            		selected="selected"
            	</c:if> 
            >작성일</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" id="searchKeyword" class="form-control-sm"
        	value="${param.searchKeyword}">   
		<input type="button" value="검색" id="normalbt" class="btn btn-gradient-dark btn-rounded btn-sm">
	</div>
	
    </form>
	</div>
	</div>
	
	
<!-- ------------------------------------------------------------------------ -->

	<!-- 이벤트 공지글 설정 -->
	<div id="event">
	<div>
	<form name="frmSearch2" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
		<div class="display-3">이벤트 공지글 설정</div>
		<div>
	<table class="table table-bordered text-center">
	<colgroup>
			<col style="width: 5%;">
			<col style="width: 60%;">
			<col style="width: 10%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
	</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="chk2"></th>
				<th>공지제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>설정</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list2 }">
			<tr style="text-align: center">
				<td colspan="5">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list2 }">
			<c:set var="idx2" value="0" />
			<c:forEach var="vo2" items="${list2 }">
				<tr>
				<td><input type="checkbox" id="chk2_${idx2 }" 
						name="annList[${idx2 }].annSeq" 
						value="${vo2.annSeq }"></td>
				<td><a href="#">${vo2.annTitle }</a>
				<sup class="text-info"><c:if test="${vo2.annTop=='Y' }">상단고정</c:if></sup>
				<sub class="text-primary"><c:if test="${vo2.annShow=='Y' }">노출</c:if></sub>
				</td>
				<td>${vo2.userid }</td>
				<td><fmt:formatDate value="${vo2.annRegdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
				<select class="setup form-control-xm">
					<option value="">선택</option>
					<option value="1">노출</option>
					<option value="2">상단고정</option>
					<option value="3">삭제</option>
				</select>
				</td>
				</tr>
			<c:set var="idx2" value="${idx2+1}" />
		</c:forEach>
		</c:if>
		</tbody>
		<!-- 반복 끝 -->
	</table>
	</div>
	<div id="btdiv2" class="text-right">
		<button class="btn btn-gradient-danger btn-sm" id="eventExposure">선택 노출</button>
		<button class="btn btn-gradient-danger btn-sm" id="eventExpoCancle">선택 노출  취소</button>
		<button class="btn btn-gradient-danger btn-sm" id="eventDel">선택 삭제</button>
	</div>
<div class="divPage text-center">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo2.firstPage>1 }">	
		<button class='btn btn-social-icon btn-outline-youtube btn-sm' onclick="pageFunc2(${pagingInfo.firstPage-1})"> &lt;&lt;</button>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	
	<c:forEach var="i" begin="${pagingInfo2.firstPage }" 
		end="${pagingInfo2.lastPage }">
			<c:if test="${i==pagingInfo2.currentPage }">
				<span class='btn btn-success btn-sm'>${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo2.currentPage }">
				<input type='button' value="${i }" class='btn btn-danger btn-sm' onclick="pageFunc2(${i})">
			</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음블럭으로 이동 -->
	<c:if test="${pagingInfo2.lastPage<pagingInfo2.totalPage }">
		<button class="btn btn-social-icon btn-outline-youtube btn-sm" onclick="pageFunc2(${pagingInfo2.lastPage+1})"> &gt;&gt;</button>
	</c:if>	
	</div><!-- 페이징 -->
	
	<div class="divSearch text-center">
   	
        <select name="searchCondition2" id="searchCondition2" class="form-control-sm">
            <option value="ann_title" 
            	 <c:if test="${param.searchCondition2=='ann_title' }">
            		selected="selected"
            	</c:if> 
            >공지제목</option>
            <option value="userid" 
            	 <c:if test="${param.searchCondition2=='userid' }">
            		selected="selected"
            	</c:if> 
            >작성자</option>
            <option value="ann_regdate" 
            	 <c:if test="${param.searchCondition2=='ann_regdate' }">
            		selected="selected"
            	</c:if> 
            >작성일</option>
        </select>   
        <input type="text" name="searchKeyword2" title="검색어 입력"
        	value="${param.searchKeyword2}" id="searchKeyword2" class="form-control-sm">   
		<input type="button" value="검색" id="eventbt" class="btn btn-gradient-dark btn-rounded btn-sm">
	</div>
    </form>
	</div>
	
	</div>
</div>
<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
#normal{
	width: 50%;
	height: 100%;
	float: left;
	font-weight: bold;
}
#event{
	width: 50%;
	height: 100%;
	float: left;
	padding: 44px 36px 44px 36px;
	font-weight: bold;
}
#parent{
	width:100%;
	height: 100%;
}
#btdiv, #btdiv2{
	margin: 20px 5px 5px 0;
}
.divPage{
	margin: 0 0 10px 0;
}
table a:hover{
	text-decoration: none;
	outline: none;
}
#normal table a{
	color: white;
}
#event table a{
	color: black;
}
</style>
<script type="text/javascript">
$(function() {
	$("#announcement").addClass("active");
	$("#ann").addClass("show");
});

</script>