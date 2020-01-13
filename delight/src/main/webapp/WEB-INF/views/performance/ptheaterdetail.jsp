<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f040d72093635e25310b0e130983fccf"></script>
<script type="text/javascript" src="<c:url value='resources/js/map.js'/>">
</script>
<form id="frmtheaterdetail" method="GET" action="<c:url value='/performance/pdetail.do'/>">
			<c:if test="${empty clist }">
				<td>좌표 데이터가 없습니다</td>
			</c:if>
			
			<c:if test="${!empty clist }">
				<!-- 반복 시작 -->
				<c:forEach var="vo" items="${clist }">
	<section class="sample-text-area">
		<div class="whole-wrap">
			<div class="container box_1170">
				<div class="section-top-border">
					<div class="row">
						<div class="col-md-2">
							<div class="mt-3" align="center">
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-md-12">
							<div class="row">
								<div class="col-md-4 col-md-6"><h4>시설명</h4></div>
								<div class="col-md-4 col-md-6"><h4>${vo.fcltynm}</h4></div>							
							</div>
							<div class="row">
								<div class="col-md-4 col-md-6"><h4>주소</h4></div>
								<div class="col-md-4 col-md-6"><h4>${vo.adres}</h4></div>							
							</div>
							<div class="row">
								<div class="col-md-4 col-md-6"><h4>연락처</h4></div>
								<div class="col-md-4 col-md-6"><h4>${vo.telno}</h4></div>							
							</div>
							<div class="row">
								<div class="col-md-4 col-md-6"><h4>웹사이트</h4></div>
								<div class="col-md-4 col-md-6"><h4>${vo.relateurl}</h4></div>							
							</div>
							<div class="row">
								<div class="col-md-10">
								<div id="map" style="width:800px;height:300px;">
										<input type="hidden" value="${vo.la}" id="x">
										<input type="hidden" value="${vo.lo}" id="y">
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f040d72093635e25310b0e130983fccf"></script>
									<script>
										var container = document.getElementById('map');
										var x=document.getElementById('x').value;
										var y=document.getElementById('y').value;
										var options = {
											center: new kakao.maps.LatLng( x, y ),
											level: 3
										};
										var map = new kakao.maps.Map(container, options);
								</script>	
							</div>
							</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		</c:forEach>
	</c:if>			
</form>