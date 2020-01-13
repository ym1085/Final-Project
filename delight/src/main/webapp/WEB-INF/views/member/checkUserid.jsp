<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mainstyle.css'/>">
<style type="text/css">
	.error{
		color:red;
		font-size: 1.0em;
		display: none;
	}
	
	h1{
		text-align: center;
	}

</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#userid").focus();
		
		$("form[name=frm]").submit(function(){
			if($("#userid").val()==''){
				$(".error").show();
				$("#userid").focus();	
				event.preventDefault();
			}
		});
		
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
	<h1>아이디 중복검사</h1>
	<form name="frm" method="post" action="<c:url value='/member/checkUserid.do'/>">
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" value="${param.userid}">
		<input type="submit" value="아이디 확인">
		<span class="error">아이디를 입력하세요</span>
		
		<c:if test="${result==EXIST_ID }">		
			<p style="color:red">이미 등록된 아이디입니다. 다른 아이디를 입력해주세요..</p>
		</c:if>	
		
		<c:if test="${result==USEFUL_ID }">		
			<button id="btUse" type="button">사용하기</button>
			<p style="color:red">사용가능한 아이디입니다. [사용하기] 버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>






