<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변하기</title>
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
<style type="text/css">
#annContent img{
	width: 100%;
}
#all{
	width: 100%;

}
#editspan{
	margin-right: 10px;
}
#btnspan button{
	margin: 0 5px 0 5px;
}
#btnspan {
	margin-top: 20px;
}
#title{
	width: 80%;
	float: left;
}
#reg{
	width: 20%;
	float: right;
}
#titlereg{
	overflow: hidden;
}
</style>
<script type="text/javascript">
	
	$(function() {
		$("#exit").click(function() {
			$(opener.document).find("form[name=frmPage]").submit();
			self.close();
		});
		
		$("#answer").click(function() {
			if($("textarea").val()==''){
				alert("보낼 답변을 작성하여 주시기 바랍니다.");
				$("textarea").focus();
			}else{
				if(confirm("답변을 등록하시겠습니까?")){
					answer();
				}
			}		
		});
		
	});
	
	function answer() {
		$.ajax({
			url: "<c:url value='/admin/userManagement/answer.do'/>",
			type:"post",
			data: $("form[name=frm]").serialize(),
			success:function(res){
				if(res==1){
					alert("답변 완료하였습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
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
<div class="main-panel" id="panal">
<div class="content-wrapper" id="all">
	<div class="card">
		
		<div id="titlereg">
		<div id="title" class="text-center">제목 : ${map['INQUERY_TITLE'] }</div>
		<div id="reg" class="text-right">문의일 :  
		 <fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd"/> 
		</div>
		</div>
		<div class="card-body">
		<%
			pageContext.setAttribute("newLine", "\r\n");
		%>
		${fn:replace(map['INQUERY_CONTENT'],newLine,'<br>') }
		</div>
	</div>
	<div class="card">
		<div class="card-body">
		<form name="frm">
			<label>답변</label>
			<textarea rows="15" style="width: 100%" 
			name="inqanwContent"
			<c:if test="${ck=='1' }">
			 readonly="readonly"
			</c:if>
			>${map['INQANW_CONTENT'] }</textarea>
			<input type="hidden" name="inquerySeq" value="${map['INQUERY_SEQ'] }">
		</form>
		</div>
	</div>
	<div class="content-wrapper text-center">
	<div id="btnspan">
	<c:if test="${ck=='0' }">
		<button class="btn btn-success btn-sm" id="answer">답변</button>
	</c:if>
	<button class="btn btn-success btn-sm" id="exit">닫기</button>
	</div>
	</div>
</div>
</div>
</body>
</html>
