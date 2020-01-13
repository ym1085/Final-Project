<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/adminTop.jsp" %>

<script type="text/javascript">
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage.submit();
}
function pageFunc2(curPage){
	document.frmPage2.currentPage2.value=curPage;
	document.frmPage.currentPage.value=curPage;
	document.frmPage.submit();
}


</script>

<form action="<c:url value=''/>" 
	name="frmPage" method="post">
	<input type="text" name="searchCondition" 
		value="${param.searchCondition}">
	<input type="text" name="searchKeyword" 
		value="${param.searchKeyword}">
	<input type="text" name="currentPage" >
	
	<input type="text" name="searchCondition2" 
		value="${param.searchCondition2}">
	<input type="text" name="searchKeyword2" 
		value="${param.searchKeyword2}">
	<input type="text" name="currentPage2" >
</form>
    
<div id="parent">
	<!-- 일반 공지글 설정 -->
	<div class="content-wrapper" id="normal">
		<div class="display-3">일반 공지글 설정</div>
		<div>
		<table style="width:600px" class="table table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="chk"></th>
				<th>공지제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list }">
			<tr style="text-align: center">
				<td colspan="5">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:set var="idx" value="0" />
			<c:forEach var="vo" items="${list }">
				<tr>
				<td><input type="checkbox" id="chk_${idx }" 
						name="normal[${idx }].annSeq" 
						value="${vo.annSeq }"></td>
				<td>${vo.annTitle }</td>
				<td>${vo.userid }</td>
				<td><fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td><a href="#">삭제</a></td>
				</tr>
			<c:set var="idx" value="${idx+1}" />
		</c:forEach>
		</c:if>
		</tbody>
		<!-- 반복 끝 -->
	</table>
	</div>
	
	<div class="divPage">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight: bold">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})">
					[${i}]</a>
			</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>	
</div>
	<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
        <select name="searchCondition">
            <option value="ann_title" 
            	 <c:if test="${param.searchCondition=='ann_title' }">
            		selected="selected"
            	</c:if> 
            >공지제목</option>
            <option value="userid" 
            	 <c:if test="${param.searchCondition=='userid' }">
            		selected="selected"
            	</c:if> 
            >작성자</option>
            <option value="ann_regdate" 
            	 <c:if test="${param.searchCondition=='ann_regdate' }">
            		selected="selected"
            	</c:if> 
            >작성일</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword}">   
		<input type="submit" value="검색">
    </form>
	</div>
	</div>
	
	
<!-- ------------------------------------------------------------------------ -->

	<!-- 이벤트 공지글 설정 -->
	<div id="event">
		<div class="display-3">이벤트 공지글 설정</div>
		<div>
	<table border="1" style="width:600px">
		<tr>
			<th>번호</th>
			<th>도서명명</th>
			<th>가격</th>
			<th>출판사</th>
			<th>등록일</th>
		</tr>
		<tbody>
		<!-- 반복 시작 -->
		<c:if test="${empty list2 }">
			<tr style="text-align: center">
				<td colspan="5">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list2 }">
			<c:set var="idx2" value="0" />
			<c:forEach var="vo2" items="${list2 }">
				<tr>
				<td><input type="checkbox" id="chk2_${idx2 }" 
						name="event[${idx }].annSeq" 
						value="${vo2.annSeq }"></td>
				<td>${vo2.annTitle }</td>
				<td>${vo2.userid }</td>
				<td><fmt:formatDate value="${vo2.annRegdate }" pattern="yyyy-MM-dd"/>
				</td>
				<td><a href="#">삭제</a></td>
				</tr>
			<c:set var="idx2" value="${idx2+1}" />
		</c:forEach>
		</c:if>
		</tbody>
		<!-- 반복 끝 -->
	</table>
	</div>
		
			<div class="divPage">
	 <!-- 이전블럭으로 이동 -->
	<c:if test="${pagingInfo2.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo2.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo2.firstPage }" 
		end="${pagingInfo2.lastPage }">
			<c:if test="${i==pagingInfo2.currentPage }">
				<span style="color:blue;font-weight: bold">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo2.currentPage }">
				<a href="#" onclick="pageFunc(${i})">
					[${i}]</a>
			</c:if>
	</c:forEach>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음블럭으로 이동 -->
	<c:if test="${pagingInfo2.lastPage<pagingInfo2.totalPage }">
		<a href="#" onclick="pageFunc2(${pagingInfo2.lastPage+1})">	
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>	
</div>
	<div class="divSearch">
   	<form name="frmSearch2" method="post" 
   		action='<c:url value="/admin/announcement/annInc.do"/>'>
        <select name="searchCondition2">
            <option value="ann_title" 
            	 <c:if test="${param.searchCondition2=='ann_title' }">
            		selected="selected"
            	</c:if> 
            >공지제목</option>
            <option value="userid" 
            	 <c:if test="${param.searchCondition2=='userid' }">
            		selected="selected"
            	</c:if> 
            >작성자</option>
            <option value="ann_regdate" 
            	 <c:if test="${param.searchCondition2=='ann_regdate' }">
            		selected="selected"
            	</c:if> 
            >작성일</option>
        </select>   
        <input type="text" name="searchKeyword2" title="검색어 입력"
        	value="${param.searchKeyword2}">   
		<input type="submit" value="검색">
    </form>
	</div>
	</div>
</div>
<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
#normal{
	width: 50%;
	height: 100%;
	float: left;
	font-weight: bold;
}
#event{
	width: 50%;
	height: 100%;
	float: left;
	padding: 44px 36px 44px 36px;
	font-weight: bold;
}
#parent{
	width:100%;
	height: 100%;
}
</style>
<script type="text/javascript">
$(function() {
	$("#announcement").addClass("active");
	$("#ann").addClass("show");
});

</script>