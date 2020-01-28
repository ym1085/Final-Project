<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/main2Top.jsp" %>

<style type="text/css">
	.paymentDivParent {width: 100%;height: 65px;text-align: center;margin-top: 50px;font-weight: 400;font-size: 2.0em;border-bottom: 0.5px solid lightgray;}
	.paymentDivtop {width: 100%;height: 700px;}
	.paymentTable{margin-left: 20%;margin-top: 100px;border: 0px solid;}    
	.paymentTable > tbody  th,td{height: 50px; padding-left: 8px;}
	.paymentTable > tbody  th{font-size: 20px; background-color:#f8f8f8;font-weight: 300;border-bottom: 1.5px solid lightgray;}
	.paymentTable > tbody  td{font-size: 16px; padding-top: 10px;padding-bottom: 10px;line-height: 2.2;border-bottom: 1.5px solid lightgray;}
	#reservaitonNumber{margin-left: 10px;border: 0px;background-color: red; box-shadow: 1px 1px 2px red; color: white; font-weight: 500;}
	#reservationNumExplain{font-size: 14px; color: red; font-weight: bold;}
	#reservationExplain{font-weight: bold;color: red;font-size: 14px}
	#home{width:70px; height:45px; border: 0px;background-color: red; box-shadow: 1px 1px 2px red; color: white; font-weight: 500;margin-right: 7px;}
	#chkReservation{width:80px; height:45px;border: 0px;background-color: blue; box-shadow: 1px 1px 2px blue; color: white; font-weight: 500;}
	.forButton {text-align: center;margin-top: 65px;}
	#spectators{border: 0;color: #9a9898;width: 250px;}
	#spectatorsUser{border: 0;color: #9a9898;width: 20px;}
	#ticketerEmail{border: 0;color: #9a9898;width: 250px;}
	#ticketerEmailUser{border: 0;color: #9a9898;width: 250px;}
	
	#spectators{outline-style: none;}
	#spectatorsUser{outline-style: none;}
	#ticketerEmailUser{outline-style: none;}
	#ticketerEmail{outline-style: none;}
	
}
</style>

<script type="text/javascript">
	$(function(){
		$("#reservaitonNumber").click(function(){
			var test = $("#ticketingNumber").html();
			var result = confirm('해당 이메일로 예매번호를 발송하시겠습니까?'); 
			alert(test);
		
			if(result) {//확인 클릭 
				if($("#certifiedUserid").val()==''){//비회원
					$.ajax({
						type:"post",
						url:"<c:url value='/sendTicketNum.do'/>",
						data:{"unuseremail2": $("#spectators").val(),
							  "ticketingNumber":$("#ticketingNumber").html()},
						
						success:function(res){
							key=res;
							alert("예매번호 발송!");
						},
						error:function(xhr, status, error){
							alert("Error : "+status+", "+ error);
						}
					});
				}else {//회원
					$.ajax({
						type:"post",
						url:"<c:url value='/sendTicketNumUser.do'/>",
						data:{"useremail2": $("#spectatorsUser").val(),
							  "ticketingNumber":$("#ticketingNumber").html()},
						
						success:function(res){
							key=res;
							alert("예매번호 발송!");
						},
						error:function(xhr, status, error){
							alert("Error : "+status+", "+ error);
						}
					});
				}
			}else { //취소 클릭 

			}


		});
	});
