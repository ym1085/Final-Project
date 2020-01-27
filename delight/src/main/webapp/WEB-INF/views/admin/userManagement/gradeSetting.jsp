<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급  ${vo.gradeName } 설정 변경</title>
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
			if($("#gradeStandard").val()==''){
				alert("기준액을 입력하여주시기 바랍니다.");
				$("#gradeStandard").focus();
			}else if($("#gradeBenefit").val()==''){
				alert("혜택을 입력하여주시기 바랍니다.");
				$("#gradeBenefit").focus();
			}else{
				settingEdit();
			}
		});
		$("#cencle").click(function() {
			self.close();
		});
	});
	
	function settingEdit(){
		
			$.ajax({
				url:"<c:url value='/admin/userManagement/gradeEdit.do'/>",
				type:"post",
				data:
					$("form[name=grade]").serialize()
				,
				success:function(res){
					 if(res==1){
						alert("특별할인 등록완료!!");
						opener.location.reload();
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
	
</script> 
</head>
<body>
<div class="card" style="background: #f1defc">
	<div class="card-body">
		<h4 class="card-title font-weight-bold">등급 - ${vo.gradeName }</h4>
		<form id="frm" name="grade">
			<div class="form-group">
				<label>기준 - 결제 누적액</label>
				<input type="number" name="gradeStandard" class="form-control" 
				<c:if test="${vo.gradeName=='b' }">
				readonly="readonly"
				</c:if>
				value="${vo.gradeStandard }" id="gradeStandard" min="0">
			</div>
			<div class="form-group">
				<label>혜택</label>
				<input type="number" name="gradeBenefit" id="gradeBenefit" class="form-control" placeholder="예) 10=10%"  min="0" max="50" value="${vo.gradeBenefit }">
			</div>
			<input type="hidden" value="${param.gradeSeq }" name="gradeSeq" id="gradeSeq">
			<div class="text-center">
				<button type="button" class="btn btn-gradient-success btn-rounded btn-sm" id="set">변경</button>
				<button type="button" class="btn btn-gradient-warning btn-rounded btn-sm" id="cencle">닫기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>