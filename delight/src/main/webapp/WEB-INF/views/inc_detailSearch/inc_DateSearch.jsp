<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- style CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">

	
<span>시작일</span>
<input type="text" id="stdate" name="stdate" style="width:100px;height:40px;font-size:15px;">
			 
<span>종료일</span>
<input type="text" id="eddate" name="eddate" style="width:100px;height:40px;font-size:15px;">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>" ></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript">

	
	$("#stdate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	
	$("#eddate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	

</script>	

		