</script>

	<!-- 페이지 만들떄마다 복붙 -->
	<div style="width: 13%; float: left; height: 100%;">
		<!-- left side -->
		<aside class="left-sidebar" style="width: 13%;">
			<div class="logo" style="margin-bottom: 63%;">
				<a href="#welcome"
					style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
					Delight </a>
			</div>
	
			<nav class="left-nav" style="margin-top: 100%;">
				<ul id="nav">
					<li class="active"><a href="#contact-form">Contact Form</a></li>
					<li><a href="#subscription-form">Subscription Form</a></li>
					<li><a href="#video">Video Tutorial</a></li>
					<li><a href="#credit">Source and Credit</a></li>
					<li>
					<div
					style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
				</ul>
			</nav>
		</aside>
		<!-- left side -->
	</div>
	<!-- 페이지 만들떄마다 복붙 -->
	
	<!-- div안에서작업 그외엔 건들지말것 -->
		
	<div style="width: 87%; float: right; height: 100%;">
		<div class="paymentDivParent">결 제 완 료</div>
		
		<div class="paymentDivtop">
			<table border="1" class="paymentTable">
				<colgroup>
					<col style="width:220px;">
					<col style="width:700px">
				</colgroup>
				
				<tbody>
					<tr>
						<th scope="col">예매번호</th>
						<td scope="col">
							<!-- 예매번호 -->
							<span id="ticketingNumber">${pay_ticket_number}</span> 
							<input type="button" name="reservaitonNumber" id="reservaitonNumber" value="예매정보 발송"><br>
							<span id="reservationNumExplain">※ 인증번호 발송 시 관람자 분 이메일로 예매번호가 전송됩니다.</span>	
						</td>
					</tr>
					
					<tr>
						<th scope="col">예매정보</th>
						<td scope="col">
							연극제목 : ${prfnm}<br>
							선택된 기간 : ${select_date}<br>
							선택된 시간 : ${select_time}<br>
							공연 장소 : ${perfomplace}<br>
							좌석 등급 : ${seat_class}<br>
						</td>
					</tr>
					
					<tr>
						<th scope="col">예약자 정보</th>
						<c:if test="${empty sessionScope.userid }">
							<td scope="col">
								예매자명 : ${unusername}<br>
								
								<span>예매자 이메일 : </span>
								<input type="text" name="ticketerEmail" 
									id="ticketerEmail" value="${unuseremail}" readonly="readonly">
								
								<br> 
								<span id="reservationExplain">
									※ 예매번호를 포함한 모든 정보는 관람자의 이메일로 발송됩니다. 
								</span>
							</td>
						</c:if>
						
						<c:if test="${!empty sessionScope.userid }">
							<td scope="col">
								예매자명 : ${username}<br>
								
								<span>예매자 이메일 : </span><input type="text" name="ticketerEmailUser" 
									id="ticketerEmailUser" value="${useremail}" readonly="readonly">
								
								
								예매자 폰번호 : ${hp}<br> 
								<span id="reservationExplain">
									※ 예매번호를 포함한 모든 정보는 관람자의 이메일로 발송됩니다. 
								</span>
							</td>
						</c:if>
					</tr>	
					
					<tr>
						<th scope="col">관람자 정보</th>
						<c:if test="${empty sessionScope.userid }">
							<td scope="col">
								관람자명 : ${unusername2}<br> 	
								
								<span>관람자 이메일 : </span>
								<input type="text" name="spectators" 
									id="spectators" value="${unuseremail2}" readonly="readonly"> 
							</td>
						</c:if>
						
						<c:if test="${!empty sessionScope.userid }">
							<td scope="col">
								관람자명 : ${username2}<br> 	
								
								<span>관람자 이메일 : </span>
								<input type="text" name="spectatorsUser" 
									id="spectatorsUser" value="${useremail2}" readonly="readonly"> 
							</td>
						</c:if>
					</tr>
				</tbody>
			</table>
			<!-- 끝 -->
			
			<div class="forButton">
				<a href="<c:url value='/index.do'/>">
					<input type="button" name="home" id="home" value="Home">
				</a>
			
				<a href="<c:url value='#'/>">
					<input type="button" name="chkReservation" id="chkReservation" value="예약 확인">
				</a>
			</div>
			
			<!-- 유저 아이디가 체크용 -->
			<!-- 유저 아이디 Null || ym1085 -->
			<input type="hidden" name="certifiedUserid" id="certifiedUserid" value="${chkuserid}">
		</div>
	</div>

<%@ include file="../inc/main2Bottom.jsp" %>