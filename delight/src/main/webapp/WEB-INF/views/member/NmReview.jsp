<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/review.css' />" />
	<script type="text/javascript" src ="<c:url value = '/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
		function star(idx){
            $("#star_grade a#"+idx).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $("#star_grade a#"+idx).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            $("#starNum").val(idx);
            return false;
		}	
</script>
<style type="text/css">
     #star_grade a{
        text-decoration: none;
        color: gray;
        font-size: 2em;
    }
    #star_grade a.on{
        color: red;
    }
</style>

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
						style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div>
				</li>
			</ul>
		</nav>
	</aside>
	<!-- left side -->
</div>
<!-- 페이지 만들떄마다 복붙 -->

<!-- div안에서작업 그외엔 건들지말것 -->

<div style="width: 87%; float: right;">

	<section class="mysec">
	<form action="">
		<div class="mysecDiv">
		<div class="writeReview">
			<h2 class="mytit">일반후기 작성</h2>
			<input type="hidden" value="1" name="reviewType">
		</div>
		<div class="writeReview2">
			<p>- 작성된 후기는 Delight 콘텐츠로 사용될 수 있습니다.<br>
			   - 등록하신 후기는 해당 공연 상세보기 후기 란에 공개되어있습니다.</p>
		</div>
		<div class="writeReview3">
		<img alt="" src="<c:url value='/resources/images/del3.jpg' />">
		<p class="mybodyP">내용</p>
		</div>
		<div class="writeReview4">
		<p class="stainfo">별점을 매겨주세요</p>
		<p id="star_grade">
        <a href="#" onclick="star(1)" id="1">★</a>
        <a href="#" onclick="star(2)" id="2">★</a>
        <a href="#" onclick="star(3)" id="3">★</a>
        <a href="#" onclick="star(4)" id="4">★</a>
        <a href="#" onclick="star(5)" id="5">★</a>
		</p>
		<input type="hidden" id="starNum" value=""/>
		</div>
		<div class="writeReview5">
		<p>관람 하신 공연의 후기 제목을 입력해주세요.</p>
		<input type="text" id="inqueryTitle" value=""/>
		</div>
		<p class="contenttitle">관람하신 공연의 후기를 작성해주세요.(10자이상)</p>
		<div class="writeReview6">
		<textarea id="inqueryContent"></textarea>
		<!-- keyUp걸기 -->
		<p class="review6info"><span>0</span>자 / 20자 이상</p>
		</div>
		<div class="writeReview7">
		<input type="submit" value="등록하기" class="infoWrite">
		</div>
		</div>
		</form>
	</section>
	
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>