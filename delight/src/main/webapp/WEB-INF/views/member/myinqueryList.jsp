<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
     
        jQuery(document).ready(function() {
        	 $("#sss").click(function(){
                $('#myModal').show();
        	 });
      
        //팝업 Close 기능
        $("#ssss").click(function(){
             $('#myModal').hide();
        	
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
						<th id="heading" scope="col">번호</th>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">문의날짜</th>
						<th id="heading" scope="col">답변상태</th>
					</tr>
				</thead>

				<tbody id="mybody">
					<!-- 반복 시작-->
					<tr>
						<td style="text-align: center">1</td>
						<td style="text-align: center" id="sss">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">답변예정</td>
					</tr>

					<tr>
						<td style="text-align: center">2</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>

					<tr>
						<td style="text-align: center">3</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>
		</div>
	</section>

	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">제목넣어줘</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <div class="inq1" style="border-bottom: 1px solid gray;">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">문의내용</span></p>
                </div>
                <div class="inq1">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">답변내용</span></p>
                </div>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
            <div id="ssss" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
    <!--End Modal-->
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>