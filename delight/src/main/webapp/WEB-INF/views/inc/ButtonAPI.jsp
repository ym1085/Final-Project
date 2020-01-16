<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">

.buttonTM{
	text-align: center;
}
	
</style>

<div class="buttonTM">
	<a href="<c:url value='/category/categoryList.do?type=AAAA'/>" id="theater" class="btn_1" 
		style="background-color: #f7f7f7;color: #928f8f;">연극</a>
	<a href="<c:url value='/category/categoryList.do?type=AAAB'/>" id="musical" class="btn_1" 
		style="background-color: #f7f7f7;color: #928f8f;">뮤지컬</a>
</div>
	
