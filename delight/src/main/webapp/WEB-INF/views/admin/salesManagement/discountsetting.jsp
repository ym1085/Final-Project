<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="pf" value="${fn:replace(param.pfname,'(','[' ) }" />
<c:set var="pf" value="${fn:replace(pf,')',']' ) }" />
<title>${pf } - 특별 할인 설정</title>
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
			if($("#detail").val()==''){
				alert("할인 설명을 입력하여주시기 바랍니다.");
				$("#datail").focus();
			}else if($("#percent").val()==''){
				alert("할인율을 입력하여주시기 바랍니다.");
				$("#percent").focus();
			}else{
				insertupdate();
			}
		});
		$("#cencle").click(function() {
			if(confirm("삭제하시겠습니까?")){
				del();
			}
		});
	});
	
	function insertupdate(){
		
			$.ajax({
				url:"<c:url value='/admin/salesManagement/discountInsert.do'/>",
				type:"post",
				data:
					{
						detail : $("#detail").val(),
						percent: $("#percent").val(),
						ticketSeq:$("#ticketSeq").val(),
						type:$("#type").val()
					
					}
				,
				success:function(res){
					 if(res==1){
						alert("특별할인 등록완료!!");
						$(opener.document).find("form[name=frmPage]").submit();
						self.close();
					}else if(res==2){
						alert("특별할인 수정완료!!");
						$(opener.document).find("form[name=frmPage]").submit();
						self.close();
					}else{
						alert("등록, 수정 중 오류 발생");
					} 
					
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
	}
	
	function del(){
		$.ajax({
			url:"<c:url value='/admin/salesManagement/discountDel.do'/>",
			type:"post",
			data:
				{
					ticketSeq:$("#ticketSeq").val()
				}
			,
			success:function(res){
				 if(res==1){
					alert("특별할인 삭제완료!!");
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
		<h4 class="card-title font-weight-bold">${pf }</h4>
		<form id="frm" name="discount">
			<div class="form-group">
				<label>설정 이유</label>
				<input type="text" maxlength="15" name="detail" class="form-control" value="${vo.detail }" id="detail">
			</div>
			<div class="form-group">
				<label>할인율</label>
				<input type="number" name="percent" id="percent" class="form-control" placeholder="예) 10=10%"  min="0" max="50" value="${vo.percent }">
			</div>
			<input type="hidden" value="${param.ticketseq }" name="ticketSeq" id="ticketSeq">
			<input type="hidden" value="
			<c:if test='${empty vo }'>0</c:if> 
			<c:if test='${!empty vo }'>1</c:if> 
			" name="type" id="type">
			<div class="text-center">
				<button type="button" class="btn btn-gradient-success btn-rounded btn-sm" id="set">설정</button>
				<c:if test='${!empty vo }'>
				<button type="button" class="btn btn-gradient-warning btn-rounded btn-sm" id="cencle">설정 취소</button>
				</c:if> 
			</div>
		</form>
	</div>
</div>
</body>
</html>