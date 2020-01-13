<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
	<%
		//로그아웃 처리
		session.invalidate();
		response.sendRedirect("../index.jsp");
	%>
	
</body>
</html>








