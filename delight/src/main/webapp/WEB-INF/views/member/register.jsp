<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Remove Body/Head/Doc? -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="artifact Order  form a Flat Responsive Widget,
		Login form widgets, Sign up Web forms , Login signup Responsive web form,
			Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />

<script type="application/x-javascript">
	 /* Don't touch this Logic */
	 addEventListener("load", function() { 
		 setTimeout(hideURLbar, 0); 
	 }, false);
		
	 function hideURLbar(){ 
		 window.scrollTo(0,1); 
	 }
</script>
<script type="text/javascript" src ="<c:url value = '/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
       $(document).ready(function () {
    	   $("#output").hide();
	       var count = 60;
	       var timerId;
	       var $output = $("#output");
	       var bool=true;
	       var key;
    	   $("#email3Chk").click(function(){
    		if($("#email1").val().length<1){
    			alert("이메일을입력해주세요");
    			$("#email1").focus();
    			event.preventDefault();
    		}else if($("#email2").val()=='etc' && $("#email3").val().length<1){
    				alert("이메일을입력해주세요");
    				$("#email3").focus();
	    			event.preventDefault();
    		}else{
    			if(bool){
        			
        			$.ajax({
        				type:"post",
        				url:"<c:url value='/Certified.do'/>",
        				data:{ "email1": $("#email1").val(),
        					 "email2": $("#email2").val(),
        					 "email3": $("#email3").val()},
        				dataType:"json",
        				success:function(res){
        					key=res;
        					alert("인증번호발급!");
        				},
        				error:function(xhr, status, error){
        					alert("Error : "+status+", "+ error);
        				}
        			});	
        			
    	    		$("#output").show();
    	    		$("#email3Chk").val("인증하기");
    	            
    	            timerId = setInterval(function(){
    	                // 값 증가
    	                count--;
    	                // 값을 출력
    	                $output.text("00:"+count+"초");
    	            	
    	                if(count==0){
    	                	clearInterval(timerId);
    	                	$("#output").hide();
    	                	 $output.text("01:00초");
    	                	 $("#email3Chk").val("인증번호발송");
							 ket="%#@#$^@";
    	                	 bool=false;
    	                }
    	                
    	            }, 1000);
    	            bool=false;
        		}else{
        			if($("#emailCh").val()==key){
        				alert("인증완료");
        				$("#chkEmail").val("Y");
    	    			clearInterval(timerId);
    	            	$("#output").hide();
    	            	$output.text("01:00초");
    	            	$("#email3Chk").val("인증번호발송");
    	            	$("#email3Chk").hide();
    	            	$("#emailCh").hide();
    	            	bool=true;
        				
        			}else{
        				alert("인증번호일치하지않습니다.");
        			}
        		}
    		}
    		   
    	   });
    	  
        });

</script>

<!-- 스타일 적용 -->
<style type="text/css">
	#name{width:400px; text-transform: lowercase;}
	#userid{width:400px; text-transform: lowercase;}
	#pwd{width:400px;}
	#pwd2{width:400px;}
	#email1{width:200px; text-transform: lowercase;}
	#email2{width:200px;}
	#emailType{color:silver;}
	#email2Chk{width:100px;}
	#email2{width: 145px;}
	#hp1Chk{width: 50px;}
	#hp1{width: 80px;}
	#hp2{width: 90px;margin-left:30px;}
	#hp3{width: 90px;}
	#email3{width: 110px;margin-left: 52px; text-transform: lowercase;}
	#zipcode{width: 150px;}
	#zipcodeChk{width: 400px;display: inline-block;margin-left: -125px;}
	#address{width: 400px;}
	#addressDetail{width: 400px;}
	#gender{margin-left: 70px; width: 80px}
	#email3Chk{width: 110px;}
	#btnChkId{width: 90px;}
	#emailCh{width: 200px;margin-left: 245px;}
	#birth{width: 250px;}
	span#accordancePwd {margin-left: 245px; font-weight: bold; }
	span#discordPwd {margin-left: 245px; font-weight: bold; }
	#accordanceId{margin-left: 245px; font-weight: bold;}
	div#ui-datepicker-div {border: 1px solid gray;padding: 10px;background: white;opacity: 0.8;width: 200px;text-align: center;line-height: 2;}
	table.ui-datepicker-calendar {margin-left: 18px;}
	li.check_li {position: absolute;top: 23em;}
	li.check_li2{position: absolute;top: 31.7em;}
</style>

<!--style_sheet-->
<link href='<c:url value="/resources/css/register.css"/>' 
	rel="stylesheet" type="text/css" media="all" />
<!--style_sheet-->
<link href="//fonts.googleapis.com/css?family=Limelight" 
	rel="stylesheet">
<!--online_fonts-->
<link href="//fonts.googleapis.com/css?family=Yeseva+One" 
	rel="stylesheet">
<!--online_fonts-->
<link href="//fonts.googleapis.com/css?family=Open+Sans" 
	rel="stylesheet">
<!--online_fonts-->
<!--//style_sheet-->

<body>
	<div id = "title">
		<a href="<c:url value = '/index.do'/>">
			<h1 style="margin-left: 3%;">Delight</h1>
		</a>
	</div>
	<div class="w3ls-main">
	<div class="w3ls-form">
	
