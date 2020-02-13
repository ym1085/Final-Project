<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.slide_container {width: 100%; padding: 0 15px;}
.testImg {text-align: center; width: 212px;}
.toDetail,.toDetail:hover { color : red; }
.swiper-slide{width: 212px; margin:20px; flex-shrink: unset;}
.swiper-wrapper{width: auto;}
.img-responsive {width: 212px; height: 240px;}
.img-responsive-text {opacity: 0; width: 212px; height: 240px; padding: 60px 20px; text-align: center; font-size: 18px; font-weight: bold; color: white; position: absolute; top: 38.5%; left: 45.5%; transform: translate(-50%, -50%);}
.img-responsive-text:hover {opacity: 1; background: rgba(0, 0, 0, 0.4);}
a {color: white;}
a:hover{text-decoration: none; color: white;}
p {color: #A2A2A2;}
b {margin: 1;padding:5px; overflow:hidden; display: block; color: #fe5c24; white-space:nowrap; text-align: center; text-overflow: ellipsis;}
</style>

	<div class="swiper-container">
		<div class="div_rank">
			<h1 class="text_h1"></h1>
		</div>
		<div class="swiper-wrapper">
			<c:forEach var="vo" items="${rlist }" end="4">
				<c:forEach var="map" items="${likeList }">
					<c:if test="${vo.mt20id==map['PERFOMID']}">
						<div class="swiper-slide">
							<div class="testImg">
								<img src="http://www.kopis.or.kr/${vo.poster }" class="img-responsive">
								<div class="img-responsive-text">
								<input type="hidden" class="rateNtotal" value="${vo.mt20id}">
								<!-- 마우스오버 영역 시작 -->
								<%--<a class='toDetail' href="<c:url value='/performance/pfDetail.do?perfomid=${vo.mt20id }'/>">상세정보</a><br> --%>
								<a class='toDetail' href="<c:url value='/recentInsert.do?perfomid=${vo.mt20id }'/>">상세정보</a><br>	
									<span>예매율</span><span class="rate"> </span><br>
									<span>누적관객수</span><span class="total"> </span><br>																				
										<!--  좋아요 영역 시작 -->
										<div class="likeDiv">
											<a class="likeBt" id="likeBt" onClick="likeclick(this,'${vo.mt20id}','${vo.prfnm}','${vo.cate}')">
												<img class="likePic" src="<c:url value='/resources/images/${map["IMG"] }'/>">
												<span class="pcount">${map['COUNT']}</span>
											</a>
										</div>
										<!-- 좋아요 영역 끝 -->
								<!-- 마우스오버 영역 끝 -->
								</div>
								<h5><b>${vo.prfnm }</b></h5>
								<p>${vo.prfpd }</p>
								<p>${vo.cate }</p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>