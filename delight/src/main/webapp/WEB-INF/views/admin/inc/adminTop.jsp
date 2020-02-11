<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Delight - 관리자 모드</title>
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
    <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="<c:url value='/admin/adminMain.do'/>"><span class="display-3 text-danger" style="font-weight: bold">Delight</span></a>
          <a class="navbar-brand brand-logo-mini" href="<c:url value='/admin/adminMain.do'/>"><span class="display-3 text-danger" style="font-weight: bold">D</span></a>
          
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>

          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black">${sessionScope.adminUserName}</p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item" href="#" id="pwdcg">
                  <i class="mdi mdi-cached mr-2 text-success"></i> 비밀번호 변경 </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" id="logout">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> 로그아웃 </a>
              </div>
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>


            <li class="nav-item nav-logout d-none d-lg-block">
              <a class="nav-link" href="#" id="out">
                <i class="mdi mdi-power"></i>
              </a>
            </li>
            <li class="nav-item nav-settings d-none d-lg-block">
              <a class="nav-link" href="#">
                <i class="mdi mdi-format-line-spacing"></i>
              </a>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile text-danger active">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <i class="mdi mdi-account-circle icon-lg "></i>
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">${sessionScope.adminUserName}</span>
                  <span class="text-secondary text-small">관리자</span>
                </div>
              </a>
            </li>
            <li class="nav-item" id="adminHome">
              <a class="nav-link z" href="<c:url value='/admin/adminMain.do'/>">
                <span class="menu-title">관리모드 홈</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <!-- 공지관리 -->
            <li class="nav-item" id="announcement">
              <a class="nav-link" data-toggle="collapse" href="#ann" aria-expanded="false" aria-controls="ann">
                <span class="menu-title">공지관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-note-text menu-icon"></i>
              </a>
              <div class="collapse" id="ann">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/announcement/annWrite.do'/>"> 
				  공지작성 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/announcement/annInc.do'/>"> 
				  공지목록/설정 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/FAQ/FAQManagement.do'/>"> 
				  자주묻는질문 관리 </a></li>
                  
                </ul>
              </div>
            </li>

			<!-- 회원관리 -->
			<li class="nav-item" id="userManagement">
              <a class="nav-link" data-toggle="collapse" href="#user" aria-expanded="false" aria-controls="user">
                <span class="menu-title">회원관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-account-multiple menu-icon"></i>
              </a>
              <div class="collapse" id="user">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/userManagement/gradeManagement.do'/>" > 
				  등급별 혜택 관리 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/userManagement/userList.do'/>"> 
				  회원/회원별 결제목록 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/userManagement/inqueryList.do'/>"> 
				  문의목록 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/userManagement/promotionBoardList.do'/>"> 
				  홍보게시판 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/userManagement/reviewBoardList.do'/>"> 
				  후기게시판 </a></li>
                  
                </ul>
              </div>
            </li>

			<!-- 매출관리 -->
			<li class="nav-item" id="salesManagement">
              <a class="nav-link" data-toggle="collapse" href="#sell" aria-expanded="false" aria-controls="sell">
                <span class="menu-title">매출관리</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-cash-multiple menu-icon"></i>
              </a>
              <div class="collapse" id="sell">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/salesManagement/refundReqList.do'/>"> 
				  환불신청 내역 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/salesManagement/salesSetting.do'/>" > 
				  판매수량 설정</a></li>
				  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/salesManagement/settingList.do'/>" > 
				  판매수량 설정 목록 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/salesManagement/salesDiscount.do'/>" > 
				  특별공연 할인</a></li>
                  
                </ul>
              </div>
            </li>
            
            <!-- 통계 -->
			<li class="nav-item" id="chartPart">
              <a class="nav-link" data-toggle="collapse" href="#chart" aria-expanded="false" aria-controls="chart">
                <span class="menu-title">통계</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-chart-line menu-icon"></i>
              </a>
              <div class="collapse" id="chart">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/numericalStatement/memberStatistics.do'/>"> 
				  회원통계 </a></li>
                  <li class="nav-item"> <a class="nav-link z" href="<c:url value='/admin/numericalStatement/salesSatistics.do'/>"> 
				  매출/예매통계 </a></li>
                </ul>
              </div>
            </li>
			
			 <li class="nav-item" id="excel">
              <a class="nav-link z" href="<c:url value='/admin/exceluploadImport.do'/>">
                <span class="menu-title">엑셀 임포트</span>
                <i class="mdi mdi-import menu-icon"></i>
              </a>
            </li>
			
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <!-- 여기까지 Top -->