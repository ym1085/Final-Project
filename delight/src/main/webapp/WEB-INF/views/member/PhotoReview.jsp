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
		$(function(){
			$("#file2").hide();
			$("#file3").hide();
			
			$("form[name=reviewfrm]").submit(function(){
				var file1=$("#file1").val();
				var file2=$("#file2").val();
				var file3=$("#file3").val();
				
				var jpg='jpg';
				var png='png';
				
				file1=file1.substr(file1.lastIndexOf(".")+1);
				file2=file2.substr(file2.lastIndexOf(".")+1);
				file3=file3.substr(file3.lastIndexOf(".")+1);
				
				
				if($("#inqueryTitle").val().length<1){
					alert("제목을입력해주세요!");
					$("#inqueryTitle").focus();
					event.preventDefault();
				}else if($("#inqueryContent").val().length<21){
					alert("내용은 20자 이상 입력해주세요");
					$("#inqueryContent").focus();
					event.preventDefault();
				}else if($("#starNum").val()<1){
					alert("별점을 매겨주세요");
					$("#starNum").focus();
					event.preventDefault();
				}else if($("#file1").val().length<1 && $("#filelength").val()==1){
					alert("포토후기작성시 사진은1개이상 업로드하셔야합니다.");
					$("#file1").focus();
					event.preventDefault();
				}else if($("#file2").val().length<1 && $("#filelength").val()==2){
					alert("보여지는 파일 첨부는 업로드하셔야합니다.");
					$("#file2").focus();
					event.preventDefault();
				}else if($("#file3").val().length<1 && $("#filelength").val()==3){
					alert("보여지는 파일 첨부는 업로드하셔야합니다.");
					$("#file3").focus();
					event.preventDefault();
				}else if(file1!='' && (file1!=jpg && file1!=png)){
					alert("이미지파일은 jpg나png만 등록이 가능합니다.");
					$("#file1").focus();
					event.preventDefault();
				}else if(file2!='' && (file2!=jpg && file2!=png)){
					alert("이미지파일은 jpg나png만 등록이 가능합 니다.");
					$("#file2").focus();
					event.preventDefault();
				}else if(file3!='' && (file3!=jpg && file3!=png)){
					alert("이미지파일은 jpg나png만 등록이 가능합니다.");
					$("#file3").focus();
					event.preventDefault();
				}

			});
			
			$("#inqueryContent").keyup(function(){
				var content=$(this).val().length;
				$(".chklength").html(content);
			});
			
			$("#fileP").click(function(){
				if($("#filelength").val()==1){
					$("#fileM").show();
					$("#file2").show();
					$("#filelength").val(2);
					$("#reviewMg").val(75);
				}else if($("#filelength").val()==2){
					$("#fileP").hide();
					$("#file3").show();
					$("#filelength").val(3);
					$("#reviewMg").val(100);
				}
				
			});
			
			$("#fileM").click(function(){
				if($("#filelength").val()==2){
					$("#fileM").hide();
					$("#file2").hide();
					$("#file2").val(""); 
					$("#filelength").val(1);
					$("#reviewMg").val(50);
				}else if($("#filelength").val()==3){
					$("#file3").hide();
					$("#file3").val("");
					$("#filelength").val(2);
					$("#reviewMg").val(75);
					$("#fileP").show();
				}
				
			});
			
			
		});
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
			<a href="<c:url value='/index.do'/>"
				style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
				Delight </a>
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
</div>
<!-- 페이지 만들떄마다 복붙 -->

<!-- div안에서작업 그외엔 건들지말것 -->

<div style="width: 87%; float: right;">

	<section class="mysec">
	<form action="<c:url value='/member/PhotoReview.do' />" method="post" name="reviewfrm" enctype="multipart/form-data">
		<div class="mysecDiv">
		<div class="writeReview">
			<h2 class="mytit">포토후기 작성</h2>
			<input type="hidden" value="2" name="reviewType">
			<input type="hidden" value="${param.reservationSeq }" name="reservationSeq">
			<input type="hidden" value="${vo.mt20id }" name="reviewMt20id">
			<input type="hidden" value="50" id="reviewMg" name="reviewMileage">
		</div>
		<div class="writeReview2">
			<p>- 작성된 후기는 Delight 콘텐츠로 사용될 수 있습니다.<br>
			   - 등록하신 후기는 해당 공연 상세보기 후기 란에 공개되어있습니다.<br>
			   - 한번 등록하신 후기는 수정 불가능하며 신중하게 작성 부탁드립니다.</p>
		</div>
		<div class="writeReview3">
		<img alt="" src="${poster }">
		<p class="mybodyP">${vo.perfomtype }<br>${vo.prfnm }</p>
		</div>
		<div class="writeReview4">
		<p class="stainfo">- 별점을 매겨주세요</p>
		<p id="star_grade">
        <a href="#" onclick="star(1)" id="1">★</a>
        <a href="#" onclick="star(2)" id="2">★</a>
        <a href="#" onclick="star(3)" id="3">★</a>
        <a href="#" onclick="star(4)" id="4">★</a>
        <a href="#" onclick="star(5)" id="5">★</a>
		</p>
		<input type="hidden" id="starNum" name="reviewScore" value=""/>
		</div>
		<div class="writeReview5">
		<p class="filesear">- 관람 하신 공연의 후기 제목을 입력해주세요.</p>
		<input type="text" maxlength="30" id="inqueryTitle" name="reviewTitle" value=""/>
		</div>
		<p class="contenttitle">
		<input type="file" name="reviewPho1" id="file1" value="">
		<input type="file" name="reviewPho2"  id="file2" value="">
		<input type="file" name="reviewPho3"  id="file3" value="">
		<input type="button" id="fileM" value="-">
		<input type="button" id="fileP" value="+">
		<input type="hidden" id="filelength" name="fileLength" value="1">
		<span class="fileError">* 이미지파일은 JPG,PNG만 등록이가능합니다.</span><br><br>
		<span  class="filesear">- 관람하신 공연의 후기를 작성해주세요.(10자이상)</span>
		</p>
		<div class="writeReview6">
		<textarea id="inqueryContent" name="reviewContent"></textarea>
		<!-- keyUp걸기 -->
		<p class="review6info"><span class="chklength">0</span>자 / 20자 이상</p>
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