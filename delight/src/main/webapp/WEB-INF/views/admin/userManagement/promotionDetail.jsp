<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.promoteTitle } - 상세보기</title>
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
	var seq=${vo.promoteSeq};
	var userid='${vo.userid}';
	$(function() {
		$("#pointgive").click(function() {
			if(confirm("포인트 지급 하시겠습니까?")){
				pointgive();
			}
		});	
	
		$("#del").click(function() {
			Del();
		});
	});
	
	
	function pointgive(){
		$.ajax({
			url: "<c:url value='/admin/userManagement/promogiveDetail.do'/>",
			type:"post",
			data: {
				proseq : seq
			},
			success:function(res){
				if(res==1){
					alert("해당 글 작성자에게 포인트를 지급하였습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	

	
	function Del(){
		if(confirm("해당 홍보글을 삭제 하시겠습니까?")){
			$.ajax({
				url: "<c:url value='/admin/userManagement/promoDelDetail.do'/>",
				type:"post",
				data: {
					proseq : seq
				},
				success:function(res){
					if(res==1){
						alert("해당글을 삭제하였습니다.");
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
		<div id="title" class="text-center">제목 : ${vo.promoteTitle }
		</div>
		<div id="reg" class="text-right">작성일 :  
		<fmt:formatDate value="${vo.reviewRegdate }" pattern="yyyy-MM-dd"/>
		</div>
		</div>
		<div class="card-body" id="annContent">
		${vo.promoteContent }
		<div id="imgdiv">
		<img alt="홍보 사진" src="<c:url value='/promotionupload/${vo.promoteP1 }'/>">
		</div>
		</div>
	</div>
	
	<div class="content-wrapper text-center">
	
	<div id="btnspan">

	<c:if test="${vo.mileagegive=='N' }">
	<button class="btn btn-success btn-sm" id="pointgive">지급</button>
	<button class="btn btn-danger btn-sm" id="del">삭제</button>
	</c:if>
	
	</div>
	</div>
</div>
</div>
</body>
</html>
