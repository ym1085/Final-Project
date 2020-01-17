<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연명</title>
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/css/vendor.bundle.base.css'/>">
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/css/style.css'/>">
    <!-- End layout styles -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendors/js/vendor.bundle.base.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/off-canvas.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/hoverable-collapse.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/misc.js'/>" ></script>
<script type="text/javascript">
	$(function() {
		$(".slabel").addClass("col-sm-2");
		$(".lglabel")
	});
</script>
</head>
<body>
<div id="poster" class="text-center">
<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF160171_191230_093212.gif">
</div>
<div><hr></div>
<div id="introbox">
<label class="slabel">공연종류 : </label><span>뮤지컬</span><br>
<label class="slabel">공연명 : </label><span>더 나은 노래</span>
<label class="slabel">상태 : </label><span>공연 중</span><br>
<label class="slabel">공연장 : </label><span>드림시어터 [대학로] (드림시어터)</span><br>
<label class="slabel">시작일 : </label><span>2020.01.10</span>
<label class="slabel">종료일 : </label><span>2020.02.02</span><br>
<label class="lglabel">요일 및 시간</label><br>
<span>화요일 ~ 금요일(20:00), 토요일(15:00,19:00), 일요일(17:00), HOL(15:00,19:00)</span>
</div>
<div>
<hr>
</div>
<div>
<form action="">
<label>날짜 선택</label><input type="text" value="달력">

<label>시간</label>
<select>
<option>선택</option>
</select>

<label>좌석등급</label>
<select>
<option>선택</option>
</select>

<label>표 수량</label>
<input type="number" value="0">
<input type="button" value="등록">
</form>
</div>


</body>
</html>