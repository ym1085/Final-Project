<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.faqTitle } - 상세보기</title>
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
	var faqseq=${vo.faqSeq};
	
	$(function() {
		$("#exit").click(function() {
			$(opener.document).find("form[name=frmPage]").submit();
			self.close();
		});
		
		$("#edit").click(function() {
			location.href='<c:url value="/admin/FAQ/FAQEdit.do?faqSeq=${vo.faqSeq}"/>';
		});
		
		$("#del").click(function() {
			faqDel();
		});
	});
	

	function faqDel(){
		if(confirm("해당 FAQ를 삭제 하시겠습니까?")){
			$.ajax({
				url: "<c:url value='/admin/FAQ/delatDetail.do'/>",
				type:"post",
				data: {
					faqSeq : faqseq
				},
				success:function(res){
					if(res==1){
						alert("해당 FAQ를 삭제하였습니다.");
						$(opener.document).find("form[name=frmPage]").submit();
						self.close();
					}else{
						alert("삭제중 오류 발생!!");
					}
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
		}
	}
</script>
</head>
<body>
<div class="main-panel" id="panal">
<div class="content-wrapper" id="all">
	<div class="card">
		
		<div id="titlereg">
		<div id="title" class="text-center">(${vo.faqType }) : ${vo.faqTitle }</div>
		<div id="reg" class="text-right">작성일 :  
		 <fmt:formatDate value="${vo.faqRegdate }" pattern="yyyy-MM-dd"/> 
		</div>
		</div>
		<div class="card-body" id="faqContent">
		<%
			pageContext.setAttribute("newLine", "\r\n");
		%>
		${fn:replace(vo.faqContent,newLine,'<br>') }
		</div>
	</div>
	
	<div class="content-wrapper text-center">
	<span class="h4 font-weight-bold" id="editspan">설정하기</span>
	<div id="btnspan">
	<button class="btn btn-success btn-sm" id="edit">수정</button>
	<button class="btn btn-success btn-sm" id="exit">닫기</button>
	<button class="btn btn-dark btn-sm" id="del">삭제</button>
	</div>
	</div>
</div>
</div>
</body>
</html>
