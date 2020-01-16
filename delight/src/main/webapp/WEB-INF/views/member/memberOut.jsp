<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main2Top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/memberOut.css' />">
<script type="text/javascript" src ="<c:url value = '/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("form[name=frm123]").submit(function(){
			if(!$("input[type=radio]").is(":checked")){
				alert("사유를 선택해주세요.");
				$("input[type=radio]").focus();
				event.preventDefault();
			}else if(!$("#chkAgree").is(":checked")){
				alert("동의하셔야합니다.");
				$("#chkAgree").focus();
				event.preventDefault();
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
	
	<div style="width: 87%; float: right;">
	<div class="outDiv">
	<form action="<c:url value = '/member/memberOut.do'/>" method="post" name="frm123">
		<div class="ofirstDiv">
			<p>마이페이지(회원탈퇴)</p>
		</div>
		<div class="osecondDiv">
			<img alt="별이미지" src="<c:url value='/resources/images/sta.jpg' />">
			<p><span>${memberVo.username }님(ID:${sessionScope.userid})의</span> 회원탈퇴 과정입니다.</p>
		</div>
		<div class="othreeDiv">
			<h2>회원탈퇴 주의 사항</h2><br>
			<p>※ <span>회원탈퇴 시, 문화포털아이디 재사용 및 복구 불가 안내</span><br><br>
			회원탈퇴를 신청하시면 현재 로그인 된 아이디는 즉시 탈퇴 처리 되며, 해당 아이디로는 재가입 하실 수 없습니다.<br><br>
			※ <span>회원정보 및 회원제 서비스의 정보 삭제</span><br><br>
			탈퇴 후 회원 정보 및 데이터(마일리지)는 모두 삭제되며,삭제된 데이터는 복구되지 않습니다.<br>
			회원 탈퇴 후 공공적 성격의 게시물은 탈퇴 후에도 삭제되지 않습니다.<br>
			게시물 등의 삭제를 원하시는 경우에는 반드시 삭제하신 후,탈퇴를 신청하시기 바랍니다.<br>
			- 댓글 : 내가 남긴 후기 및 댓글<br>
			- 신청 : 이벤트 참여 신청 댓글<br>
			- 기타 : 타인과 함께 사용하는 공적인 영역의 게시물과 댓글,의견 등
			</p>
		</div>
		<div class="ofourDiv">
			<div class="in1">
			<label>아이디</label><span>${sessionScope.userid}</span>
			</div>
			<div class="in2">
			<label class="inla2">탈퇴 사유</label>
			<c:forEach var="map" items="${list }">
			<input type="radio" name="outReasonNo" value="${map['OUT_REASON_SEQ'] }"><label>${map['OUT_REASON'] }</label>
			</c:forEach>
			<p>※ 회원탈퇴를 신청하시면 현재 로그인 된 아이디는 즉시탈퇴 처리 되며, 해당 아이디로는 재가입 하실 수 없습니다.</p>
			</div>
		</div>
		<div class="olastDiv">
			<input type="checkbox" name="chkAgree" id="chkAgree" class="agree1">
			<label>안내 사항을 모두 확인하였으며,탈퇴 시 아이디의 재사용 및 데이터 복구가 불가함에 동의합니다.</label>
		</div>
		<div class="olasteDiv2">
		<input type="submit" value="회원탈퇴" class="btn btn-secondary btn-lg" id="sub">
		<input type="button" value="취소" class="btn btn-secondary btn-lg" id="can" onclick = "location.href = '<c:url value="/index.do" />' ">
		</div>		
	</form>
	</div>
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	
<%@ include file="../inc/main2Bottom.jsp" %>