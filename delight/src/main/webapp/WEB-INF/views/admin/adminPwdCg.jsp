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
<script type="text/javascript">
	$(function(){
		$("input[type=button]").click(function() {
			if($("#currPwd").val()<1){
				alert("현재 비밀번호를 입력하세요.");
				$("#currPwd").focus();
			}else if($("#cgPwd").val().length<1){
				alert("변경할 비밀번호를 입력하세요.");
				$("#cgPwd").focus();
			}else if($("#cgPwd2").val().length<1){
				alert("변경할 비밀번호 확인을 입력하세요.");
				$("#cgPwd2").focus();
			}else if($("#cgPwd").val()!=$("#cgPwd2").val()){
				alert("변경할 비밀번호가 서로 다릅니다.");
				$("#cgPwd").focus();
			}else{
				pwdCg();
			}
		});
	});
	
	function pwdCg(){
		$.ajax({
			url: "<c:url value='/admin/adminPwdCg.do'/>",
			type:"post",
			data: $("form[name=frm]").serialize(),
			success:function(res){
				if(res==1){
					alert("비밀번호가 변경되었습니다. 다시 로그인하시기 바랍니다.");
					window.opener.location="<c:url value='/admin/adminLogout2.do'/>";
					self.close();
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
</style>
</head>
<body>

<div class="content-wrapper">
<form name="frm">
<input type="hidden" value="${sessionScope.adminUserid}" id="adId" name="adId">
<fieldset>
<legend>비밀번호 변경</legend>
	<div>
		<label for="currPwd">현재 비밀번호</label>
		<input type="password" name="currPwd" id="currPwd" class="form-control">
	</div>
	<div>
		<label for="cgPwd">변경할 비밀번호</label>
		<input type="password" name="cgPwd" id="cgPwd" class="form-control">
	</div>
	<div>
		<label for="cgPwd2">변경할 비밀번호 확인</label>
		<input type="password" name="cgPwd2" id="cgPwd2" class="form-control">
	</div>
</fieldset>
<div class="text-center" id="btdiv">
	<input type="button" value="변경" class="btn btn-success btn-sm">
</div>
</form>
</div>
</body>
</html>