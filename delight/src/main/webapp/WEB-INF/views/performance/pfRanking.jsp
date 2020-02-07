<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/main2Top.jsp"%>
<style>
*{box-sizing: border-box;}
@media ( min-width : 769px) .myarea_main.cont1 { max-height:347px; min-height:300px; }
@media ( min-width : 769px) .myarea_main .myarea_select_wrap { position:absolute; top:0; left:0; width:220px; height:100%; }
select #themeType { width: 100%; height: 40px; line-height: 38px; border: 1px solid #d5d8de; padding: 0 36px 0 16px;	box-sizing: border-box; color: #4f5561; font-size: 15px; font-weight: normal; }
html, body {padding: 0; height: 400px; font-family: Arial, sans-serif; }
hr.line_hr {margin: 0 0 13px 0; background-color: #aa12ff; height: 2px; }
hr.hrhr {color: black;margin-top: 2em; }
h1.text_h1 {font-weight: 600; }
h2.text_h2 {font-weight: 600; }
.canvus_menu { color: #000; font-weight:700; font-family: "Nanum Gothic", 'Noto Sans KR', sans-serif; font-size: 18px; height: 48px; line-height: 48px; text-indent: 2px; }
.div_rank {margin-top: 31px; }
.ranking_div { width: 202px;margin: 24px 44px 58px 22px; float: left; }
.tit { text-align: center; font-size: 1.5em;border-bottom: 0.3px solid #e0d4d4; padding-bottom: 20px; line-height: 4;	font-weight: bold; }
.myarea_main .myarea_select_wrap {position: absolute; top: 0; left: 0; width: 220px; height: 100%; }
.stage { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); }
#ststype{ width: 201.979166px; height: 36.979166px; }
//
BASIC
body {background: linear-gradient(135deg, #121721 0%, #000000 100%) fixed; color: #FFF; font: 300 16px/1.5 "Open Sans", sans-serif;}

</style>
<!-- 카드슬라이드 library, js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/css/swiper.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/js/swiper.min.js"></script>

<!-- 시작 -->
   <!-- 페이지 만들떄마다 복붙 -->
   <div style="width: 13%; float: left; height: 100%;">
      <!-- left side -->
      <aside class="left-sidebar" style="width: 13%;">
         <div class="logo" style="margin-bottom: 63%;">
            <a href="<c:url value='/index.do'/>" style="color: white; 
               font-size: 2.5em; font-family: 'Limelight', cursive;">
               Delight 
            </a>
         </div>
         
         <nav class="left-nav" style="margin-top: 100%;">
            <ul id="nav">
               <li class="active"><a href="<c:url value='/performance/pfRanking.do'/>">랭킹</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value='/performSearchResult/theaterSearch.do?type=AAAA'/>">연극</a></li>
               <li><a href="<c:url value='/performSearchResult/musicalSearch.do?type=AAAB'/>">뮤지컬</a></li>
               <li><a href="<c:url value='/performSearchResult/areaSearch.do'/>">지역별</a></li>
               <li><a href="<c:url value='/performSearchResult/periodSearch.do'/>">기간별</a></li>
               <li><div style="width: 130px; border: 1px solid white; margin-left: 13%; margin-top: 10px;"></div></li>
               <li><a href="<c:url value="/mainSearchResult/doReservation.do"/>">예매하기</a></li>
            </ul>
         </nav>
      </aside>
      
      <!-- left side -->
      <!-- 풀테스트 -->
   </div>
<!-- 페이지 만들떄마다 복붙 -->
<!-- div안에서작업 그외엔 건들지말것 -->
<div style="width: 87%; float: right;" class="pfRanking">

	<h1 class="tit">공연 제목 영역</h1>
	<!-- 시간별 순위 시작 -->

	<div class="slide_container" id="container1">
		<form name="ststypeForm" id="ststypeForm" action="<c:url value='/performance/pfRanking.do'/>">
			<div class="myarea_select_wrap">
				<div class="ranking_div">
					<hr class="line_hr">
					<h2 class="text_h2">시간 별 순위</h2>
					<select name="ststype" id="ststype">
						<option value="day"<c:if test="${param.ststypeOption=='day'}">selected="selected"</c:if>>24시간</option>
						<option value="week"<c:if test="${param.ststypeOption=='week'}">selected="selected"</c:if>>주별</option>
						<option value="month"<c:if test="${param.ststypeOption=='month'}">selected="selected"</c:if>>월별</option>
					</select> 

				</div>
			</div>
		</form>
		<form name="optionForm" action="<c:url value='/performance/pfRanking.do'/>">
			<input class="ststypeOption" name="ststypeOption" type="hidden" value="${param.ststypeOption }">
		</form>
		
<form name="rankingList1" id="rankingList1" action="<c:url value='/performance/pfRanking.do'/> ">
<input class="ststypeOption" name="ststypeOption" type="hidden" value="${param.ststypeOption }">
<c:import url="/performance/pfRankingList.do">
	<c:param name="ststype" value="${param.ststypeOption }"></c:param>
	<c:param name="catecode" value=""></c:param>
	<c:param name="area" value="11"></c:param>
</c:import>
</form>


	</div>
	<!-- 시간 별 순위 끝 -->
	<hr class="hrhr">
	<!-- 연극 순위 시작 -->
	<div class="slide_container">
		<div class="myarea_select_wrap">
			<div class="ranking_div">
				<hr class="line_hr">
				<h2 class="text_h2">연극 순위</h2>
			</div>
		</div>
<form name="rankingList2" id="rankingList2"  action="<c:url value='/performance/pfRankingList.do'/> ">
<c:import url="/performance/pfRankingList.do">
	<c:param name="catecode" value="AAAA"></c:param>	
	<c:param name="area" value="11"></c:param>
</c:import>
</form>
	</div>
	<!--  연극 순위 끝 -->
	<hr class="hrhr">
	<!--  뮤지컬 순위 시작 -->
	<div class="slide_container">
		<div class="myarea_select_wrap">
			<div class="ranking_div">
				<hr class="line_hr">
				<h2 class="text_h2">뮤지컬 순위</h2>
			</div>
		</div>
<form name="rankingList3" id="rankingList3" action="<c:url value='/performance/pfRankingList.do'/> ">
<c:import url="/performance/pfRankingList.do">
	<c:param name="catecode" value="AAAB"></c:param>	
	<c:param name="area" value="11"></c:param>
</c:import>
</form>
	<!-- 뮤지컬 순위 끝 -->
		<hr class="hrhr">
	</div>
</div>

<script type="text/javascript" src="<c:url value='../resources/js/jquery-3.4.1.min.js'/>"></script>
<script>
var swiper = new Swiper('.swiper-container', {
    //loop: true,
    //prevButton: '.swiper-button-prev',
    //nextButton: '.swiper-button-next',
    slidesPerView: 5, //한 슬라이드에 나오는 이미지 개수
    spaceBetween: 20, //사이간격
    slidesPerColumn: 1, //열 개수
    slidesPerColumnFill: 'row',
    slidesPerGroup: 5,
    noSwiping: true,
    simulateTouch: false
}); 

$(function(){	
	$("#ststype").change(function(){
	   var ststypeOptionEl=$("#ststype option:selected").val(); 
	   $("form[name=optionForm]").children(".ststypeOption").val(ststypeOptionEl);
	   //$("form[name=rankingList1]").children(".ststypeOptionValue").val(ststypeOptionEl);
	   
		   $.ajax({
	    	     url:"<c:url value='/performance/pfRankingListChange.do'/>",
	        	 type:"POST",
	       		 data:{ "ststype": $("#ststype option:selected").val()},
	        	 success:function(res){
	        	    var str="";
	        	    var rlist=res.rlist;
	                var likeList=res.likeList;
	            	console.log(res);
	            	console.log(rlist);
	            	console.log(likeList);            
	             $("#ststype").append(str);
	             $.each(rlist,function(idx,value){
		               str+="<div class='swiper-slide' style='width: 292.4px; margin-right: 20px;'>"
		                     +"<div class='testImg' width='212px'>"
		                        +"<img src='http://www.kopis.or.kr/"+value.poster+"'"+"class='img-responsive'>"
		                        +"<div class='img-responsive-text'>"
		                           +"<a class='toDetail' href='<c:url value='/performance/pfDetail.do?perfomid="+value.mt20id+"'/>'>상세정보</a><br>"
		                           +"<span>예매율</span><br>"
		                           +"<span>누적관객수</span><br>"                                                            
		                              +"<div class='likeDiv'>"
		                              	+"<a class='likeBt' onClick='likeclick(this,\""+value.mt20id+"\",\""+value.prfnm+"\",\""+value.cate+"\");'>"
		                                    +"<img class='likePic' src='<c:url value='/resources/images/"+likeList[idx].IMG+"'/>'>"
		                                    +"<span class='pcount'>"+likeList[idx].COUNT+"</span>"
		                                 +"</a>"
		                              +"</div>"
		                        +"</div>"
		                        +"<h5><b>"+value.prfnm+"</b></h5>"
		                        +"<p>"+value.prfpd+"</p>"
		                        +"<p>"+value.cate+"</p>"
		                     +"</div>"
		                  +"</div>"
	               		if(idx==4) return false;
	            });
	            $(".swiper-wrapper:eq(0)").find(".swiper-slide").remove().end().append(str);
	         },
	         error:function(xhr, status, error){
	            alert("Error:"+status+","+error);
	         }
	         
	    	});		   
	 });
});

function likeclick(self,perfomid,performtitle,performtype){
    var pcountEl=$(self).find(".pcount");
    var likePicEl=$(self).find(".likePic");
    var ststypeOptionEl=$("#ststype option:selected").val();  
    console.log(ststypeOptionEl);

	$.ajax({
		      type:"post",
		      url:"<c:url value='/like.do'/>",
		      data:{ "perfomid": perfomid,
		      	 	 "performtitle": performtitle,
		             "performtype":performtype },
		      dataType:"json",
		      success:function(res){
		    	  	pcountEl.text(res.count);
		         	if(res.img=='like'){
			       		likePicEl.attr("src","<c:url value='/resources/images/like.png'/>");
			       		
			       	}else{
			            likePicEl.attr("src","<c:url value='/resources/images/like2.png'/>");
			       	}
		         	//location.href="<c:url value='/performance/pfRanking.do?ststypeOption="+ststypeOptionEl+"'/>";
		            $("form[name=optionForm]").hide().submit();
			  },
			  error:function(x,e){
		    	if(x.status==500){
    	        	alert("로그인해주세요.");
	            	location.href="<c:url value='/login/login.do' />";
	         	}
	      	 }  
	   	});
}
</script>
<%@ include file="../inc/main2Bottom.jsp" %>