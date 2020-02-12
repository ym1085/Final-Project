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
a.on{background: #f63d46;}
.tabmenu{ max-width:600px; margin: 0 auto; position:relative;}
.tabmenu input:checked ~ label{ border-bottom: none; border-color: red; background-color: white;  border-left: 0.5px solid red; border-right: 0.5px solid red;}
.tabmenu input:checked ~ .tabCon{display:block; }
.tabmenu input[type=radio]{display:none;}
.tabCon{display:none; text-align:center; padding-top: 50px; position:absolute; left: -50%; top:40px;  width: 1200px; box-sizing: border-box;}
.tabLabel1{text-align: center; display:block; width: 400px; position: absolute; height: 40px; left: -50%; line-height: 40px; border: 1px solid #F2F4F7; border-bottom-color: red; background-color: #F2F4F7;}
.tabLabel2{text-align: center; display:block; width: 400px; position: absolute; height: 40px; left: 16.7%; line-height: 40px; border-top: 1px solid #F2F4F7;  border-bottom: 1px solid black; border-bottom-color: red; background-color: #F2F4F7;}
.tabLabel3{text-align: center; display:block; width: 400px; position: absolute; height: 40px; left: 83.3%; line-height: 40px; border: 1px solid #F2F4F7; border-bottom-color: red; background-color: #F2F4F7; }
.board-list{border-top-color: #ff818d;}
.board-search{ margin-top: 20px; margin-bottom: 20px; box-sizing: border-box; text-align: end; }
.board-pager a.on, .board-pager a.on:hover, .board-pager a.on:focus {background: #f63d46; border: #f63d46;}
.board-pager{text-align: center; margin-top: 40px; width: 89%; }
.faq-btn{ margin-top: 20px; margin-bottom: 20px; box-sizing: border-box; }
.faq-btn-li label { display: block; width: 100%; height: 40px; line-height: 40px; border: 1px solid #d5d8de }
.faq-btn-li input:checked ~ label { border-color: #ff818d; background-color: #ff818d;}
.faq-btn-li input:checked ~ .tabCon{ border-color: #ff818d; background-color: #ff818d; }
.faq-list{ margin-top: 100px; border-top-color: #f63d46	; border-bottom-color: #f63d46; }
.faq-list .faq-q:before {background: #f63d46;}
h1 { font-size: 30px; text-align: center; color: black; font-family: auto;}
#desc{text-align: center;}
.editor_cont{padding:0px; margin: 0 auto; width: 60%; text-align: left; display: inline-block;}
.btn-normal-s { background: #f63d46; border: #f63d46; width: 100px; height: 50px; }
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
	$("#editorCont").find("ul").addClass("editorCont_ul_class");
	
	
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
		value="${param.searchCondition=='ann_Title'}" id="aa1">
	<input type="hidden" name="searchKeyword" 
		value="${param.searchKeyword}" id="aa2">
	<input type="hidden" name="currentPage" value="${pagingInfo.currentPage }"  id="aa3">
</form>

<form action="<c:url value='/customerService/customerServiceList.do?annType=2'/>" 
name="frmPage2" method="post">	
	<input type="hidden" name="searchCondition2"
		value="${param.searchCondition2=='ann_Title'}" id="bb1">
	<input type="hidden" name="searchKeyword2" 
		value="${param.searchKeyword2}" id="bb2">
	<input type="hidden" name="currentPage2" value="${pagingInfo2.currentPage }">
</form>
    
    
<div style="width: 87%; float: right;" class="CustomerService">
	<h1 class="tit">고객센터</h1>
	
	<div class="tabmenu">
		<ul class="tabmenu">
			<li id="tab1" class="btnCon">
			<c:if test="${vo.annType=='2'}">
			<input type="radio" name="tabmenu" id="tabmenu1" class="tabmenu1" onclick="moveNotice1()"> 
			</c:if>
			<c:if test="${vo.annType=='1'}">
			<input type="radio" name="tabmenu" id="tabmenu1" checked="checked" class="tabmenu1" onclick="moveNotice1()"> 
			</c:if>
			<label for="tabmenu1" class="tabLabel1">일반 공지</label>
				<c:if test="${vo.annType=='1'}">
				<div class="tabCon">
					<div class="content on">
						<div>
							<div class="ct_top">
								<div class="section_head">
									<div class="inner mw1200">
										<h1 class="fns" id="fns">
											${vo.annTitle }
										</h1>
										<p class="desc" id="desc">
											<fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
										</p>
									</div>
								</div>
							</div>
							<hr color="#ff818d">
							<div class="sec mw1200">
								<div class="event_detail" id="detailDiv">
								 	<div class="editor_cont" id="editorCont">
										<c:if test="${!empty vo.annImg}">
											${vo.annImg }
										</c:if>
										${vo.annContent }
									</div>
									<hr>
									<div class="list_remote clearbox">
										<div class="btn_box">
											<button type="button" id="normalbt" class="btn-normal-s" onclick="location.href='javascript:history.back()'">목록</button>
										</div>
									</div>
								</div>
								<!-- 컨텐츠 들어가는 자리 -->
								<div class="grid_list" id="gridlist" style="display: none;">
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
			</li>
			<!-------------------------------------------------------------------------------------------->
			<li id="tab2" class="btnCon">
			
			<c:if test="${vo.annType=='1'}">
			<input type="radio" name="tabmenu" id="tabmenu2" class="tabmenu2" onclick="moveNotice2()"> 
			</c:if>
			<c:if test="${vo.annType=='2'}">
			<input type="radio" name="tabmenu" id="tabmenu2" checked="checked" class="tabmenu2" onclick="moveNotice2()"> 
			</c:if>
			<label for="tabmenu2" class="tabLabel2">이벤트 공지</label>
				<c:if test="${vo.annType=='2'}">
				<div class="tabCon">
					<div class="content on">
						<div>
							<div class="ct_top">
								<div class="section_head">
									<div class="inner mw1200">
										<h1 class="fns" id="fns">
											${vo.annTitle }
										</h1>
										<p class="desc" id="desc">
											<fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
										</p>
									</div>
								</div>
							</div>
							<hr color="#ff818d">
							<div class="sec mw1200">
								<div class="event_detail" id="detailDiv">
								 	<div class="editor_cont" id="editorCont">
										<c:if test="${!empty vo.annImg}">
											${vo.annImg }
										</c:if>
										${vo.annContent }
									</div>
									<hr>
									<div class="list_remote clearbox">
										<div class="btn_box">
											<button type="button" id="normalbt" class="btn-normal-s" onclick="location.href='javascript:history.back()'">목록</button>
										</div>
									</div>
								</div>
								<!-- 컨텐츠 들어가는 자리 -->
								<div class="grid_list" id="gridlist" style="display: none;">
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
			</li>
			<!-------------------------------------------------------------------------------------------->			
			<li id="tab3" class="btnCon_">
				<input type="radio" name="tabmenu" id="tabmenu3" value="tabmenu3" onclick="moveFAQ()">
				<label for="tabmenu3" class="tabLabel3">자주 묻는 질문</label>					
			</li>
		</ul>
	</div>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->
<%@ include file="../inc/main2Bottom.jsp"%>