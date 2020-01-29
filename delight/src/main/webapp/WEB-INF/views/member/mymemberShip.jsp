<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맴버쉽 구입</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mainstyle.css'/>">
<style type="text/css">
div#buyerforUser {
    width: 300px;
    height: 200px;
    text-align: center;
    line-height: 1.5;
    position: absolute;
    top: 25%;
    left: 25%;
    border: 1px solid #F44336;
    border-radius: 15px;
    background: red;
}

span#buyerforUser2 {
    position: absolute;
    top: 30%;
    right: 15%;
    font-size: 1.5em;
    color: white;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		//사용하기
		$("#btUse").click(function(){
			$(opener.document).find("#userid").val("${param.userid}");
			$(opener.document).find("#chkId").val("Y");
			$(opener.document).find("#userid").attr("readonly","readonly");
			
			self.close();
		});
		
	});
</script>
</head>
<body>
	<form name="frm" method="post" action="<c:url value='/member/checkUserid.do'/>">
		<div id="buyerforUser">
			<span id="buyerforUser2">
				DELIGHT_PREMIUM<br> 
				MEMBERSHIP 구매
			</span>
		</div>
	</form>
</body>
</html>






