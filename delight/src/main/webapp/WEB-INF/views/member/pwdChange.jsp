<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Shadow Login Form template Responsive, 
		Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, 
			Flat Web Templates, Login sign up Responsive web template, 
				SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, 
					SonyEricsson, Motorola web design" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script type="text/javascript">
	$(function(){
		$("#accordancePwd").hide();
		$("#discordPwd").hide();
		
		$("#OGpassword").focus();
		
		$("form[name=frmpch]").submit(function(){
			$(".infobox").each(function(idx, item){
				if($(this).val().length<1){
					var str=$(this).prev().html();
					if(str==null || str==''){
						str=$(this).attr("title");						
					} 
					alert(str+"를 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			});	
			
			event.preventDefault();
			
			$.ajax({
				url:"<c:url value='/member/checkPwd.do'/>",
				type:"post",
				data:{"password":$("#OGpassword").val()},
				success:function(res){
					if(res>0){
						$("form[name=frmpch]").submit();
					}else{
						alert("기존비밀번호가 일치하지않습니다.");
						event.preventDefault();
					}
				},
				error:function(xhr, status, error){
					alert("Error : " + status +"=>"+ error);
				}
			});
			
			event.preventDefault();
		});
		
		$("input").keyup(function(){
			var pwd1=$("#password").val();
			var pwd2=$("#password2").val();
			
			if(pwd1!="" || pwd2!=""){
				if(pwd1==pwd2){
					$("#accordancePwd").show();
					$("#discordPwd").hide();
					$("#submit").removeAttr("disabled");
				}else {
					$("#accordancePwd").hide();
					$("#discordPwd").show();
					$("#submit").attr("disabled","disabled");
				}
			}else {	//공백일시
				$("#accordancePwd").hide();
				$("#discordPwd").hide();
				$("#submit").removeAttr("disabled");
			}
		});
		
	});
</script>
<script type="application/x-javascript">
	 /* 이 부분은 건들지 말아주세요. */
	 addEventListener("load", function() { 
		 setTimeout(hideURLbar, 0); 
	 }, false); 
	 
	 function hideURLbar(){ 
		 window.scrollTo(0,1); 
	 } 
</script> 
<!-- Custom Theme files -->
<link href="<c:url value = '/resources/css/login.css'/>" 
	rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->

<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" 
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Arsenal:400,400i,700,700i" 
	rel="stylesheet">
<!-- //web font -->

<body>
	<!-- main -->
	<div class="main-agileinfo slider " style="margin-top: 5%;">
		<div class="items-group">
			<div class="item agileits-w3layouts">
				<div class="block text main-agileits">
					<span class="circleLight"></span>
					<!-- login form -->
					<div class="login-form loginw3-agile">
						<div class="agile-row">
							<h1 style="color: rgb(238,15,116);">비밀번호 변경</h1>
							<div class="login-agileits-top">
								
								<!-- form <-> action -->
								<form action="<c:url value = '/member/pwdChange.do'/>" method="post" name = "frmpch">
									<p>기존비밀번호</p>
									<input type="password" class="infobox" name="OGpassword" id="OGpassword" placeholder="기존비밀번호."/>
									<p>새로운비밀번호</p>
									<input type="password" class="infobox" name="password" id="password" placeholder="새로운비밀번호를 입력해주세요."/>
									<p>새로운비밀번호확인</p>
									<input type="password" class="infobox" name="password2" id="password2" placeholder="확인 비밀번호를입력해주세요."/> 
									<span class = "w3ls-name" id="accordancePwd" style="color: red;font-weight: bold;">※비밀번호가 일치합니다.</span> 
									<span class = "w3ls-name" id="discordPwd" style="color: red;font-weight: bold;">※비밀번호가 일치하지 않습니다.</span>
									<ul style="margin-top: 4%; margin-bottom:4%; font-weight: bold;">
										<li>* 비밀번호가 새로 변경되면 다시 로그인 해주시기 바랍니다.</li>
									</ul>
									<input type="submit" value="비밀번호 변경">
								</form>
								<!-- form <-> action -->
							</div>
						<!-- Check Line -->
						<div class="login-agileits-bottom wthree">
							<h6>
								<a href="<c:url value = '/login/login.do'/>">로그인 창으로 돌아가기</a><br>
								<a href="<c:url value = '/member/register.do'/>">회원가입</a> |
								<a href="<c:url value = '/index.do'/>">HOME</a>
							</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<!-- //main -->
