<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.annTitle } - 상세보기</title>
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/css/vendor.bundle.base.css'/>">
<link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/css/style.css'/>">
    <!-- End layout styles -->
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/js/off-canvas.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/hoverable-collapse.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/misc.js'/>" ></script>
<style type="text/css">
#annContent img{
	width: 100%;
}
#all{
	width: 100%;

}
#editspan{
	margin-right: 10px;
}
#btnspan button{
	margin: 0 5px 0 5px;
}
#btnspan {
	margin-top: 20px;
}
#title{
	width: 80%;
	float: left;
}
#reg{
	width: 20%;
	float: right;
}
#titlereg{
	overflow: hidden;
}
</style>
</head>
<body>
<div class="main-panel" id="panal">
<div class="content-wrapper" id="all">
	<div class="card">
		
		<div id="titlereg">
		<div id="title" class="text-center">공지명 : ${vo.annTitle }</div>
		<div id="reg" class="text-right">작성일 :  
		<fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
		</div>
		</div>
		<div class="card-body" id="annContent">
		${vo.annContent }
		</div>
	</div>
	
	<div class="content-wrapper text-center">
	<span class="h4 font-weight-bold" id="editspan">설정하기</span>
	<div id="btnspan">
	<button class="btn btn-success btn-sm">상단 고정</button>
	<button class="btn btn-danger btn-sm">상단 고정 해제</button>
	<button class="btn btn-success btn-sm">노출 설정</button>
	<button class="btn btn-danger btn-sm">노출 해제</button>
	<button class="btn btn-dark btn-sm">삭제</button>
	</div>
	</div>
</div>
</div>
</body>
</html>
