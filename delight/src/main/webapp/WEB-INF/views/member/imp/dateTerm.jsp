<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/jquery-ui.min.css'/>"/>

<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>	
	
<script type="text/javascript">
	$(function(){
		$("#startDay").datepicker({
			dateFormat:'yy-mm-dd',
		   	changeYear:true,
		   	dayNamesMin:['일','월','화','수','목','금','토'],
		   	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		$("#endDay").datepicker({
			dateFormat:'yy-mm-dd',
		   	changeYear:true,
		   	dayNamesMin:['일','월','화','수','목','금','토'],
		   	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	});
		/*	
		$("#btDay7").click(function(){
			$.setDate('d', 7);
		});
		
		$("#btMonth1").click(function(){
			$.setDate('m', 1);
		});
		
		$("#btMonth3").click(function(){
			$.setDate('m', 3);
		});
				
		
	
	
	$.setDate=function(type, term){
		//endDay의 값을 읽어서, Date 형태로 만든다
		//그 Date에서 7일전, 3개월전, 1개월전 날짜를 구한 후
		//startDay에 셋팅한다
		//Date(년, 월, 일) => 해당 날짜의 Date객체
		
		//2020-01-15
		var arr=$("#endDay").val().split('-');
		var d = new Date(arr[0], arr[1]-1 , arr[2]);
		
		if(type=='d'){
			d.setDate(d.getDate()-term);
		}else if(type=='m'){
			d.setMonth(d.getMonth()-term);
		}
		
		//startDay에 년-월-일 형식으로 변환한 후 셋팅
		$("#startDay").val($.findDate(d));
		
	}
	
	$.findDate=function(date){
		//Date형식을 년-월-일 형식으로 변환
		//getFullYear()
		return date.getFullYear()+"-"+$.formatDate(date.getMonth()+1) 
			+ "-" + $.formatDate(date.getDate());		
	}
	
	$.formatDate=function(d){
		//월이나 일이 1자리인 경우 0을 붙여서 리턴
		if(d<10){
			return "0"+d;
		}else{
			return d;
		}
	}
	*/
</script>


	<input type="button" id="btDay7" class="date1" value="1주일" >
	<input type="button" id="btMonth1" class="date1" value="1개월">
	<input type="button" id="btMonth3" class="date1" value="3개월">
	<input type="text" name="startDay" id="startDay" value=""> ~ 
	<input type="text" name="endDay" id="endDay" value="">
