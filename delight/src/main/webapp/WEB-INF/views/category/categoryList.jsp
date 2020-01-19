<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 딜라이트 메인에서 연극/뮤지컬 버튼 누르면 해당 장르명 뿌려주는 리스트 -->

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../package/css/swiper.min.css"><!-- 절대 지우지 마세요. 슬라이드 룰링 안됩니다 -->
<style>
	  * {
		box-sizing: border-box;
	}

	html,
	body {
	    padding: 0;
	    font-family: Arial, sans-serif;
	} 

	.slide_container {
	    width: 150%;
	    max-width: 1170px; 	  
	    padding: 0 15px;
	    margin: 0 auto;
	}
	
	.img-responsive {
	    display: block;
	    max-width: 100%;
	   /* height: auto; */
	}
	
	.testImg{
		text-align: center;
	} 


</style>
<!-- 카드슬라이드 library, js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/css/swiper.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/js/swiper.min.js"></script>

<section>
	<div class="slide_container">
	    <div class="swiper-container">
	        <div class="swiper-wrapper">
	          <!-- API 반복 -->  
	            <c:forEach var = "vo" items="${alist }">          	
	            	<div class="swiper-slide">
	            		<div class = "testImg">
	            			<a href="<c:url value='/performance/pfDetail.do?perfomid=${vo.mt20id}'/>">
	            				<img src="${vo.poster }" class="img-responsive" width="240px" height="240px">
	            			</a>
	            			<br>
	            			<h5><b>${vo.prfnm }</b></h5> 
					    		<p>${vo.prfpdfrom }</p> 
					    		<p>${vo.prfpdto }</p> 
					    		<p>${vo.genrenm }</p>  
	            		</div>
	            	</div>           	
	            </c:forEach>
	           
	        </div>
	        
	        <div class="swiper-button-prev swiper-button-white"></div><!-- 카드슬라이드 왼쪽버튼 -->
	        <div class="swiper-button-next swiper-button-white"></div><!-- 카드슬라이드 오른쪽버튼 -->
	    </div>
	</div>	
</section>

<!-- Swiper JS -->
  <script src="../package/js/swiper.min.js"></script><!-- 절대 지우지 마세요. 슬라이드 룰링 안됩니다 -->

  <!-- Initialize Swiper -->
  <script>
   var swiper = new Swiper('.swiper-container', {
	    //loop: true,
	    prevButton: '.swiper-button-prev',
	    nextButton: '.swiper-button-next',
	    slidesPerView: 5, //한 슬라이드에 나오는 이미지 개수
	    spaceBetween: 20, //사이간격
	    slidesPerColumn: 1, //열 개수
	    slidesPerColumnFill: 'row',
	    slidesPerGroup: 5
	}); 
	
  </script>
   