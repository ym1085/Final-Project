<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${map['prfnm'] } : ${map['prfage'] }</title>
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
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<c:set var="symd" value="${map['sdateymd'] }"/>
<c:set var="eymd" value="${map['eddateymd'] }"/>
<script type="text/javascript">
	$(function() {
		$(".slabel").addClass("col-sm-3");
		$(".slabel").addClass("text-right");
		$(".lglabel").addClass("text-center");
		$("label").addClass("font-weight-bold");
		$("#introbox").addClass("content-wrapper");
		$("#settingfrmdiv").css("background","white");
		$(".slabel").next().addClass("col-sm-4");
		$(".lglabel").addClass("col-md-8");
		$("#poster").css("background","white");
		$("#all").css("overflow","auto");
		$("span").addClass("text-center");
		$(".lglabel").next().next().css("margin","0 auto");
		$("#settingfrmdiv label").addClass("col-sm-3 col-form-label");
		$("#settingfrmdiv label").next().addClass("form-control");
		$("#settingfrmdiv label").next().addClass("text-dark");
		
		$("#seldate").datepicker({changeYear: true,dateFormat: "yy-mm-dd",
			maxDate: new Date(Number(${eymd[0]}), Number(${eymd[1]}) -1 ,Number(${eymd[2]})),
			//minDate: new Date(Number(${symd[0]}), Number(${symd[1]}) -1 ,Number(${symd[2]})),
			minDate: new Date(Number(${symd[0]}), Number(${symd[1]}) -1 ,Number(${symd[2]})),
			showOtherMonths: true,
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월",
				"7월","8월","9월","10월","11월","12월"],
			onSelect:function(dateText,inst){
				//alert(dateText);
				settingdate(dateText);
			}	
		});
		
		$("#selseat").change(function() {
			settingchk();
		});
		
		$("#submit").click(function(){
			if($("#seldate").val()==''){
				alert("날짜를 선택해주시기 바랍니다.");
				$("#seldate").focus();
			}else if($("#selhour").val()==''){
				alert("시간을 선택해주시기 바랍니다.");
				$("#selhour").focus();
			}else if($("#selseat").val()==''){
				alert("좌석을 선택해주시기 바랍니다.");
				$("#selseat").focus();
			}else if($("#ticketNum").val()==''){
				alert("티켓수를 정해주시기 바랍니다.");
				$("#ticketNum").focus();
			}else{
				
				insert();
			}
		});
		

	});
	
	function insert(){
		$.ajax({
			url:"<c:url value='/admin/salesManagement/insertticket.do'/>",
			type:"post",
			data:{
				"seldate":$("#seldate").val(),
				"selhour":$("#selhour").val(),
				"selseat":$("#selseat").val(),
				"ticketNum":$("#ticketNum").val(),
				"mt20id":$("#mt20id").val(),
				"prfnm":$("#prfnm").val()
			},
			success:function(res){
				if(res=1){
					alert("판매 표 등록완료!!");
					self.close();
				}else{
					alert("등록중 오류 발생");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
		
		
	}
	
	
	function settingdate(d){
		var dayhour="${map['dtguidance'] }"
		var seat="${map['pcseguidance']}"
		$.ajax({
			url:"<c:url value='/admin/salesManagement/setting.do'/>",
			type:"post",
			data:{"seldate" : d,
					"dayhour":dayhour,
					"seat":seat},
			dataType:"json",
			success:function(res){
				//alert(res);
				var r1=res.result;
				var r2=res.seatresult;
				var str="<option value=''>선택</option>";
				if(r1==0){
					var hour=res.hour;
					str+="<option value='"+hour+"'>"+hour+"</option>";
					$("#selhour").find("option").remove().end().append(str);
				}else if(r1==1){
					var hour=res.hour;
					
					$.each(hour,function(idx,value){
						str+="<option value='"+value+"'>"+value+"</option>";
					});
					
					$("#selhour").find("option").remove().end().append(str);
				}
				var str2="<option value=''>선택</option>";
				if(r2==0){
					var price=res.seatprice;
					str2+="<option value='"+price+"'>"+price+"</option>";
					$("#selseat").find("option").remove().end().append(str2);
				}else if(r2==1){
					var price=res.seatprice;
					$.each(price,function(idx,value){
						str2+="<option value='"+value+"'>"+value+"</option>";
					});
						$("#selseat").find("option").remove().end().append(str2);
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function settingchk() {
		$.ajax({
			url: "<c:url value='/admin/salesManagement/settingchk.do'/>",
			type:"post",
			data: {
				"seldate":$("#seldate").val(),
				"selhour":$("#selhour").val(),
				"selseat":$("#selseat").val(),
				"mt20id":$("#mt20id").val(),
				"prfnm":$("#prfnm").val()
			},
			success:function(res){
				if(res==1){
					alert("이미 등록된 표 설정이 있습니다." 
							+"수정을 원하시면 목록에서 하시기 바랍니다.");
					$("#submit").css("visibility","hidden");
				}else{
					$("#submit").css("visibility","visible");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
</script>
<style type="text/css">
	#poster{
		margin: 0 auto;
		width: 80%;
	}
	#poster img{
		width: 100%;
	}
</style>
</head>
<body>
<div id="all">
	<div id="poster" class="text-center content-wrapper">
	<img src="${map['poster'] }">
	</div>
	
	<div id="introbox">
	<label class="slabel">공연종류 :</label><span>${map['genrenm'] }</span><br>
	<label class="slabel">공연명 :</label><span>${map['prfnm'] }</span><br>
	<label class="slabel">공연장 :</label><span>${map['fcltynm'] }</span><br>
	<label class="slabel">상태 :</label><span>${map['prfstate'] }</span><br>
	<label class="slabel">시작일 :</label><span>${map['prfpdfrom'] }</span>
	<label class="slabel">종료일 :</label><span>${map['prfpdto'] }</span><br>
	<label class="lglabel">요일 및 시간</label><br>
	<span>${map['dtguidance'] }</span>
	</div>
	
	<div class="content-wrapper" id="settingfrmdiv">
	<form name="frm" action="" method="post">
	<div>
		<label>날짜 선택</label>
		<input type="text" id="seldate" name="seldate">
	</div>
	
	<div>
		<label>시간</label>
		<select id="selhour" name="selhour">
			<option value="">선택</option>
		</select>
	</div>
	
	
	<div>
		<label>좌석등급</label>
		<select id="selseat" name="selseat">
			<option value="">선택</option>
		</select>
	</div>
	
	<div>
		<label>표 수량</label>
		<input type="number" min="0" max="100" name="ticketNum" id="ticketNum">
	</div>
	<br>
	<input type="hidden" value="${map['mt20id'] }" id="mt20id" name="mt20id">
	<input type="hidden" value="${map['prfnm'] }" id="prfnm" name="prfnm"> 
	<div class="text-center">
		<input type="button" value="등록" class="btn btn-gradient-success btn-rounded btn-fw" id="submit">
	</div>
	
	</form>
	</div>
</div>

</body>
</html>