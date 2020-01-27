<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var select="<option value=''>선택</option>"; 
		$("#sido").change(function(){
			var para={ sido : $("#sido option:selected").text()}
			if($("#sido").val()==''){
				$("#gugun").find("option").remove ().end().append(select);
			}else{
				$.ajax({
					type:"post",
					url:"<c:url value='/inc/areagugun.do'/>",
					contentType:"application/json; charset=utf-8;",
					datatype:"json",
					data: JSON.stringify(para),
					success:function(data){
						var results=data.list;
						$("#gugun").find("option").remove().end().append(select);
						$.each(results,function(i,value){
							$("#gugun").append("<option value='"+value.signgucodesub+"'>"+value.gugun+"</option>");
						});
					}
				});
				
			}
		});
	});
</script>
   &nbsp;&nbsp;&nbsp;&nbsp;<span>시,도</span>&nbsp;
   <select name="sido" id="sido" style="width:150px;height:40px;font-size:15px;">
   	<option value=""></option><!-- 선택 -->
   	<c:forEach var="sido" items="${sido }">
   	<option value="${sido.signgucode }">${sido.sido }</option>
   </c:forEach>
   </select>
   
   &nbsp;&nbsp;&nbsp;&nbsp;<span>구,군</span>&nbsp;
   <select name="gugun" id="gugun" style="width:150px;height:40px;font-size:15px;">
   	<option value=""></option>
   </select>
   