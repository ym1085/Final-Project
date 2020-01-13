<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css' />">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<style type="text/css"> 
	body{
		 margin-left: 28%;
   		 margin-right: 40%;
   		 margin-top: 2%;
   		 margin-bottom: 2%;
	}
	#agree{
		width:800px;
	}
	.divChk{
		text-align: right;
		margin:10px 0; 
	}
	.divChk ~ div{
		text-align: center;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#chkAll").click(function(){
			$("#agree #chkAgree").prop("checked",this.checked);
		});
		
		$("#agree form[name=frmAgree]").submit(function(){
			 if(!$(".agree1").is(":checked")){
				alert("약관에 동의하셔야합니다.");
				$(".agree1").focus();
				event.preventDefault();
			 }else if(!$(".agree2").is(":checked")){
				alert("약관에 동의하셔야합니다.");
				$(".agree2").focus();
				event.preventDefault();
			 }
			
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style=" background-size: cover;
	background-position: 50% 50%; background-image: url('<c:url value='/resources/images/del3.jpg'/>');">
<article id="agree">
	<h2 style="color: white;">회원 약관</h2>
	<div class="divChk">
			<input type="checkbox" name="chkAll" id="chkAll">
			<label for="chkAgree" style="color: white;">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
	</div>
	<iframe style="background: white;" src='<c:url value="/agree/provision2.html"/>' width="800" height="400"></iframe>
	<div class="divChk" style="margin-left: 78%;">
			<input type="checkbox" name="chkAgree" id="chkAgree" class="agree1">
			<label for="chkAgree" style="color: white;">약관에 동의합니다.</label>
	</div>
	<iframe style="background: white;" src='<c:url value="/agree/provision3.html"/>' width="800" height="400"></iframe>
	<form name="frmAgree" method="post" action='<c:url value="/member/register.do"/>'>
		<div class="divChk">
			<input type="checkbox" name="chkAgree" id="chkAgree" class="agree2">
			<label for="chkAgree" style="color: white;">약관에 동의합니다.</label>
		</div>
		<div style="margin-top: 15px;">
			<input type="submit" value="동의" class="btn btn-primary btn-lg" style="width: 250px;">
			<input type="reset" value="비동의" class="btn btn-secondary btn-lg" style="width: 250px;">
		</div>		
	</form>
</article>
</body>
</html>