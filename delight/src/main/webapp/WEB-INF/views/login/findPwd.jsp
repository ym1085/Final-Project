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
		$("#userid").focus();
		
		$("form[name=frm]").submit(function(){
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
							<h1 style="color: rgb(238,15,116);">비밀번호 찾기</h1>
							<div class="login-agileits-top">
								
								<!-- form <-> action -->
								<form action="<c:url value = '/member/login.do'/>" method="post" name = "frm">
									<p>아이디</p>
									<input type="text" class="infobox" name="userid" id="userid" placeholder="아이디를 입력해주세요."/>
									<p>이름</p>
									<input type="text" class="infobox" name="name" id="name" placeholder="이름을 입력해주세요."/>
									<p>이메일</p>
									<input type="text" class="infobox" name="email" id="email" placeholder="이메일을 입력해주세요."/> 
									<ul style="margin-top: 4%; margin-bottom:4%; font-weight: bold;">
										<li>회원가입 시 등록하신 아이디와 이름, 이메일주소를 통해 임시비밀번호를 재발급 받으실 수 있습니다. 회원가입 시 등록하신 이메일을 입력해주시기 바랍니다.</li>
									</ul>
									<input type="submit" value="비밀번호 찾기">
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
