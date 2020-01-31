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
	    top: 7%;
	    left: 30%;
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
	
	div#buyerforUserSub {
	    width: 365px;
	    height: 135px;
	    position: absolute;
	    top: 55%;
   	 	left: 25%;
	    border: 1px solid red;
	    border-radius: 15px;
	    line-height: 2;
	    text-align: center;
	    background: #e83d3d;
	    color: white;
	    font-size: 1.1em;
	    font-weight: bold;
	}
	
	div#buyerforUserPayment {
    	position: absolute;
    	top: 90%;
    	left: 37%;
	}
	
	input#membershipName {
	    border: 0px;
	    width: 200px;
	    height: 25px;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    background: #e83d3d;
	    color: white;
	}
	
	input#membershipDetail{
		border: 0px;
	    width: 200px;
	    height: 25px;
	    text-align: center;
	    font-size: 14px;
	    font-weight: bold;
	    background: #e83d3d;
	    color: white;
	}
	
	input#payMemberShip {
	    background: lightgoldenrodyellow;
	    width: 100px;
	    height: 40px;
	    border: 2px solid lightgray;
	    font-size: 14px;
	}
	
	input#backtoDetail{
		background: lightgoldenrodyellow;
	    width: 100px;
	    height: 40px;
	    border: 2px solid lightgray;
	    font-size: 14px;
	}

</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		//사용하기
		$("").click(function(){
			//$(opener.document).find("#userid").val("${param.userid}");
			//$(opener.document).find("#chkId").val("Y");
			//$(opener.document).find("#userid").attr("readonly","readonly");
			
		});
		
		$("#payMemberShip").click(function(){
			var membershipName = $("#membershipName").val();
			var membershipDetail = $("#membershipDetail").val();
			
			opener.location.href  = "/delight/member/buyMembership.do?membershipName="+membershipName+"&membershipDetail="+membershipDetail;
			self.close();
		});
		
		$("#backtoDetail").click(function(){
			self.close();
		});
	});
</script>
</head>
<body>
	<form id="buyerforUserMembership" name="buyerforUserMembership" method="post" action="<c:url value='/member/buyMembership.do'/>">
		<div id="buyerforUser">
			<span id="buyerforUser2">
				DELIGHT_PREMIUM<br> 
				MEMBERSHIP 구매
			</span>
		</div>
		
		<div id="buyerforUserSub">
			<input name="membershipName" id="membershipName" value="DelightPremiumMemberShip"
				readonly="readonly">
			<br>
			
			<input name="membershipDetail" id="membershipDetail" value="시즌동안모든예약:10"
				readonly="readonly">%
			<br>
			
			<span name="stDate">
				[구매한 날짜부터 6개월 동안 유효한 회원권]	
			</span>
		</div>
		
		<div id="buyerforUserPayment">
			<input type="button" id="payMemberShip" value="회원권 구매"></button>
			<input type="button" id="backtoDetail" value="돌아가기"></button>
		</div>
	</form>
	
</body>
</html>






