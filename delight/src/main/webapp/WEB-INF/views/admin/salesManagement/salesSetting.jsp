<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../inc/adminTop.jsp" %>

<div class="content-wrapper">
	<div>
		<form action="" name="searchFrm">
		<span>장르</span>
		<select id="type" name="type">
			<option value="">장르 선택</option>
			<option value="AAAA">연극</option>
			<option value="AAAB">뮤지컬</option>
		</select>
		 
		<c:import url="/inc/inc_area.do"></c:import>
		 
		<span>시작일</span>
		<input type="text" id="stdate" name="stdate">
		 
		<span>종료일</span>
		<input type="text" id="eddate" name="eddate">
		
		<button type="button">검색</button>
		</form>
	</div>
	
	
</div>

<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
form[name=searchFrm] :not(span){
	margin-left: 20px;
	margin-right: 20px;
}
form[name=searchFrm] span{
	padding-top: 10px;
}
form[name=searchFrm] button{
	margin: 0;
}
</style>
<script type="text/javascript">
$(function() {
	$("#salesManagement").addClass("active");
	$("#sell").addClass("show");
	$("form[name=searchFrm] span").addClass("font-weight-bold");
	$("form[name=searchFrm]").addClass("text-center");
	$("form[name=searchFrm] *").addClass("text-dark");
	$("form[name=searchFrm] select").addClass("form-control");
	$("form[name=searchFrm] select").addClass("form-control-sm");
	$("form[name=searchFrm] input").addClass("form-control");
	$("form[name=searchFrm] input").addClass("form-control-sm");
	$("form[name=searchFrm] button").addClass("btn btn-inverse-success btn-fw btn-sm");
	$("form[name=searchFrm] select").css("width","200px");
	$("form[name=searchFrm] input").css("width","200px");
	$("form[name=searchFrm] *").css("float","left");
	
});

</script>