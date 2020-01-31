<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
     
        jQuery(document).ready(function() {
        	 $("td#sss").each(function(){
        		 $(this).click(function(){
 	       			$.ajax({
	    				type:"get",
	    				url:"<c:url value='/inqueryDetail.do'/>",
	    				data:{"inquerySeq":$(this).find("#inqueSeq").val()},
	    				success:function(res){
 	    					if(res.INQUERY_CONDITION=='N'){
	    						alert("답변예정입니다!");
	    					}else if(res.INQUERY_CONDITION=='Y'){
		    					$("#inqtitle").html(res.INQUERY_TITLE);
		    					$("#inqcontent").html(res.INQUERY_CONTENT);
		    					$("#inqAnw").html(res.INQANW);
		    					$('#myModal').show();
	    					}
	    				},
	    				error:function(xhr, status, error){
	    					alert("Error : "+status+", "+ error);
	    				}
	    			});	 
	               	
        		 });
        	 });
        //팝업 Close 기능
        $("#ssss").click(function(){
             $('#myModal').hide();
        });
        });
        
        
    	function pageFunc(curPage){
    		$("#currentPage").val(curPage);
    		
    		$("form[name=frminq1]").submit();
    	}
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

	<form name="frminq1" method="post"
		action="<c:url value='/member/myinqueryList.do'/>">
		<input type="hidden" name="currentPage" id="currentPage">
	</form>
	
		<section class="mysec" style="margin-top: 5%;">
			<div class="mysecDiv">
				<h2 class="mytit">나의 문의내역</h2>
				<table class="mytable">
					<colgroup>
						<col style="width: 155px">
						<col style="width: 647px">
						<col style="width: 250px">
						<col style="width: 347px">
					</colgroup>

					<thead>
						<tr>
							<th id="heading" scope="col">성함/유형</th>
							<th id="heading" scope="col">제목</th>
							<th id="heading" scope="col">문의날짜</th>
							<th id="heading" scope="col">답변상태</th>
						</tr>
					</thead>

					<tbody id="mybody">
						<c:if test="${empty list }">
							<tr>
								<td style="text-align: center;" colspan="4">문의내역이 존재하지않습니다.</td>
							</tr>
						</c:if>
						<!-- 반복 시작-->
						<c:if test="${!empty list }">
							<c:forEach var="inqueVo" items="${list }">
								<tr>
									<td style="text-align: center">${inqueVo.username}/일반</td>
									<td style="text-align: center" id="sss"><input
										type="hidden" id="inqueSeq" value="${inqueVo.inquerySeq }">
										<span>${inqueVo.inqueryTitle }</span></td>
									<td style="text-align: center"><fmt:formatDate
											value="${inqueVo.regDate }" pattern="yyyy-MM-dd" /></td>
									<td style="text-align: center; color: red;"><c:if
											test="${inqueVo.inqueryCondition=='N' }">
							답변예정
						</c:if> <c:if test="${inqueVo.inqueryCondition=='Y' }">
											<span style="color: black;">답변완료</span>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<!-- 반복 끝-->
				</table>
				<div id="page">
					<!-- 이전블럭으로 이동 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a class="imgblock" href="#" onclick="pageFunc(1)"> <img
							src="<c:url value='/resources/images/first.gif'/>" alt="처음으로">
						</a>
						<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
							src="<c:url value='/resources/images/first2.gif'/>" alt="이전 블럭으로">
						</a>
					</c:if>

					<!-- 페이지 번호 추가 -->
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span> ${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})"> ${i }</a>
						</c:if>
					</c:forEach>
					<!--  페이지 번호 끝 -->

					<!-- 다음블럭으로 이동 -->
					<c:if test="${pagingInfo.lastPage< pagingInfo.totalPage}">
						<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
							src="<c:url value='/resources/images/last2.gif'/>" alt="다음 블럭으로">
						</a>
						<a class="imgblock" href="#" onclick="pageFunc(${pagingInfo.totalPage})"> <img
							src="<c:url value='/resources/images/last.gif'/>" alt="다음 블럭으로">
						</a>
					</c:if>
				</div>
			</div>
		</section>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;">제목:<b><span id="inqtitle"
						style="font-size: 18pt; color: black;"></span></b></span>
			</p>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>
			<div class="inq1" style="border-bottom: 1px solid gray;">
				<p style="text-align: center; line-height: 1.5;">
					<span id="inqcontent" style="font-size: 14pt;"></span>
				</p>
			</div>
			<div class="inq1">
				<p style="text-align: center; line-height: 1.5;">
					<span id="inqAnw" style="font-size: 14pt;"></span>
				</p>
			</div>
			<p style="text-align: center; line-height: 1.5;">
				<br />
			</p>
			<div id="ssss"
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;">
				<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
			</div>
		</div>
	</div>
	<!--End Modal-->
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>