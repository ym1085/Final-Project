<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/main2Top.jsp"%>
<!doctype html> 
<html>
 <head>
  <title>공지사항</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="1240">

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_resource/css/customerStyle.css">
 </head>


 <body>
  
 <!--Wrap-->
 <div id="wrap">
	
	<div class="inner">

		<!-- Board wrap -->
		<div class="board-wrap">
			<!-- 일반 게시판 리스트 -->
			<table class="board-list">
				<thead>
					<tr>
						<th class="col-num">No.</th>
						<th>제목</th>
						<th class="col-writer">작성자</th>
						<th class="col-date">날짜</th>
						<th class="col-view">조회</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr>
						<td colspan="5" class="no-ct">
							<p>등록된 게시물이 없습니다.</p>
						</td>
					</tr> -->
					<tr class="notice">
						<td><img src="/image/board/speaker.png" alt="NOTICE"></td>
						<td class="list-tit"><a href="board_view.php">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>332</td>
					</tr>
					<tr>
						<td>10</td>
						<td class="list-tit"><a href="#">신규 게시물입니다. </a><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/icon_new.gif" alt="NEW"></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다. 코멘트가 있는 게시물 입니다.</a><span class="cmt-cnt">[15]</span></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>7</td>
						<td class="list-tit"><a href="#">첨부파일이 있는 게시물 입니다. </a><img src="${pageContext.request.contextPath}/resources/customer_resource/image/board/icon_file.gif" alt="첨부파일"></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>6</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>35</td>
					</tr>
					<tr>
						<td>5</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>0</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="list-tit"><a href="#">제목이 들어갑니다.</a></td>
						<td>관리자</td>
						<td>2019-12-13</td>
						<td>32</td>
					</tr>
				</tbody>
			</table><!-- END 일반 게시판 리스트 -->
			
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