<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.annTitle } - 상세보기</title>
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
	var annseq=${vo.annSeq};
	var anntype=${vo.annType};
	$(function() {
		$("#topsetting").click(function() {
			if(confirm("상단 고정으로 설정 하시겠습니까?")){
				topChk();
			}
		});
		
		$("#topunsetting").click(function(){
			if(confirm("상단 고정을 취소 하시겠습니까?")){
				topCancel();
			}
		});
		
		$("#expo").click(function() {
			if(confirm("노출 설정 하시겠습니까?")){
				expo();
			}
		});
		
		$("#unexpo").click(function() {
			if(confirm("노출 취소 설정 하시겠습니까?")){
				unexpoBefore();
			}
		});
	});
	
	
	function topsetting(){
		$.ajax({
			url: "<c:url value='/admin/announcement/topsetting.do'/>",
			type:"post",
			data: {
				annSeq : annseq
			},
			success:function(res){
				if(res==1){
					alert("해당 글을 상단 고정하였습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function topChk(){
		$.ajax({
			url: "<c:url value='/admin/announcement/topChk.do'/>",
			type:"post",
			data:{
				type : anntype
			},
			success:function(res){
				var r=res.result;
				if(r==1){
					var al=res.topinfo;
					var alsq=al.annSeq;
					if(confirm(al.annTitle+"글이 이미 상단 고정입니다. 변경하시겠습니까?")){
						alTopCancle(alsq);
					}
				}else if(r==0){
					topsetting();
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function alTopCancle(alseq){
		$.ajax({
			url: "<c:url value='/admin/announcement/alTopCancle.do'/>",
			type:"post",
			data: {
				annSeq : alseq
			},
			success:function(res){
				if(res==1){
					alert("이전 글 상단 고정을 취소하였습니다.");
					topsetting();
				}else{
					alert("취소 중 오류 발생");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function topCancel() {
		$.ajax({
			url: "<c:url value='/admin/announcement/topCancle.do'/>",
			type:"post",
			data: {
				annSeq : annseq
			},
			success:function(res){
				if(res==1){
					alert("상단 고정 취소가 되었습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}else{
					alert("취소 설정 중 오류 발생");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function expo(){
		$.ajax({
			url: "<c:url value='/admin/announcement/expo.do'/>",
			type:"post",
			data: {
				annSeq : annseq
			},
			success:function(res){
				if(res==1){
					alert("노출 설정 되었습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}else{
					alert("노출 설정 중 오류 발생");
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function unexpoBefore() {
		$.ajax({
			url: "<c:url value='/admin/announcement/topChk.do'/>",
			type:"post",
			data: {
				type : anntype
			},
			success:function(res){
				var r=res.result;
				if(r==1){
					var al=res.topinfo;
					var alsq=al.annSeq;
					if(annseq==alsq){
						if(confirm("해당 글 노출 취소시 상단 고정도 해제 됩니다. 진행하시겠습니까?")){
							unexpo();
						}
					}else{
						unexpo();
					}
				}
			},
			error:function(xhr,status,error){
				alert("Error : "+status+", "+error);
			}
		});
	}
	
	function unexpo(){
		$.ajax({
			url: "<c:url value='/admin/announcement/unExpo.do'/>",
			type:"post",
			data: {
				annSeq : annseq
			},
			success:function(res){
				if(res==1){
					alert("노출 취소가 되었습니다.");
					$(opener.document).find("form[name=frmPage]").submit();
					self.close();
				}else{
					alert("노출 설정 중 오류가 발생하였습니다.");
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
		<div id="title" class="text-center">공지명 : ${vo.annTitle }
		<sup class="text-info"><c:if test="${vo.annTop=='Y' }">상단고정</c:if></sup>
				<sub class="text-primary"><c:if test="${vo.annShow=='Y' }">노출</c:if></sub>
		</div>
		<div id="reg" class="text-right">작성일 :  
		<fmt:formatDate value="${vo.annRegdate }" pattern="yyyy-MM-dd"/>
		</div>
		</div>
		<div class="card-body" id="annContent">
		${vo.annContent }
		</div>
	</div>
	
	<div class="content-wrapper text-center">
	<span class="h4 font-weight-bold" id="editspan">설정하기</span>
	<div id="btnspan">
	<c:if test="${vo.annTop=='N'&&vo.annShow=='Y' }">
	<button class="btn btn-success btn-sm" id="topsetting">상단 고정</button>
	</c:if>
	<c:if test="${vo.annTop=='Y'&&vo.annShow=='Y' }">
	<button class="btn btn-danger btn-sm" id="topunsetting">상단 고정 해제</button>
	</c:if>
	<c:if test="${vo.annShow=='N' }">
	<button class="btn btn-success btn-sm" id="expo">노출 설정</button>
	</c:if>
	<c:if test="${vo.annShow=='Y' }">
	<button class="btn btn-danger btn-sm" id="unexpo">노출 해제</button>
	</c:if>
	<button class="btn btn-dark btn-sm" id="del">삭제</button>
	</div>
	</div>
</div>
</div>
</body>
</html>
