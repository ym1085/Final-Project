<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exceluploadImport.jsp</title>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {
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
</head>
<body>
<form id="form1" name="form1" method="post" enctype="multipart/form-data"
 action="<c:url value='/uploadExcelFile.do'/>">
	<select name="area" id="area">
		<option value="">파일 선택</option>
		<option value="sido">시,도파일</option>
		<option value="gugun">구,군파일</option>
	</select>
    <input type="file" id="fileInput" name="fileInput">
    <button type="submit">엑셀업로드 작업</button>
</form>
</body>
</html>