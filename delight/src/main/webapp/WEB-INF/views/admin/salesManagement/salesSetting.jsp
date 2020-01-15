<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../inc/adminTop.jsp" %>

<div class="content-wrapper">
	<div id="frmdiv">
		<form name="searchFrm">
		<input type="text" value="1" name="curPage" id="curPage">
		<span>장르</span>
		<select id="type" name="type">
			<option value="">장르 선택</option>
			<option value="AAAA">연극</option>
			<option value="AAAB">뮤지컬</option>
		</select>
		 
		<c:import url="/inc/inc_area.do"></c:import>
		 
		<span>시작일</span>
		<input type="text" id="stdate" name="stdate">
		 
		<span>종료일</span>
		<input type="text" id="eddate" name="eddate">
		
		<span>공연명</span>
		<input type="text" id="perfomName" name="perfomName">
		
		<button type="button">검색</button>
		</form>
	</div>
	<div class="card" id="tableparent">
		<div id="tablediv" class="card-body">
			<table class="table text-center table-bordered">
			<colgroup>
				<col style="width: 50%;">
				<col style="width: 20%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
			</colgroup>
				<thead class="table-danger font-weight-bold">
					<tr>
						<th>공연명</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<tr>
						<td colspan="4">검색 후 이용 가능합니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
form[name=searchFrm] :not(span){
	margin-left: 20px;
	margin-right: 20px;
}
form[name=searchFrm] span{
	padding-top: 10px;
}
form[name=searchFrm] button{
	margin: 0;
	margin-top: 0.3%;
}
form[name=searchFrm]{
	overflow: hidden;
}
#frmdiv{
	padding: 0 2% 0 2%;
}
#tableparent{
	margin-top: 20px;
	height: 100%;
}
#tablediv table{
	height: 100%;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>" ></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript">
$(function() {
	$("#salesManagement").addClass("active");
	$("#sell").addClass("show");
	$("form[name=searchFrm] span").addClass("font-weight-bold");
	$("form[name=searchFrm]").addClass("text-center");
	$("form[name=searchFrm] *").addClass("text-dark");
	$("form[name=searchFrm] select").addClass("form-control");
	$("form[name=searchFrm] select").addClass("form-control-sm");
	$("form[name=searchFrm] input").addClass("form-control");
	$("form[name=searchFrm] input").addClass("form-control-sm");
	$("form[name=searchFrm] button").addClass("btn btn-inverse-success btn-fw btn-sm");
	$("form[name=searchFrm] select").css("width","150px");
	$("form[name=searchFrm] #gugun").css("width","190px");
	$("form[name=searchFrm] input").css("width","100px");
	$("form[name=searchFrm] *").css("float","left");
	
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
	
	$("form[name=searchFrm] button").click(function(){
		if($("#type option:selected").val()==''){
			alert("장르를 선택하시기 바랍니다.");
			$("#type").focus();
			event.preventDefault();
		}else if($("#stdate").val()==''){
			alert("시작일을 선택하시기 바랍니다.");
			$("#stdate").focus();
			event.preventDefault();
		}else if($("#eddate").val()==''){
			alert("종료일을 선택하시기 바랍니다.");
			$("#eddate").focus();
			event.preventDefault();
		}else{
			$("#curPage").val("1");
			$.ajax({
				url:"<c:url value='/admin/salesManagement/ticketsetting.do'/>",
				type:"post",
				data: /* type : $("#type option:selected").val(),
					   sido : $("#sido option:selected").val(),
					   gugun: $("#gugun option:selected").val(),
					   stdate:$("#stdate").val(),
					   eddate:$("#eddate").val(),
					   perfomName:$("#perfomName").val() */
					   $("form[name=searchFrm]").serialize(),
					   
				dataType:"json",
				success:function(res){
					var li=res.list;
					var pageCount=res.cnt;
					var str="";
					$.each(li,function(idx,value){
						str+="<tr><td><a href='<c:url value=""/>' >"+value.prfnm
						+"</a></td><td>"+value.prfpdfrom
						+"</td><td>"+value.prfpdto+"</td><td>"
						+value.prfstate+"</td></tr>"
					});
					$("tbody").find("tr").remove().end().append(str);
					for(var i=0;i<pageCount;i++){
						
					}
				},
				error:function(xhr, status, error){
					alert("검색결과가 없습니다.");
				}
			});
		}
	});
	
	
	
});

</script>