<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/main2Top.jsp" %>
  <script src="https://code.jquery.com/jquery-latest.js"></script> 
 
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>


	<!-- 페이지 만들떄마다 복붙 -->
	<div style="width: 13%; float: left; height: 100%;">
		<!-- left side -->
		<aside class="left-sidebar" style="width: 13%;">
			<div class="logo" style="margin-bottom: 63%;">
				<a href="#welcome"
					style="color: white; font-size: 2.5em; font-family: 'Limelight', cursive;">
					Delight </a>
			</div>

			<nav class="left-nav" style="margin-top: 100%;">
				<ul id="nav">
					<li class="active"><a href="#contact-form">Contact Form</a></li>
					<li><a href="#subscription-form">Subscription Form</a></li>
					<li><a href="#video">Video Tutorial</a></li>
					<li><a href="#credit">Source and Credit</a></li>
					<li>
					<div
					style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
				</ul>
			</nav>
		</aside>
		<!-- left side -->
	</div>
	<!-- 페이지 만들떄마다 복붙 -->
	
	<!-- div안에서작업 그외엔 건들지말것 -->
	
	<div style="width: 87%; float: right;">

	<input type="button" id="sss" style="margin: 50%;">
	</div>
	<!-- div안에서작업 그외엔 건들지말것 -->
	  <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 서버 점검으로</span></p>
                <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;">10:00 - 18:00 까지</span></b></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 사용이 중지 됩니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><br /></span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">이용에 불편을 드린 점 양해를 </span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">부탁드립니다.</span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div id="ssss" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
 
 
    <script type="text/javascript">
     
        jQuery(document).ready(function() {
        	 $("#sss").click(function(){
                $('#myModal').show();
        	 });
      
        //팝업 Close 기능
        $("#ssss").click(function(){
             $('#myModal').hide();
        	
        });
        });
        
      </script>

	
<%@ include file="inc/main2Bottom.jsp" %>