<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/main2Top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_resource/css/customerStyle.css">
<style type="text/css">
.tit { text-align: center; font-size: 1.5em;border-bottom: 0.3px solid #e0d4d4; padding-bottom: 10px; line-height: 4;	font-weight: bold; }
*{ margin:0; padding:0; font-size:15px; line-height:1.3; }
ul{list-style:none;}
a.on{background: #f63d46;}
.btn-normal-s{background: #f63d46; border: #f63d46;}
.tabmenu{ max-width:600px; margin: 0 auto; position:relative;}
.tabmenu ul li{display:inline-block; width:25%; float:left; text-align:center; line-height:40px; }
.tabmenu input:checked ~ label{ border-bottom: none; border-color: red; background-color: white;  border-left: 0.5px solid red; border-right: 0.5px solid red;}
.tabmenu input:checked ~ .tabCon{display:block; }
.tabmenu input[type=radio]{display:none;}
.tabCon{display:none; text-align:left; padding: 20px; padding-top: 50px; position:absolute; left: -50%; top:40px;  width: 1200px; box-sizing: border-box;}
.tabLabel1{display:block; width: 400px; position: absolute; height: 40px; left: -50%; line-height: 40px; border: 1px solid #F2F4F7; border-bottom-color: red; background-color: #F2F4F7;}
.tabLabel2{display:block; width: 400px; position: absolute; height: 40px; left: 16.7%; line-height: 40px; border-top: 1px solid #F2F4F7;  border-bottom: 1px solid black; border-bottom-color: red; background-color: #F2F4F7;}
.tabLabel3{display:block; width: 400px; position: absolute; height: 40px; left: 83.3%; line-height: 40px; border: 1px solid #F2F4F7; border-bottom-color: red; background-color: #F2F4F7; }
.board-list{border-top-color: #ff818d;}
.board-list td.list-tit{ text-align: left; padding-left: 35px;}
.board-search{ margin-top: 20px; margin-bottom: 20px; box-sizing: border-box; text-align: end; }
.board-pager a.on, .board-pager a.on:hover, .board-pager a.on:focus {background: #f63d46; border: #f63d46;}
.board-pager{text-align: center; margin-top: 40px; width: 89%; }
.faq-btn{ margin-top: 20px; margin-bottom: 20px; box-sizing: border-box; }
.faq-btn ul li{display:inline-block; width:25%; float:left; text-align:center; line-height:40px; }
.faq-btn-li label { display: block; width: 100%; height: 40px; line-height: 40px; border: 1px solid #d5d8de }
.faq-btn-li input:checked ~ label { border-color: #ff818d; background-color: #ff818d;}
.faq-btn-li input:checked ~ .tabCon{ border-color: #ff818d; background-color: #ff818d; }
.faq-list{ margin-top: 100px; border-top-color: #f63d46	; border-bottom-color: #f63d46; }
.faq-list .faq-q:before {background: #f63d46;}
h1 { font-size: 30px; text-align: center; color: black; font-family: auto;}
</style>

<script>
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
	
}
function pageFunc2(curPage){
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage2.submit();
}

function moveNotice1(){
	location.href="<c:url value='/customerService/customerServiceList.do?annType=1'/>";
}

function moveNotice2(){
	location.href="<c:url value='/customerService/customerServiceList.do?annType=2'/>";
}

function moveFAQ(){
	location.href="<c:url value='/customerService/customerServiceFAQ.do?faqType=1'/>";
}

$(function(){ 	
	$("form[name=frmSearch]").submit(function() {
		event.preventDefault();
		$("#aa1").val($("#searchCondition").val());
		$("#aa2").val($("#searchKeyword").val());
		$("form[name=frmPage]").submit();
	});	
	
	$("form[name=frmSearch2]").submit(function() {
		event.preventDefault();
		$("#bb1").val($("#searchCondition2").val());
		$("#bb2").val($("#searchKeyword2").val());
		$("form[name=frmPage2]").submit();
	});	
});
		
</script>
    <!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="<c:url value='/index.do'/>" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
         </div>
         
         <nav class="left-nav" style="margin-top: 100%;">
            <ul id="nav">
               <li class="active"><a href="<c:url value='/performance/pfRanking.do'/>">랭킹</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value='/performSearchResult/theaterSearch.do?type=AAAA'/>">연극</a></li>
               <li><a href="<c:url value='/performSearchResult/musicalSearch.do?type=AAAB'/>">뮤지컬</a></li>
               <li><a href="<c:url value='/performSearchResult/areaSearch.do'/>">지역별</a></li>
               <li><a href="<c:url value='/performSearchResult/periodSearch.do'/>">기간별</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/mainSearchResult/doReservation.do"/>">예매하기</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/customerService/customerServiceList.do"/>">고객센터</a></li>               
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
	<!-- div안에서작업 그외엔 건들지말것 -->
   
   <!-- 페이지 만들떄마다 복붙 -->
   <!-- div안에서작업 그외엔 건들지말것 -->
	
<form action="<c:url value='/customerService/customerServiceList.do?annType=1'/>" 
name="frmPage" method="post">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition}" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
</form>

<form action="<c:url value='/customerService/customerServiceList.do?annType=2'/>" 
name="frmPage2" method="post">	
	<input type="hidden" name="searchCondition2"
		value="${param.searchCondition2}" id="bb1">
	<input type="hidden" name="searchKeyword2" 
		value="${param.searchKeyword2}" id="bb2">
	<input type="hidden" name="currentPage2" value="${pagingInfo2.currentPage }">
</form>
    
    
<div style="width: 87%; float: right;" class="CustomerService">
	<h1 class="tit">고객센터</h1>

	<div class="tabmenu">	
		<ul>	
			<li id="tab1" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu1" <c:if test='${param.annType!="2"}'>checked="checked"</c:if> class="tabmenu1" onclick="moveNotice1()">
				<label for="tabmenu1" class="tabLabel1">일반 공지</label>
				<div class="tabCon">
	
					<form name="frmSearch" method="post" 
				   		action='<c:url value="/customerService/customerServiceList.do?annType=1"/>'>
						<!-- 검색 -->
						<div class="divSearch board-search">
							<input type="text" name="searchKeyword"  id="searchKeyword" class="board-search-field" value="${param.searchKeyword }"> 
							<input type="hidden" name="searchCondition"  id="searchCondition" class="board-search-condition" value="ann_Title"> 
							<input type="submit" value="검색"  id="normalbt" class="btn-normal-s">
						</div>
						<!-- END 검색 -->
	
						<table class="board-list">
							<thead>
								<tr>
									<th class="col-num">번호</th>	
									<th>글제목 </th>
									<th class="col-writer">작성자</th>
									<th class="col-date">날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr style="text-align: center">
										<td colspan="4">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:set var="idx" value="0" />
									<c:forEach var="vo" items="${topList }" >
									<!--  게시글 상단 고정 -->
										<tr class="top">
										<c:if test="${pagingInfo.currentPage=='1'&& vo.annType=='1'}">		
												<td>중요</td>
												<td class="list-tit">
													<a href="<c:url value='/customerService/customerServiceDetail.do?annSeq=${vo.annSeq }'/>">${vo.annTitle }</a>
												</td>	
												<td>${vo.userid }</td>
												<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/></td>
										</c:if>
										</tr>
									<!-- 게시글 상단 고정 끝 -->
									</c:forEach>
									<c:forEach var="vo" items="${list }">
										<c:if test="${vo.annTop=='N' && vo.annShow=='Y' }">
											<tr>
												<td>${vo.annSeq}</td>
												<td class="list-tit">
													<input type="hidden" id="chk_${idx }" name="annList[${idx }].annSeq" value="${vo.annSeq }">
													<a href="<c:url value='/customerService/customerServiceDetail.do?annSeq=${vo.annSeq }'/>">${vo.annTitle }</a>
												</td>
												<td>${vo.userid }</td>
												<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:if>
										<c:set var="idx" value="${idx+1 }" />
									</c:forEach>
								</c:if>
							</tbody>
						</table>
				
						<!-- END 일반 게시판 리스트 -->
						<!-- 페이징 -->
						<div class="divPage board-pager">
							<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.totalPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<a href="#" class="on">${i }</a>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<a href="#" onclick="pageFunc(${i})">${i }</a>
								</c:if>
							</c:forEach>
						</div>
						<!-- END 페이징 -->					
					</form>			
				</div>
			</li>
<!-- ------------------------------------------------------------------------------------------>
			<li id="tab2" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu2" <c:if test='${param.annType=="2"}'>checked="checked"</c:if> class="tabmenu2" onclick="moveNotice2()">
				<label for="tabmenu2" class="tabLabel2">이벤트 공지</label>
				<div class="tabCon">
					<form name="frmSearch2" method="post" 
				   		action='<c:url value="/customerService/customerServiceList.do?annType=2"/>'>
					<!-- 검색 -->
					<div class="divSearch board-search">
							<input type="text" name="searchKeyword2"  id="searchKeyword2" class="board-search-field" value="${param.searchKeyword2 }"> 
							<input type="hidden" name="searchCondition2"  id="searchCondition2" class="board-search-condition" value="ann_Title"> 
							<input type="hidden" name="tabmenu" value="tabmenu2">
							<input type="submit" value="검색"  id="normalbt" class="btn-normal-s">
						</div>
					<!-- END 검색 -->
					
					<table class="board-list">
						<thead>
							<tr>
								<th class="col-num">번호</th>
								<th>글제목</th>
								<th class="col-writer">작성자</th>
								<th class="col-date">날짜</th>
							</tr>
						</thead>
						<tbody>	
							<c:if test="${empty list2 }">
								<tr style="text-align: center">
									<td colspan="4">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
								<c:if test="${!empty list2 }">
									<c:set var="idx" value="0" />
									<c:forEach var="vo" items="${topList }" >
									<!--  게시글 상단 고정 -->
										<tr class="top">
										<c:if test="${pagingInfo2.currentPage=='1'&& vo.annType=='2'}">
												<td>중요</td>
												<td class="list-tit">
													<a href="<c:url value='/customerService/customerServiceDetail.do?annSeq=${vo.annSeq }'/>">${vo.annTitle }</a>
												</td>	
												<td>${vo.userid }</td>
												<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/></td>
										</c:if>
										</tr>
									<!-- 게시글 상단 고정 끝 -->
									</c:forEach>
								<c:forEach var="vo" items="${list2 }">
									<c:if test="${vo.annTop=='N' && vo.annShow=='Y'}">
										<tr>
											<td>${vo.annSeq}</td>
											<td class="list-tit">
												<a href="<c:url value='/customerService/customerServiceDetail.do?annSeq=${vo.annSeq }'/>">${vo.annTitle }</a> 
											</td>
											<td>${vo.userid }</td>
											<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:if>
									<c:set var="idx" value="${idx+2}" />
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
					<!-- END 일반 게시판 리스트 -->

					<!-- 페이징 -->
					<div class="divPage board-pager">
	
							<c:forEach var="i" begin="${pagingInfo2.firstPage }" end="${pagingInfo2.lastPage }">
								<c:if test="${i==pagingInfo2.currentPage }">
									<a href="#" class="on">${i }</a>
								</c:if>
								<c:if test="${i!=pagingInfo2.currentPage }">
									<a href="#" onclick="pageFunc2(${i})">${i }</a>
								</c:if>
							</c:forEach>
							
						</div>
					<!-- END 페이징 -->
					</form>
				</div>
			</li>
<!-- ---------------------------------------------------------------------------------------- -->			
			<li id="tab3" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu3" value="tabmenu3" onclick="moveFAQ()">
				<label for="tabmenu3" class="tabLabel3">자주 묻는 질문</label>					
			</li>
		</ul>
	</div>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->
<%@ include file="../inc/main2Bottom.jsp"%>