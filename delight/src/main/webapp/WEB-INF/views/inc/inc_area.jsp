<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	
</script>
   <div>
   <select name="sido" id="sido">
   	<option value="">선택</option>
   <c:forEach var="sido" items="${sido }">
   	<option value="${sido.signgucode }">${sido.sido }</option>
   </c:forEach>
   </select>
   
   <select name="gugun" id="gugun">
   	<option value="">선택</option>

   </select>
   </div>