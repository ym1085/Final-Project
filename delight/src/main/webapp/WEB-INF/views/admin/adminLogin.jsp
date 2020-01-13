<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Delight - 관리자 로그인</title>
    <!-- plugins:css -->
     <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/mdi/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/vendors/css/vendor.bundle.base.css'/>">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" 
    href="<c:url value='/resources/admin/assets/css/style.css'/>">
    <!-- End layout styles -->
  </head>
  <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script type="text/javascript">
	$(function(){
		$("#userid").focus();
		
		$("form[name=frm]").submit(function(){
			if($("input[name=userid]").val()==''){
				alert("아이디를 입력하시기 바랍니다.");
				$("input[name=userid]").focus();
				event.preventDefault();
			}else if($("input[name=pwd]").val()==''){
				alert("비밀번호를 입력하시기 바랍니다.");
				$("input[name=pwd]").focus();
				event.preventDefault();
			}
		});
		
	});
</script>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <span class="display-3 text-danger" style="font-weight: bold">Delight</span>
                </div>
                <h3 class="font-weight-bold">로그인</h3>
                <sub class="font-weight-light">로그인 후 이용가능합니다.</sub>
                <form class="pt-3" action="<c:url value='/admin/adminLogin.do'/>" method="post" name="frm">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" 
                    placeholder="아이디" name="userid"
                    value="${cookie.ck_admin.value }">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="비밀번호" name="pwd">
                  </div>
                  <div class="mt-3">
                    <button type="submit" class="btn btn-block btn-gradient-danger btn-lg font-weight-medium auth-form-btn">로그인</button>
                  </div>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <div class="form-check">
                       <input type="checkbox" class="form-check-input" id="chkSave" style="margin-left: 0px;" name="chkSave"
                       <c:if test="${!empty cookie.ck_admin }">
							checked="checked"
						</c:if>
                       > 
                      <label class="form-check-label text-muted" for="chkSave">아이디 저장 </label>
                    </div>
                    <a href="#" class="auth-link text-black">비밀번호를 잊어버리셨나요?</a>
                  </div>
                  
                  
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<c:url value='/resources/assets/vendors/js/vendor.bundle.base.js'/>"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<c:url value='/resources/assets/js/off-canvas.js'/>"></script>
    <script src="<c:url value='/resources/assets/js/hoverable-collapse.js'/>"></script>
    <script src="<c:url value='/resources/assets/js/misc.js'/>"></script>
    <!-- endinject -->
  </body>
</html>