<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>

<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}
function pageFunc2(curPage){
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage.submit();
}

$(function() {
	$("form[name=frmSearch]").submit(function() {
		event.preventDefault();
		$("#aa1").val($("#searchCondition option:selected").val());
		$("#aa2").val($("#searchKeyword").val());
		$("#bb1").val($("#searchCondition2 option:selected").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("form[name=frmPage]").submit();
	});
	$("form[name=frmSearch2]").submit(function() {
		event.preventDefault();
		$("#bb1").val($("#searchCondition2 option:selected").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("#aa1").val($("#searchCondition option:selected").val());
		$("#aa2").val($("#searchKeyword").val());
		$("form[name=frmPage]").submit();
	});


	
	$("#normal thead input[type=checkbox]").click(function(){
		$("#normal tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});
	
	$("#event thead input[type=checkbox]").click(function(){
		$("#event tbody input[type=checkbox]")
			.prop("checked", this.checked);
	});
	
	$("#multiforcedExit").click(function() {
		if($("#normal tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch]').prop("action",
			"<c:url value='/admin/userManagement/multiforcedExit.do'/>");	
			$('form[name=frmSearch]').submit();
		}else{
			alert("강퇴할 회원을 선택해주세요.");
		}
	});
	
	$("#multiCancle").click(function() {
		if($("#event tbody input[type=checkbox]:checked").length>0){
			$('form[name=frmSearch2]').prop("action",
			"<c:url value='/admin/userManagement/multiCancle.do'/>");	
			$('form[name=frmSearch2]').submit();
		}else{
			alert("탈퇴 취소할 회원을 선택해주세요.");
		}
	});
	
	$("table a").each(function() {
		$(this).click(function() {
			var id=$(this).parent().parent().find("input[type=checkbox]").val();
			window.open("/delight/admin/userManagement/paymentList.do?userid="+id,"detail",
			"width=800,height=890,left=0,top=0,location=yes,resizable=no");
			
		});
	});
	
	$("#normal tbody button").click(function() {
		var userid=$(this).parent().parent().find("input[type=checkbox]").val();
		if(confirm("해당 회원을 강퇴 하시겠습니까?")){
			$.ajax({
				url: "<c:url value='/admin/userManagement/forcedExit.do'/>",
				type:"post",
				data: {
					userid : userid
				},
				success:function(res){
					if(res==1){
						alert("해당 회원을 강퇴하였습니다.");
						$("form[name=frmPage]").submit();
					}else{
						alert("강퇴 중 오류 발생!!");
					}
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
		}
	});
	
	$("#event tbody button").click(function() {
		var userid=$(this).parent().parent().find("input[type=checkbox]").val();
		if(confirm("해당 회원을 탈퇴를 취소 하시겠습니까?")){
			$.ajax({
				url: "<c:url value='/admin/userManagement/cancle.do'/>",
				type:"post",
				data: {
					userid : userid
				},
				success:function(res){
					if(res==1){
						alert("해당 회원을 탈퇴 취소 하였습니다.");
						$("form[name=frmPage]").submit();
					}else{
						alert("탈퇴 취소 중 오류 발생!!");
					}
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
		}
	});
	
	$("#exceldown").click(function() {
		if(confirm("회원 목록을 다운로드 하시겠습니까?")){
			location.href='/delight/userListExcelDown.do';		
		}
	});
	
	
});

</script>

<form action="<c:url value='/admin/userManagement/userList.do'/>" 
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
	<!-- 비탈퇴 회원 설정 -->
	<div class="content-wrapper" id="normal">
	<div>
		<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
		<div class="display-4 ti">비탈퇴 회원 설정
		<button type="button" class="btn btn-gradient-info btn-icon-text btn-sm" id="exceldown">회원목록 다운
		<i class="mdi mdi-cloud-download"></i>
		</button>
		</div>
		
		<div>
		<table class="table table-bordered table-dark text-center">
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 20%;">
			<col style="width: 22%;">
			<col style="width: 10%;">
			<col style="width: 23%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="chk"></th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>로그아웃 일자</th>
				<th>등급</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list }">
			<tr style="text-align: center">
				<td colspan="7">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:set var="idx" value="0" />
			<c:forEach var="vo" items="${list }">
				<tr>
				<td><input type="checkbox" id="chk_${idx }" 
						name="memberList[${idx }].userid" 
						value="${vo.userid }"></td>
				<td><a href="#" title="결제목록보기">${vo.userid }</a>
				</td>
				<td>${vo.birth }</td>
				<td>${vo.gender }</td>
				<td><fmt:formatDate value="${vo.logoutDate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${vo.gradeName }</td>
				<td>
				<button type="button" class="btn btn-gradient-danger btn-sm">강퇴</button>
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
		<button type="button" class="btn btn-gradient-danger btn-sm" id="multiforcedExit">선택 강퇴</button>
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
   	
        <select name="searchCondition" id="searchCondition" class="form-control-sm">
            <option value="userid" 
            	 <c:if test="${param.searchCondition=='userid' }">
            		selected="selected"
            	</c:if> 
            >아이디</option>
            <option value="birth" 
            	 <c:if test="${param.searchCondition=='birth' }">
            		selected="selected"
            	</c:if> 
            >생년월일</option>
            <option value="grade_name" 
            	 <c:if test="${param.searchCondition=='grade_name' }">
            		selected="selected"
            	</c:if> 
            >등급</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" id="searchKeyword" class="form-control-sm"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색" id="normalbt" class="btn btn-gradient-dark btn-rounded btn-sm">
	</div>
	
    </form>
	</div>
	</div>
	
	
<!-- ------------------------------------------------------------------------ -->

	<!-- 탈퇴회원 설정 -->
	<div id="event">
	<div>
	<form name="frmSearch2" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
		<div class="display-4 ti">탈퇴회원 설정</div>
		<div>
	<table class="table table-bordered text-center">
	<colgroup>
			<col style="width: 5%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 5%;">
			<col style="width: 20%;">
			<col style="width: 20%;">
			<col style="width: 10%;">
	</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="chk2"></th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>탈퇴일</th>
				<th>탈퇴사유</th>
				<th>탈퇴취소</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list2 }">
			<tr style="text-align: center">
				<td colspan="7">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list2 }">
			<c:set var="idx2" value="0" />
			<c:forEach var="map" items="${list2 }">
				<tr>
				<td><input type="checkbox" id="chk2_${idx2 }" 
						name="memberList[${idx2 }].userid" 
						value="${map['USERID'] }"></td>
				<td><a href="#" title="결제목록 보기">${map['USERID'] }</a>
				</td>
				<td>${map['BIRTH'] }</td>
				<td>${map['GENDER'] }</td>
				<td><fmt:formatDate value="${map['OUT_DATE'] }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${map['OUT_REASON'] }</td>
				<td>
				<button type="button" class="btn btn-gradient-danger btn-sm">탈퇴 취소</button>
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
		<button type="button" class="btn btn-gradient-danger btn-sm" id="multiCancle">선택 탈퇴 취소</button>
	</div>
<div class="divPage text-center">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo2.firstPage>1 }">	
		<button type="button" class='btn btn-social-icon btn-outline-youtube btn-sm' onclick="pageFunc2(${pagingInfo.firstPage-1})"> &lt;&lt;</button>
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
            <option value="userid" 
            	 <c:if test="${param.searchCondition2=='userid' }">
            		selected="selected"
            	</c:if> 
            >아이디</option>
            <option value="birth" 
            	 <c:if test="${param.searchCondition2=='birth' }">
            		selected="selected"
            	</c:if> 
            >생년월일</option>
            <option value="out_date" 
            	 <c:if test="${param.searchCondition2=='out_date' }">
            		selected="selected"
            	</c:if> 
            >탈퇴일</option>
        </select>   
        <input type="text" name="searchKeyword2" title="검색어 입력"
        	value="${param.searchKeyword2}" id="searchKeyword2" class="form-control-sm">   
		<input type="submit" value="검색" id="eventbt" class="btn btn-gradient-dark btn-rounded btn-sm">
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
.ti{
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#userManagement").addClass("active");
	$("#user").addClass("show");
	
});

</script>