<form action="<c:url value = '/member/memberWrite.do'/>" method="post" name = "frm">
	<h2>REGiSTER</h2> 
		<ul class="fields1">
			<!-- name -->
			<li>	
				<label class="w3ls-opt">이름</label>
				<div class="w3ls-name">	
					<input type="text" name="username" id = "name" 
						placeholder="이름을 입력하세요.." required="required" maxlength="30"/>
				</div>
			</li>
			
			<!-- userid -->
			<li>
				<label class="w3ls-opt">아이디</label>	
				<span class="w3ls-name">
					<input type="text" name="userid" id = "userid" 
						placeholder="아이디를 입력하세요.." maxlength="15"/>
					<input class="price" type="button" value="중복확인" id="btnChkId" 
						 oninvalid="this.setCustomValidity('아이디는 반드시 입력되어야 합니다!')" required>
				</span>
				<li class="check_li">
					<span class = "w3ls-name" id="accordanceId" stlye="color:red">
						아이디는 영문대소문자,숫자로 시작하는 문자열만 가능합니다!
					</span> 
				</li>
			</li>
			
			<!-- pwd -->
			<li>
				<label class="w3ls-opt">비밀번호</label>	
				<span class="w3ls-name">
					<input type="password" name="password" id = "pwd"
						placeholder="비밀번호를 입력하세요.." maxlength="15" required />
				</span>
			</li>
			
			<li>
				<label class="w3ls-opt">비밀번호확인</label>	
				<span class="w3ls-name">
					<input type="password" name="password2" id = "pwd2"
						placeholder="비밀번호를 입력하세요.." maxlength="15" required="required"/>
				</span>
				
				<li class = "check_li2">
					<span class = "w3ls-name" id="accordancePwd">비밀번호가 일치합니다.</span> 
					<span class = "w3ls-name" id="discordPwd">비밀번호가 일치하지 않습니다.</span>
				</li>
			</li>
			
			<li>
				 <label class="w3ls-opt">생년월일</label>
				 <span class="w3ls-name">
   				 <input type="text" id="birth" name="birth" required="required"/>
				 </span>
			</li>
			
			<!-- email1,email2 -->
			<li>
				<label class="w3ls-opt">이메일</label>	
					<input type="text" name="email1" id = "email1" 
						placeholder="이메일을 입력해주세요" required="required"/>
						<span id = "emailType">@</span>
					
					<!-- SELECT-OPTION -->
					<span class="w3ls-text w3ls-name" id = "email2Chk">
						<select id = "email2" name = "email2">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="etc">직접 입력</option>
						</select>
					</span>
					<!-- email3 -->
					<input type="text" name="email3" id = "email3"title="직접입력인 경우 이메일 뒷자리 보여줌"
        				style="visibility:hidden"/><br>
        			<input type="text" name="emailCh" id = "emailCh"/>
					<input class="price" type="button" value="인증번호발송" name="email3Chk" id="email3Chk"/>
					<span id="output" style="color: white;margin-left: 20px;">1:00 초</span>
			</li>
			
			<!-- hp1,hp2,hp3 -->
			<li>
				<span class="w3ls-text w3ls-name" id = "hp1Chk">
					<select id = "hp1" name = "hp1" required="required">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
						<option value="016">016</option>
					</select>
				</span>
				
				<label class="w3ls-opt">전화번호</label>	
					<input type="text" name="hp2" id = "hp2" required="required" maxlength="4"/>
					<input type="text" name="hp3" id = "hp3" required="required" maxlength="4"/>
			</li>
			
			<!-- zipcode -->
			<li>
				<label class="w3ls-opt">우편번호</label>
				<input type="text" name="zipcode" id = "zipcode"> 
				
				<!-- API연동 -->
				<input class="price" type="button" value="우편번호 찾기" onclick="openZipSearch()">
			</li>
			
			<!-- address -->
			<li>
				<label class="w3ls-opt">주소</label>
				<input type="text" name="address" id = "address"> 
			</li>
			
			<!-- addressDetail -->
			<li>
				<label class="w3ls-opt">상세주소</label>
				<input type="text" name="addressDetail" id = "addressDetail"> 
			</li>
			
			<li>
				<span class="w3ls-text w3ls-name" id = "genderChk">
				<label class="w3ls-opt">성별</label>
					<select id = "gender" name = "gender">
						<option value="남">남</option>
						<option value="여">여</option>
					</select>
					<label class="anim" style="margin-left: 100px;"> 
					<input type="checkbox" class="checkbox" name = "mailAgreement"> 
					<span style="color: white;">Email 수신여부</span>
					</label>
				</span>
			</li>
		</ul>
		
		<div class="clear"></div>
		<div class="w3ls-btn">
		<input type="submit" id = "submit" value="회원 가입" style="font-weight: bold;">
	</div>
	
	<!-- 중복/이메일 인증 -->
	<input type="hidden" name="chkId" id="chkId" value="N">			<!-- 중복확인 -->
	<input type="hidden" name="chkEmail" id="chkEmail" value="N">	<!-- email인증 -->
</form>
</div>
</div>
</body>
</html>