<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${map['REVIEW_TITLE'] } - 상세보기</title>
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
	var seq=${map['REVIEW_SEQ']};
	
	$(function() {
	
		$("#del").click(function() {
			Del();
		});
	});
	
	
	function Del(){
		if(confirm("해당 홍보글을 삭제 하시겠습니까?")){
			$.ajax({
				url: "<c:url value='/admin/userManagement/reviewDelDetail.do'/>",
				type:"post",
				data: {
					reviewseq : seq
				},
				success:function(res){
					if(res==1){
						alert("해당 후기글을 삭제하였습니다.");
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
		<div id="title" class="text-center">제목 : ${map['REVIEW_TITLE'] }
		<sub>장르  : ${map['PERFOMTYPE'] }</sub>
		</div>
		<div id="reg" class="text-right">작성일 :  
		<fmt:formatDate value="${map['REVIEW_REGDATE'] }" pattern="yyyy-MM-dd"/>
		</div>
		</div>
		<div class="card-body" id="annContent">
		${map['REVIEW_CONTENT'] }
		<c:if test="${map['REVIEW_P1']!=null }">
			<hr>
			<div id="imgdiv">
			<img alt="리뷰 사진1" src="<c:url value='/reviewupload/${map["REVIEW_P1"] }'/>" >
			</div>
		</c:if>
		<c:if test="${map['REVIEW_P2']!=null }">
			<hr>
			<div id="imgdiv2">
			<img alt="리뷰 사진2" src="<c:url value='/reviewupload/${map["REVIEW_P2"] }'/>">
			</div>
		</c:if>
		<c:if test="${map['REVIEW_P3']!=null }">
			<hr>
			<div id="imgdiv3">
			<img alt="리뷰 사진3" src="<c:url value='/reviewupload/${map["REVIEW_P3"] }'/>">
			</div>
		</c:if>
		</div>
	</div>
	
	<div class="content-wrapper text-center">
	
	<div id="btnspan">

	<button class="btn btn-danger btn-sm" id="del">삭제</button>
	
	</div>
	</div>
</div>
</div>
</body>
</html>
