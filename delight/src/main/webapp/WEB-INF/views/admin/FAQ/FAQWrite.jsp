<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 작성</title>
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
<script type="text/javascript">
$(function() {
	$("form[name=submitfrm]").submit(function() {
		if($("#type").val()==''){
			alert("질문 유형을 선택하세요");
			$("#type").focus();
			event.preventDefault();
		}else if($("#title").val()==''){
			alert("제목을 입력하세요");
			$("#title").focus();
			event.preventDefault();
		}else if($("#context").val()==''){
			alert("내용을 입력하세요");
			$("#context").focus();
			event.preventDefault();
		}else{
			event.preventDefault();
			$.ajax({
				url: "<c:url value='/admin/FAQ/FAQWrite.do'/>",
				type:"post",
				data: $("form[name=submitfrm]").serialize(),
				success:function(res){
					if(res==1){
						alert("등록 완료!!");
						window.opener.document.location.href = window.opener.document.URL;
						self.close();
					}else{
						alert("등록 중 오류 발생!");
					}
				},
				error:function(xhr,status,error){
					alert("Error : "+status+", "+error);
				}
			});
		}
		
		
	});
});
</script>
<style type="text/css">
	#context{
		width: 100%;
	}
	label{
		margin-top: 5px;
	}
	#box{
		margin-top: 10px;
	}
</style>
</head>
<body>
<div class="main-panel" id="panal">
	<div class="content-wrapper" id="all">
<h2 class="display-2">자주 묻는 질문 작성</h2>
		<div class="card">
			<div class="card-body">
				<form method="post" name="submitfrm">
					<div>
						<div>
							<label class="font-weight-bold">질문 유형</label>
							<select id="type" name="faqType" class="form-control form-control-sm">
								<option value="">선택</option>
								<option value="가입">가입</option>
								<option value="예매/결제">예매/결제</option>
								<option value="마일리지">마일리지</option>
								<option value="이벤트">이벤트</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div>
							<label class="font-weight-bold">제목</label>
							<input type="text" name="faqTitle" class="form-control form-control-sm" id="title">
						</div>
					</div>
					<div>
						<label class="font-weight-bold">내용</label>
						<textarea rows="20" id="context" name="faqContent" class="form-control"></textarea>
					</div>
					<div class="text-center" id="box">
					<input class="btn btn-gradient-success btn-rounded btn-sm" type="submit" value="작성완료">
					<input class="btn btn-gradient-danger btn-rounded btn-sm" type="reset" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>