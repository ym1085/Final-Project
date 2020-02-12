<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/main2Top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="1240">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_resource/css/customerStyle.css">
<style type="text/css">
.tit { text-align: center; font-size: 1.5em;border-bottom: 0.3px solid #e0d4d4; paddnig-bottom: 10px; line-height: 4;	font-weight: bold; padding-bottom: 10px; }
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
.board-search{ margin-top: 20px; margin-bottom: 20px; box-sizing: border-box; text-align: end; }
.board-pager a.on, .board-pager a.on:hover, .board-pager a.on:focus {background: #f63d46; border: #f63d46; margin-left:40%}
.board-pager{text-align: center; margin-top: 40px; position: absolute; margin-left: 38%;}
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

function moveNotice1(){
	location.href="<c:url value='/customerService/customerServiceList.do?annType=1'/>";
}

function moveNotice2(){
	location.href="<c:url value='/customerService/customerServiceList.do?annType=2'/>";
}

function select_Fnc1(){
	location.href="<c:url value='/customerService/customerServiceFAQ.do?faqType=1'/>";
}

function select_Fnc2(){
	location.href="<c:url value='/customerService/customerServiceFAQ.do?faqType=2'/>";
}

function select_Fnc3(){
	location.href="<c:url value='/customerService/customerServiceFAQ.do?faqType=3'/>";
}

function select_Fnc4(){
	location.href="<c:url value='/customerService/customerServiceFAQ.do?faqType=4'/>";
}


$(function(){ 			
		
    $(".faq_ct_a").hide();
    $(".faq_ct_q").click(function(){
        $(this).next(".faq_ct_a").slideToggle(400);
    });

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
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
	<!-- div안에서작업 그외엔 건들지말것 -->
   
   <!-- 페이지 만들떄마다 복붙 -->
   <!-- div안에서작업 그외엔 건들지말것 -->

    
<div style="width: 87%; float: right;" class="CustomerService">
	<h1 class="tit">고객센터</h1>

	<div class="tabmenu">	
		<ul>	
			<li id="tab1" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu1" class="tabmenu1" value="tabmenu1" onclick="moveNotice1()"> 
				<label for="tabmenu1" class="tabLabel1">일반 공지</label>
				<div class="tabCon">

				</div>
			</li>
<!-- ---------------------------------------------------------------------------------------- -->
			<li id="tab2" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu2" class="tabmenu2" value="tabmenu2" onclick="moveNotice2()"> 
				<label for="tabmenu2" class="tabLabel2">이벤트 공지</label>
				<div class="tabCon">
				</div>
			</li>
<!-- ---------------------------------------------------------------------------------------- -->			
			<li id="tab3" class="btnCon">
				<input type="radio" name="tabmenu" id="tabmenu3" value="tabmenu3" checked="checked" onclick="moveFAQ()"> 
				<label for="tabmenu3" class="tabLabel3">자주 묻는 질문</label>
				<div class="tabCon">
					<!-- 카테고리 버튼-->
					<div class="faq-btn">
					<form>
						<ul class="faq-btn-ul">				
							<li class="faq-btn-li" id="TICKETING" value="예매/결제">
								<input type="radio" <c:if test='${param.faqType=="1"&&param.faqType!="2"||param.faqType!="3"||param.faqType!="4"}'>checked="checked"</c:if>  name="tabmenu3-faq" id="tabmenu3-faq1" onclick="select_Fnc1()">
								<label for="tabmenu3-faq1" class="tabLabel3-1">예매/결제</label>
							</li>
							<li class="faq-btn-li" id="REFUND" value="취소/환불">
								<input type="radio" <c:if test='${param.faqType=="2"}'>checked="checked"</c:if> name="tabmenu3-faq" id="tabmenu3-faq2" onclick="select_Fnc2()">
								<label for="tabmenu3-faq2" class="tabLabel3-2">취소/환불</label>							
							</li>
							<li class="faq-btn-li" id="USER" value="회원">							
								<input type="radio" <c:if test='${param.faqType=="3"}'>checked="checked"</c:if> name="tabmenu3-faq" id="tabmenu3-faq3" onclick="select_Fnc3()">
								<label for="tabmenu3-faq3" class="tabLabel3-3">회원</label>
							</li>
							<li class="faq-btn-li" id="ETC" value="기타">						
								<input type="radio" <c:if test='${param.faqType=="4"}'>checked="checked"</c:if> name="tabmenu3-faq" id="tabmenu3-faq4" onclick="select_Fnc4()">
								<label for="tabmenu3-faq4" class="tabLabel3-4">기타</label>
							</li>
						</ul>
					</form>
					</div>
					<!-- END 카테고리 버튼 -->
					<!-- 예매/결제 -->
					<div class="faq-list">
						<c:if test="${empty list }">
							<p class="no-ct">등록된 게시물이 없습니다.</p>					
						</c:if>
					
						<c:if test="${!empty list }">
							<c:forEach var="FAQVo" items="${list }">
								<c:if test="${param.faqType=='1'||param.faqType!='2'&&param.faqType!='3'&&param.faqType!='4'}">
									<c:if test="${FAQVo.faqType=='예매/결제'}">
										<h3 class="faq-q">${FAQVo.faqTitle }</h3>
										<div class="faq-a">
											${FAQVo.faqContent }
										</div>
								</c:if>
								</c:if>
							</c:forEach>
						</c:if>
						
						<c:if test="${!empty list }">
							<c:forEach var="FAQVo" items="${list }">
								<c:if test="${param.faqType=='2'}">
									<c:if test="${FAQVo.faqType=='취소/환불' }">
										<h3 class="faq-q">${FAQVo.faqTitle }</h3>
										<div class="faq-a">
											${FAQVo.faqContent }
										</div>
								</c:if>
								</c:if>
							</c:forEach>
						</c:if>
						
						<c:if test="${!empty list }">
							<c:forEach var="FAQVo" items="${list }">
								<c:if test="${param.faqType=='3'}">
									<c:if test="${FAQVo.faqType=='회원' }">
										<h3 class="faq-q">${FAQVo.faqTitle }</h3>
										<div class="faq-a">
											${FAQVo.faqContent }
										</div>
								</c:if>
								</c:if>
							</c:forEach>
						</c:if>
						
						<c:if test="${!empty list }">
							<c:forEach var="FAQVo" items="${list }">
								<c:if test="${param.faqType=='4'}">
									<c:if test="${FAQVo.faqType=='기타' }">
										<h3 class="faq-q">${FAQVo.faqTitle }</h3>
										<div class="faq-a">
											${FAQVo.faqContent }
										</div>
								</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</div>	
				<!-- 페이징 -->

				<!-- END 페이징 -->				
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- div안에서작업 그외엔 건들지말것 -->
<%@ include file="../inc/main2Bottom.jsp"%>