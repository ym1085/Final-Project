<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Delight</title>
<link
	href="<c:url value='https://fonts.googleapis.com/css?family=Oswald:300,400,500' />"
	rel="stylesheet">
<link
	href="<c:url value='https://fonts.googleapis.com/css?family=Roboto:300i,400,500' />"
	rel="stylesheet">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/idxresources/vendor/bootstrap/bootstrap.min.css' />">
<!-- right css -->
<link rel="stylesheet"
	href="<c:url value='/resources/idxresources/css/style.css' />">
<!-- left css-->
<link rel="stylesheet"
	href="<c:url value='/resources/idxresources/css/main.css' />">

<style type="text/css">
.left-sidebar {
	background-image:
		url("<c:url value='/resources/idxresources/img/del11.jpg'/>");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body style="background: white;">
		<!-- 라이트바 건들지마시오 -->
		<!-- ================right side =================-->
		<div class="side_menu" style="max-width: 18%;">
			<ul class="list menu_right">
				<li>MY STATUS</li>
			</ul>
			<div style="border: 1px dotted white; width: 100%; margin-top: 30%;"></div>
			
			<!-- 로그인 안된경우 (시작)-->
			<c:if test="${empty sessionScope.userid }">
				<div id="q1">
					<button type="button" class="btn btn-success btn-lg"
					onClick="location.href='<c:url value="/login/login.do" />'">로그인</button>
					<button type="button" class="btn btn-secondary btn-lg"
					onClick="location.href='<c:url value="/login/findPwd.do" />'">비밀번호 찾기</button>
				</div>
				<div id="q2">
					<button type="button" class="btn btn-secondary btn-lg" id="topLogin"
					onClick="location.href='<c:url value="/member/register.do" />'">회원가입</button>
				</div>
			<div id="q3">
			<ul>
				<li>문의하기</li>
			</ul>
			<div style="border: 1px dotted white; width: 100%; margin-top: 11%;"></div>
			</div>
			<form action="" name="frm123">
				<div class="right_list">
					<input type="text" id="name" placeholder="이름"><br>
					<input type="text" id="email" placeholder="이메일"><br>
					<input type="text" id="hp" placeholder="연락처"><br>
					<input type="text" id="title" placeholder="제목"><br>
					<textarea rows="20" cols="32" placeholder="내용"></textarea>
				</div>
				<input type="button" class="btn btn-secondary btn-lg" value="보내기" id="SideQnA">
			</form>
			</c:if>
			<!-- 로그인 안된경우 (끝)-->
			
			<!-- 로그된경우 (시작)-->
			<c:if test="${!empty sessionScope.userid }">
				<br>
				<div id="q2" style="color: white;">
					<p><span style="font-weight: bold;font-size: 1.4em;">*${memberVo.username }</span> 님 어서오세요.</p><br>
					<p>*마일리지 : <fmt:formatNumber value="${memberVo.mileagePoint }" pattern="#,###" /> 원</p>
					<p>*멤버십 등급 : ${memberVo.gradeName }</p>
					<p>*가입일 : <fmt:formatDate value="${memberVo.joinDate }" pattern="yyyy-MM-dd"/></p>
				</div>
				<div id="q1">
					<button type="button" class="btn btn-success btn-lg"
					onClick="location.href='<c:url value="#" />'">마이페이지</button>
					<button type="button" class="btn btn-secondary btn-lg"
					onClick="location.href='<c:url value="/login/logout.do" />'">로그아웃</button>
				</div>
			<div id="q3">
			<ul>
				<li>문의하기</li>
			</ul>
			<div style="border: 1px dotted white; width: 100%; margin-top: 11%;"></div>
			</div>
			<form action="" name="frm123">
				<div class="right_list">
					<input type="text" id="name" placeholder="이름" value="${memberVo.username }"><br>
					<input type="text" id="email" placeholder="이메일" value="${memberVo.email1 }@${memberVo.email2}"><br>
					<input type="text" id="hp" placeholder="연락처" value="${memberVo.hp1 }-${memberVo.hp2 }-${memberVo.hp3 }"><br>
					<input type="text" id="title" placeholder="제목"><br>
					<textarea rows="20" cols="32" placeholder="내용"></textarea>
				</div>
				<input type="button" class="btn btn-secondary btn-lg" value="보내기" id="SideQnA">
			</form>
			</c:if>
			<!-- 로그된경우 (끝)-->
		</div>
		<!--================right side =================-->
		<!--================Canvus Menu Area =================-->
		<div class="canvus_menu">
			<div class="container">
				<div class="float-right">
					<div class="toggle_icon" title="Menu Bar">
						<span></span>
					</div>
				</div>
			</div>
		</div>
		<!--================End Canvus Menu Area =================-->
		<!-- 여기까지 탑 인클루드 -->