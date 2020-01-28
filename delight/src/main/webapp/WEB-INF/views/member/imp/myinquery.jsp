<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
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
				<!-- 반복 시작-->
					<tr>
						<td style="text-align: center">1</td>
						<td style="text-align: center" id="sss">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">답변예정</td>
					</tr>
					
					<tr>
						<td style="text-align: center">2</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
					
					<tr>
						<td style="text-align: center">3</td>
						<td style="text-align: center">내용2</td>
						<td style="text-align: center">내용3</td>
						<td style="text-align: center">내용4</td>
					</tr>
				</tbody>
				<!-- 반복 끝-->
			</table>		
		</div>	
	</section>
	
	<!-- <input type="button" id="sss" style="margin: 50%;"> -->
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">제목넣어줘</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <div class="inq1" style="border-bottom: 1px solid gray;">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 서버 점검으로</span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">사이트 사용이 중지 됩니다.</span></p>
                </div>
                <div class="inq1">
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">이용에 불편을 드린 점 양해를 </span></p>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;">부탁드립니다.</span></p>
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