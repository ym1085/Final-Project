<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/resources/css/mysec.css' />" />
	
<script type="text/javascript">
    	function pageFunc(curPage){
    		$("#currentPage").val(curPage);
    		
    		$("form[name=frminq1]").submit();
    	}
    	
    	function likeDelete(perfomid){
			if(!confirm("좋아요 취소하시겠습니까?")){
				event.preventDefault();
			}else{
       			$.ajax({
    				type:"get",
    				url:"<c:url value='/deleteLike.do'/>",
    				data:{"perfomid":perfomid},
    				success:function(res){
						if(res>0){
							location.reload();
						}
    				},
    				error:function(xhr, status, error){
    					alert("Error : "+status+", "+ error);
    				}
    			});	 
			}  
    	}
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

<div style="width: 87%; float: right;">

	<form name="frminq1" method="post"
		action="<c:url value='/member/mylikeList.do'/>">
		<input type="hidden" name="currentPage" id="currentPage">
	</form>
	
<section class="mysec" style="margin-top: 5%;">
		<div class="mysecDiv">
			<h2 class="mytit">좋아요</h2>
			
			<table class="mytable">
				<colgroup>
					<col style="width:1392px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">내용</th>
					</tr>
				</thead>
				
				<tbody id="mybody" style="border-bottom: 1px solid gray;">
					<c:if test="${empty list }">
					<tr class="likeTd">
						<td colspan="1" style="text-align: center;">관심있는 공연이 없습니다.</td>
					</tr>
					</c:if>
					
					<c:if test="${!empty list }">
				<!-- 반복 시작-->
					<c:forEach var="like" items="${list }">
					<tr class="likeTr">
						<td class="likeTd">
							<p class="mybodylikeP">
							<a class="linkperDetail" href="<c:url value='/recentInsert.do?perfomid=${like.MT20ID}'/>">
							(${like.GENRE })${like.PRFNM }
							</a>
							<input type="hidden" value="${like.MT20ID }" class="likeperfomId">
							</p>
							<p class="mybodylikeimgList" style="color: red;"><img class="likeListimg" alt="좋아요이미지" src="<c:url value='/resources/images/like2.png' />">
							 <span>${like.LA }</span></p>
							 <input type="button" value="취소" id="mybodylikeCan" onclick="likeDelete('${like.MT20ID }')">
						</td>
					</tr>
					</c:forEach>
				<!-- 반복 끝-->
					</c:if>
				</tbody>
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
</div>
<!-- div안에서작업 그외엔 건들지말것 -->

<%@ include file="../inc/main2Bottom.jsp"%>