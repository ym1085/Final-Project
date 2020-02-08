<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/css/vendor.bundle.base.css'/>">
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/css/style.css'/>">
    <!-- End layout styles -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/js/off-canvas.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/hoverable-collapse.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/misc.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#find").click(function() {
			if($("#userid").val()<1){
				alert("아이디를 입력하세요");
				$("#userid").focus();
			}else if($("#username").val().length<1){
				alert("이름을 입력해주세요");
				$("#username").focus();
			}else if($("#birth").val().length<1){
				alert("생년월일을 선택해주세요");
				$("#birth").focus();
			}else if($("#email1").val().length<1){
				alert("이메일을 입력해주세요");
				$("#email1").focus();
			}else if($("#email2").val()=='etc'){
				alert("이메일을 입력해주세요");
				$("#email3").focus();
			}else{
				pwdFind();
			}
		});
	});
	
	function pwdFind(){
		$.ajax({
			url: "<c:url value='/admin/adminfindpwd.do'/>",
			type:"post",
			data: $("form[name=frm]").serialize(),
			success:function(res){
				if(res==1){
					alert("임시 비밀번호가 메일로 전송 되었습니다.");
					self.close();
				}else if(res==-1){
					alert("존재하지 않는 관리자입니다.");
				}else if(res==0){
					alert("무슨경우일까?");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
</script>
<style type="text/css">
	body{
		margin: 0 auto;
	}
	#btdiv{
		margin-top: 15px;
	}
	label {
		margin-top: 10px;
	}
	#email1,#email3{
		width: 25%;
	}
	#emailbody{
		overflow: hidden;
		margin-top: 10px;
	}
	#emailbody *{
		float: left;
	}
</style>
</head>
<body>

<div class="content-wrapper">
<form name="frm">
<fieldset>
<legend>비밀번호 찾기</legend>
	<div>
		<label for="currPwd">아이디</label>
		<input type="text" name="userid" id="userid" class="form-control">
	</div>
	<div>
		<label for="currPwd">이름</label>
		<input type="text" name="username" id="username" class="form-control">
	</div>
	<div>
		<label for="cgPwd">생년월일</label>
		<input type="text" name="birth" id="birth" class="form-control">
	</div>
	<div id="emailbody">
		<label for="cgPwd2">이메일</label>
		<input type="text" name="email1" id = "email1" class="form-control"/>
		<span id = "emailType">@</span>
					
		<!-- SELECT-OPTION -->
		<span class="w3ls-text w3ls-name" id = "email2Chk" >
			<select id = "email2" name = "email2" class="form-control">
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="etc">직접 입력</option>
			</select>
		</span>
		<!-- email3 -->
		<input type="text" name="email3" id = "email3" style="visibility:hidden"  class="form-control"/><br>
	</div>
</fieldset>
<div class="text-center" id="btdiv">
	<input type="button" value="찾기" class="btn btn-success btn-sm" id="find">
</div>
</form>
</div>
</body>
</html>