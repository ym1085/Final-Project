<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("newLine", "\r\n");
%>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
        jQuery(document).ready(function() {
       	 $("td#ddd").each(function(){
       		 $(this).click(function(){
	       			$.ajax({
	    				type:"get",
	    				url:"<c:url value='/member/reviewDetail.do'/>",
	    				data:{"reviewSeq":$(this).find("#reviewSeq").val()},
	    				success:function(res){
	    					$(".reviewPoster>img").attr("src",res.poster);
	    					$("#reviewgenrenm").html(res.genrenm);
	    					$("#reviewTtile").html(res.prfnm);
	    					$("#performterm").html(res.prfpdfrom+"~"+res.prfpdto);
	    					
	    					$(".detailreview1").html(res.REVIEW_CONTENT);
	    					$(".detailreview2>#reviewregdate").html(res.REVIEW_REGDATE);
							
	    					switch (res.REVIEW_SCORE) {
							case 1:
								$(".detailreview2>#reviewstar").attr("src","<c:url value='/resources/images/star1.png' />");
								break;
							case 2:
								$(".detailreview2>#reviewstar").attr("src","<c:url value='/resources/images/star2.png' />");
								break;
							case 3:
								$(".detailreview2>#reviewstar").attr("src","<c:url value='/resources/images/star3.png' />");
								break;
							case 4:
								$(".detailreview2>#reviewstar").attr("src","<c:url value='/resources/images/star4.png' />");
								break;
							case 5:
								$(".detailreview2>#reviewstar").attr("src","<c:url value='/resources/images/star5.png' />");
								break;
							default:
								break;
							}
	    					
	    					if(res.REVIEW_TYPE==1){
	    						$(".reviewImg1>img").attr("src","");
	    					}else if(res.REVIEW_TYPE==2){
	    						$(".reviewImg1>img").attr("src","<c:url value='/resources/images/noimage.png'/>");
	    						if(res.REVIEW_P1!=null || res.REVIEW_P1.length<1){
	    	    					$("#reviewP1>img").attr("src","${pageContext.request.contextPath }/reviewupload/"+res.REVIEW_P1);
	    							}if(res.REVIEW_P2!=null || res.REVIEW_P2.length<1){
	    	    					$("#reviewP2>img").attr("src","${pageContext.request.contextPath }/reviewupload/"+res.REVIEW_P2);
	    							}if(res.REVIEW_P3!=null || res.REVIEW_P3.length<1){
	    	    					$("#reviewP3>img").attr("src","${pageContext.request.contextPath }/reviewupload/"+res.REVIEW_P3);
	    							}
	    					}
	    					
		    				$('#myModal2').show();
	    				},
	    				error:function(xhr, status, error){
	    					alert("Error : "+status+", "+ error);
	    				}
	    			});	 
       		 });
       	 });
       //팝업 Close 기능
       $("#dddd").click(function(){
            $('#myModal2').hide();
       	
       });
       });
        
</script>


<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit" style="margin-right: 100px;">후기</h2>
			
			<a class="mytitSub" href="<c:url value='/member/myreviewList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:350px">
					<col style="width:344px">
					<col style="width:275px">
					<col style="width:275px">
					<col style="width:140px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">내용</th>
						<th id="heading" scope="col">등록날짜</th>
						<th id="heading" scope="col">마일리지 지급</th>
						<th id="heading" scope="col">작성자</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty list }">
				<tr>
					<td colspan="4" style="text-align: center;">후기내역이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				<c:if test="${!empty list }">
				<c:forEach var="map" items="${list }">
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: left">
							<p class="mybodyP">(${map['PERFOMTYPE'] })${map['PRFNM'] }</p>
						</td>
						<td style="text-align: left;" id="ddd">
						<img style="height: 24px;" alt="" src="<c:url value='/resources/images/star${map["REVIEW_SCORE"] }.png' />">
						<p style="margin-left: 15px;">&nbsp;&nbsp; <fmt:formatDate value="${map['REVIEW_REGDATE'] }" pattern="yyyy-MM-dd" />&nbsp;&nbsp; | &nbsp;&nbsp; 승인완료(${map['REVIEW_MILEAGE'] }적립)</p>
						<p style="margin-top: 10px;">${fn:substring(map['REVIEW_TITLE'],0,15) }...</p><br>
						<c:set var="content" value="${fn:replace(map['REVIEW_CONTENT'], newLine,'<br>') }" />		
						<p>${fn:substring(content,0,20) }...</p>
						<input type="hidden" value="${map['REVIEW_SEQ'] }" id="reviewSeq">
						</td>
						<td style="text-align: center">${map['PAY_TICKET_NUMBER'] }</td>
						<td style="text-align: center">
						<c:if test="${map['REVIEW_TYPE']==1 }">
							일반
						</c:if>
						<c:if test="${map['REVIEW_TYPE']==2 }">
							포토
						</c:if>
						</td>
					</tr>
				<!-- 반복 끝-->
				</c:forEach>
				</c:if>
				</tbody>
			</table>		
		</div>	
	</section>
	<!-- The Modal -->
    <div id="myModal2" class="modal2">
 
      <!-- Modal content -->
      <div class="modal-content2"> 
      			<div class="reviewsodyd">
      				<div class="reviewPoster">
      				<img alt="" src="">
      				<p id="reviewgenrenm"></p>
      				<p id="reviewTtile"></p>
      				<p id="performterm"></p>
      				</div>
      				<div class="reviewsodyd2">
      					<div class="detailreview1"></div>
      					<p class="detailreview2">&nbsp;&nbsp;<img id="reviewstar" alt="후기평점" src="" /> &nbsp;&nbsp;|&nbsp;&nbsp; 작성일: <span id="reviewregdate"></span></p>
      				</div>
      			</div>
                <div class="reviewImg1" id="reviewP1"><img alt="" src="<c:url value='/resources/images/noimage.png' />"/></div>
                <div class="reviewImg1" id="reviewP2"><img alt="" src="<c:url value='/resources/images/noimage.png' />"/></div>
                <div class="reviewImg1" id="reviewP3"><img alt="" src="<c:url value='/resources/images/noimage.png' />"/></div>
            <div id="dddd" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
    <!--End Modal-->