<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
     
        jQuery(document).ready(function() {
        	 $("td#sss").each(function(){
        		 $(this).click(function(){
        			 alert($(this).find("#inqueSeq").val());
/* 	       			$.ajax({
	    				type:"get",
	    				url:"<c:url value='/inqueryDetail.do'/>",
	    				data:{"inquerySeq":$(this).find("#inqueSeq").val()},
	    				success:function(res){
 	    					if(res.inqueryCondition=='Y'){
	    						alert("답변예정입니다!");
	    					}else if(res.inqueryCondition=='N'){
		    					$("#inqcontent").html(res.inqueryContent);
		    					$("#inqtitle").html(res.inqueryTitle);
		    					$('#myModal').show();
	    					}
	    				},
	    				error:function(xhr, status, error){
	    					alert("Error : "+status+", "+ error);
	    				}
	    			});	 */
	               	
        		 });
        	 });
        //팝업 Close 기능
        $("#ssss").click(function(){
             $('#myModal').hide();
        	
        });
        });
        
</script>
<section class="mysec">
		<div class="mysecDiv">
			<h2 class="mytit">나의 문의내역</h2>
			
			<a class="mytitSubinq" href="<c:url value='/member/myinqueryList.do' />">전체</a>
			
			<table class="mytable">
				<colgroup>
					<col style="width:155px">
					<col style="width:647px">
					<col style="width:250px">
					<col style="width:347px">
				</colgroup>
			
				<thead>
					<tr>
						<th id="heading" scope="col">번호</th>
						<th id="heading" scope="col">제목</th>
						<th id="heading" scope="col">문의날짜</th>
						<th id="heading" scope="col">답변상태</th>
					</tr>
				</thead>
				
				<tbody id="mybody">
				<c:if test="${empty list }">
				<tr>
					<td style="text-align: center; " colspan="4">문의내역이 존재하지않습니다.</td>
				</tr>
				</c:if>
				<!-- 반복 시작-->
				<c:if test="${!empty list }">
					<c:forEach var="inqueVo" items="${list }">
					<c:set var="no" value="${no+1 }"></c:set>
					<tr>
						<td style="text-align: center">${no}</td>
						<td style="text-align: center" id="sss">
						<input type="hidden" id="inqueSeq" value="${inqueVo.inquerySeq }">
						<span>${inqueVo.inqueryTitle }</span>
						</td>
						<td style="text-align: center">
						<fmt:formatDate value="${inqueVo.regDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td style="text-align: center;color:red;">
						<c:if test="${inqueVo.inqueryCondition=='N' }">
							답변예정
						</c:if>
						<c:if test="${inqueVo.inqueryCondition=='Y' }">
							<span style="color: black;">답변완료</span>
						</c:if>
						</td>
					</tr> 
					</c:forEach>
				</c:if>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">제목넣어줘</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <div class="inq1" style="border-bottom: 1px solid gray;">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">문의내용</span></p>
                </div>
                <div class="inq1">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">답변내용</span></p>
                </div>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
            <div id="ssss" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
    <!--End Modal-->