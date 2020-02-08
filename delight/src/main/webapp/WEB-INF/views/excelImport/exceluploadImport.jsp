<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../admin/inc/adminTop.jsp" %>
<script type="text/javascript">
$(function() {
	$("#excel").addClass("active");
	$("#form1").submit(function() {
		if( $("#fileInput").val() != "" ){
			var ext = $('#fileInput').val().split('.').pop().toLowerCase();
			      if($.inArray(ext, ['xls','xlsx']) == -1) {
				 alert('xls,xlsx 파일만 업로드 할수 있습니다.');
				 event.preventDefault();
			      }
			}
		
		if($("#area").val()==''){
			alert("파일 선택!!");
			$("#fileInput").focus();
			event.preventDefault();
		}
	});
})
</script>
<div class="content-wrapper">
<div class="card">
<div class="card-body">
<form id="form1" name="form1" method="post" enctype="multipart/form-data"
 action="<c:url value='/admin/uploadExcelFile.do'/>">
	<select name="area" id="area">
		<option value="">파일 선택</option>
		<option value="sido">시,도파일</option>
		<option value="gugun">구,군파일</option>
		<option value="faq">FAQ파일</option>
	</select>
    <input type="file" id="fileInput" name="fileInput">
    <button type="submit">엑셀업로드 작업</button>
</form>
</div>
</div>
</div>
<%@include file="../admin/inc/adminBottom.jsp" %>