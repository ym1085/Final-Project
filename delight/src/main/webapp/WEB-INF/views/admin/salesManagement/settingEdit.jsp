<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${vo.prfnm } - 수량 수정</title>
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

<script type="text/javascript">
	$(function() {
		$("#set").click(function() {
			if($("#selledit").val()==''){
				alert("변경할 수량을 입력하여주시기 바랍니다.");
				$("#selledit").focus();
			}else{
				if(confirm("변경하시겠습니까?")){
					settingEdit();
				}
			}
		});
		$("#cencle").click(function() {
			if(confirm("삭제하시겠습니까?")){
				del();
			}
		});
		
		$("#selledit").keyup(function() {
			var ck=$("#selledit").val()-$("#type").val();
			
			if(ck<0){
				alert("판매된 수량보다 적어질 수 없습니다.");
				$("#selledit").val($("#type").val());
			}
		});
	});
	
	function settingEdit(){
		
			$.ajax({
				url:"<c:url value='/admin/salesManagement/editSetting.do'/>",
				type:"post",
				data:
					{
						selledit : $("#selledit").val(),
						ticketSeq:$("#ticketSeq").val()
					}
				,
				success:function(res){
					 if(res==1){
						alert("표 수량 변경완료!!");
						$(opener.document).find("form[name=frmPage]").submit();
						self.close();
					}else{
						alert("수정 중 오류 발생");
					} 
					
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
	}
	
	function del(){
		$.ajax({
			url:"<c:url value='/admin/salesManagement/settingDel.do'/>",
			type:"post",
			data:
				{
					ticketSeq:$("#ticketSeq").val()
				}
			,
			success:function(res){
				 if(res==1){
					alert("표 수량 설정 삭제완료!!");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}else {
					alert("삭제 중 오류 발생");
				}
				
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
</script> 
</head>
<body>
<div class="card" style="background: #f1defc">
	<div class="card-body">
		<h4 class="card-title font-weight-bold">${vo.prfnm }/${vo.prfdate}/${vo.prfhour }</h4>
		<form id="frm" name="discount">
			<div class="form-group">
				<label>설정된 수량</label>
				<input type="number" name="detail" class="form-control" value="${vo.sellticket }" id="detail" readonly="readonly">
			</div>
			<div class="form-group">
				<label>변경할 수량</label>
				<input type="number" name="selledit" id="selledit" class="form-control" placeholder="판매된 보다 작을 순 없습니다."  min="0">
			</div>
			<input type="hidden" value="${param.ticketseq }" name="ticketSeq" id="ticketSeq">
			<input type="hidden" value="${vo.selled }" name="type" id="type">
			<div class="text-center">
				<button type="button" class="btn btn-gradient-success btn-rounded btn-sm" id="set">변경</button>
				<c:if test="${!(vo.selled>0) }">
				<button type="button" class="btn btn-gradient-warning btn-rounded btn-sm" id="cencle">삭제</button>
				</c:if>
			</div>
		</form>
	</div>
</div>
</body>
</html>