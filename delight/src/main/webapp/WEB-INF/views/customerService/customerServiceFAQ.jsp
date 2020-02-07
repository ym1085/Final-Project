<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/main2Top.jsp"%>
<html>
 <head>
  <title>자주묻는질문</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="1240">

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_resource/css/customerStyle.css">

	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.easing.min.js"></script>

	<script>
		$(function(){
			//faq slider
			$(".faq-q").on("click", function(){
				var $q = $(this);
				var $ct = $(this).next(".faq-a");
				$(".faq-a").not($ct).slideUp('fast', function(){
					$(".faq-q").not($q).removeClass("on");
				});
				$q.toggleClass("on");
				$ct.stop().slideToggle('fast');
			});
		});
		
	</script>

 </head>


 <body>
  
 <!--Wrap-->
 <div id="wrap">
	
	<div class="inner">

		<!-- Board wrap -->
			<div class="board-wrap">
				<!-- 일반 게시판 리스트 -->
				<div class="faq-list">
					<!-- <p class="no-ct">등록된 게시물이 없습니다.</p> -->

					<h3 class="faq-q">질문의 내용이 들어갑니다.</h3>
					<div class="faq-a">
						답변의 내용이 들어갑니다.<br>
						답변의 내용이 들어갑니다.
					</div>
					
					<h3 class="faq-q">질문의 내용이 들어갑니다.</h3>
					<div class="faq-a">
						답변의 내용이 들어갑니다.<br>
						답변의 내용이 들어갑니다.
					</div>
					
					<h3 class="faq-q">질문의 내용이 들어갑니다.</h3>
					<div class="faq-a">
						답변의 내용이 들어갑니다.<br>
						답변의 내용이 들어갑니다.
					</div>
					
					<h3 class="faq-q">질문의 내용이 들어갑니다.</h3>
					<div class="faq-a">
						답변의 내용이 들어갑니다.<br>
						답변의 내용이 들어갑니다.
					</div>
					
					<h3 class="faq-q">질문의 내용이 들어갑니다.</h3>
					<div class="faq-a">
						답변의 내용이 들어갑니다.<br>
						답변의 내용이 들어갑니다.
					</div>
				</div>
				<!-- END 일반 게시판 리스트 -->
				
				<!-- 페이징 -->
				<div class="board-pager">
					<button type="button"><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/arrow_l_end.gif" alt="맨 앞으로"></button>
					<button type="button"><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/arrow_l.gif" alt="이전"></button>
					<a href="#" class="on">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<button type="button"><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/arrow_r.gif" alt="다음"></button>
					<button type="button"><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/arrow_r_end.gif" alt="맨 뒤로"></button>
				</div>
				<!-- END 페이징 -->

				<!-- 검색 -->
				<div class="board-search">
					<select class="board-search-select">
						<option value="전체">전체</option>
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
						<option value="내용">내용</option>
					</select>
					<input type="text" class="board-search-field">
					<input type="button" value="검색" class="btn-normal-s">
				</div>
				<!-- END 검색 -->
			</div><!-- END Board wrap -->

	</div>

 </div><!--END Wrap-->
  

   <!-- div안에서작업 그외엔 건들지말것 -->   
<%@ include file="../inc/main2Bottom.jsp" %>