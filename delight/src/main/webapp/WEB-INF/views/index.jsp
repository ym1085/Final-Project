<!-- 딜라이트 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Delight</title>
<style type="text/css">

</style>
<!-- 이건 폰트 css 경로! -->
<link href="//fonts.googleapis.com/css?family=Limelight" rel="stylesheet">
<!--online_fonts-->
<link href="//fonts.googleapis.com/css?family=Yeseva+One" rel="stylesheet">
<!--online_fonts-->
<link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

	<!-- 여기서부터 기존코드 -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Delight</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/idx_resource/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/idx_resource/css/style.css">
    
</head>
<body>
<!--::header part start::-->
	<header class="main_menu">
       
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.html"> <span class="q1">Delight</span> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                          <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent" style="float: right">
                                <ul class="navbar-nav" style="margin-left: 73%;">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">랭킹</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">고객센터</a>
                                    </li>
                                </ul>
                            </div>
                            <a href="<c:url value='/login/login.do'/>" class="btn_1 d-none d-lg-block" style="background-color: rgb(3, 169, 244);">로그인</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header> 
       
    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1>Delight</h1>
                            <p>Let’s start your cultural life with us, your delight will come true</p>
                            <a href="#" class="btn_1" style="background-color: rgb(255, 0, 102); font-size: 1.6em;">예매하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->
    
    <!-- 공연&뮤지컬 검색 탭! style.css 그대로 사용-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="perform-tab" data-toggle="tab" href="#perform" role="tab" aria-controls="perform" aria-selected="true">공연</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="region-tab" data-toggle="tab" href="#region" role="tab" aria-controls="region" aria-selected="false">지역</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="perform" role="tabpanel" aria-labelledby="perform-tab">
                                <div class="booking_form">
                                    <form action="<c:url value="/performance/pfDetail.do"/>" method="post">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <input id="datepicker_1" placeholder="startDay" name="startDay">
                                            </div>
                                            <div class="form_colum">
                                                <input id="datepicker_2" placeholder="endDay" name="endDay">
                                            </div>
	                                        <div class="form_colum">
	                                        	<input id="performName" name="performName" type="text" 
	                                        		placeholder="공연명을 입력하세요" 
	                                        		style="width:300px; height:50px;font-size:15px;">
	                                        </div>
	                                        <div class="form_btn" type="submit">
	                                        	<!-- <a href="#" class="btn_1" id="Search">검색</a> -->
	                                        	<input id="Search" name="Search" type="submit" class="btn_1"  value="검색">
	                                        </div>   
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="region" role="tabpanel" aria-labelledby="region-tab">
                                <div class="booking_form">
                                    <form action="#">
                                        <div class="form_colum" style="text-align: center">
                                        	<input id="regionName" name="regionName" type="text" placeholder="지역명을 입력하세요"
                                            	style="width:600px; height:50px;font-size:15px;">                      
	                                        <a href="${pageContext.request.contextPath}/performance/pfDetail.do" class="btn_1">검색</a>                                                                             
                                        </div>
                                    </form>
                                </div>
                            </div>                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 공연&뮤지컬 검색 탭 끝-->
    <br><br>
    <%@include file="inc/ButtonAPI.jsp" %>
    
    <br><br>
    <section>
    	<%@include file="category/categoryList.jsp" %>
    </section>
    <br><br>
    
    <!-- 푸터 시작 --><!-- clear: both; -->
    <footer class="footer-area" style="background: #08223a; data-position:fixed;">
        <div class="container-fluid"> 
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0">
                        <br>
							Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
							All rights reserved </br> 
							주소 : 서울시 서초구 서초대로 77길54 서초더블유타워 1406호 </br> 
							TEL : 02-1234-5678  |  fax : 02-1234-5678 </br>
							개인정보관리책임자 : Delight(admin@delihgt.com) </br>  
							<i class="ti-heart" aria-hidden="true"></i> by 
							<a href="https://colorlib.com" target="_blank">Delight</a>
						</p>
                    </div>
                </div>
            </div>
        </div>
    </footer> 
    <!-- footer part end-->
    
     
    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/contact.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/resources/idx_resource/js/custom.js"></script>   
</body>

</html>