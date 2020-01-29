<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	

<script type="text/javascript">
	var ctx = "/delight";
	
	$(function(){
		$("form[name=frm123]").submit(function(){
			var email=$("#email").val();
			var cnt=email.search("@");
			var idxo=email.indexOf("@");
			var sub=email.substring(idxo+1);
			
			if($("#name").val().length<1){
				alert("이름을 입력해주세요");
				$("#name").focus();
				event.preventDefault();
			}else if(email.length<1){
				alert("이메일 을 입력해주세요");
				$("#email").focus();
				event.preventDefault();
			}else if(cnt==-1 && email!=''){
				alert("올바르지않는 이메일형식입니다.");
				$("#email").focus();
				event.preventDefault();
			}else if(email!='' && sub==''){
				alert("올바르지않는 이메일형식입니다.");
				$("#email").focus();
				event.preventDefault();
			}else if($("#hp").val().length<1){
				alert("핸드폰 번호 를 입력해주세요");
				$("#hp").focus();
				event.preventDefault();
			}else if($("#title").val().length<1){
				alert("제목을 입력해주세요");
				$("#title").focus();
				event.preventDefault();
			}else if($("#content").val().length<1){
				alert("내용을 입력해주세요");
				$("#content").focus();
				event.preventDefault();
			}else{
				event.preventDefault();
    			$.ajax({
    				type:"post",
    				url:"<c:url value='/inqueryWrite.do'/>",
    				data:$("form[name=frm123]").serializeArray(),
    				success:function(res){
    					if(res=='Y'){
      						$("#title").val("");
    						$("#content").val("");
    						if(!confirm("문의가등록되었습니다.문의내역으로 이동하시겠습니까?")){
    							event.preventDefault();
    						}else{
    							location="<c:url value='/member/myinqueryList.do' />";
    						}  
    					}else if(res=='N'){
    						alert("문의가발송되었습니다.");
     						$("#name").val("");
    						$("#email").val("");
    						$("#hp").val("");
    						$("#title").val("");
    						$("#cotent").val(""); 
    					}
    				},
    				error:function(xhr, status, error){
    					alert("Error : "+status+", "+ error);
    				}
    			});	
			}
		});
	
		/* $("#buymembership2").click(function(){
			window.open(ctx+"/member/mymemberShip.do","맴버십 구입",
			"width=550,height=450,left=600,top=350,location=yes,resizable=yes");
		}); */
		
	});
</script>
<style type="text/css">
div.inqinfo1 {
    font-size: 0.9em;
    margin-left: 22px;
    margin-bottom: 11px;
}
div.inqinfo1>.inqinfospan {
    color: red;
    font-weight: bold;
}

div#buymembershipParent {
    width: 285px;
    height: 28px;
}

p#buymembership1 {
    float: left;
    padding-left: 72px;
}

button#sss {
    float: left;
    width: 84px;
    background-color: #fd0000;
    border-color: red;
    color: white;
    font-weight: 500;
    margin-top: 7px;
    font-family: fantasy;
}

#buymembershipParent2{
	width: 285px;
    height: 28px;
}

#buymembership3{
	float: left;
    padding-left: 72px;
}

.w3-white, .w3-hover-green:hover {
    color: white!important;
    background-color: white!important;
    margin-left: 25%;
    border: 0.3px solid lightgray;
}

.w3-section, .w3-code {
    margin-top: 26px!important;
    margin-bottom: 16px!important;
}

.w3-container.w3-padding-16 {
    text-align: right;
}
</style>
    <!-- 로그인 안된경우 (시작)-->
			<c:if test="${empty sessionScope.userid }">
				<div id="q1">
					<button type="button" class="btn btn-success btn-lg"
					onClick="location.href='<c:url value="/login/login.do" />'">로그인</button>
					<button type="button" class="btn btn-secondary btn-lg"
					onClick="location.href='<c:url value="/login/findPwd.do" />'">비밀번호 찾기</button>
				</div>
				<div id="q2">
					<button type="button" class="btn btn-secondary btn-lg" id="topLogin"
					onClick="location.href='<c:url value="/member/register.do" />'">회원가입</button>
				</div>
			<div id="q3">
			<ul>
				<li>문의하기</li>
			</ul>
			<div style="border: 1px dotted white; width: 100%; margin-top: 11%;"></div>
			</div>
			<div class="inqinfo1">
			<span>*문의답변은 이메일로 발송해드립니다<br>(회원일경우 문의내역에서도 확인가능)</span>
			</div>
			<form name="frm123">
				<div class="right_list">
					<input type="text" id="name" placeholder="이름" name="username"><br>
					<input type="text" id="email" placeholder="이메일" name="email"><br>
					<input type="text" id="hp" placeholder="연락처(- 같이입력해주세요)" name="hp"><br>
					<input type="text" id="title" placeholder="제목" name="inqueryTitle"><br>
					<textarea rows="20" cols="32" id="content" placeholder="내용" name="inqueryContent"></textarea>
				</div>
				<input type="submit" class="btn btn-secondary btn-lg" value="보내기" id="SideQnA">
			</form>
			</c:if>
			<!-- 로그인 안된경우 (끝)-->
			
			<!-- 로그된경우 (시작)-->
			<c:if test="${!empty sessionScope.userid }">
				<br>
				<div id="q2" style="color: white;">
					<p><span style="font-weight: bold;font-size: 1.4em;color: white">*${memberVo.username }</span> 님 어서오세요.</p><br>
					<p>*마일리지 : <fmt:formatNumber value="${memberVo.mileagePoint }" pattern="#,###" /> 원</p>
					<p>*멤버십 등급 : ${memberVo.gradeName }</p>
					<p>*가입일 : <fmt:formatDate value="${memberVo.joinDate }" pattern="yyyy-MM-dd"/></p>
					
					<c:if test="${empty memberShipMap['NAME'] }">
						<div id="buymembershipParent">
							<p id="buymembership1" >*회원권  : </p>
							<button style="font-size: 8px;" id="sss" onclick="document.getElementById('id01').style.display='block'">회원권 구매</button>
						</div>
					</c:if>
					
					<c:if test="${!empty memberShipMap['NAME'] }">
						<div id="buymembershipParent2">
							<p id="buymembership3">*회원권  : ${memberShipMap['NAME']}</p>
						</div>
					</c:if>
				</div>
			
				<!-- 추가 부분 by 김영민 -->
					 <!-- <button  class="w3-button w3-green w3-large">Login</button>--> 
					  <div id="id01" class="w3-modal">
					    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:500px;height: 400px;">
					
					      <form class="w3-container" action="/action_page.php">
					        <div class="w3-section">
					          <button style="width: 250px;height: 250px;" class="w3-button w3-white w3-section" type="submit">
					          		<span id="">DELIGHT_MEMBERSHIP</span>
					          		<br><br>
					         		
					         		<span id="">[1] 회원권 이름<br></span><br>
									<span id="">DELIGHTMEMBERSHIP</span>
					          		<br>
					         		
					         		<span id="">[2] 혜택</span><br>
					         		<span id="">시즌동안 추가 10% 할인</span>
					          		<br>
					         		
					         		<span id="">시작일</span><br>
					         		<span>시작일 들어옴</span>
					          		<span id="">마감일</span><br>
					          		<span>마감일 들어옴</span>
					          		<br>
					         		
					         		<span id="">
					          			
					          		</span>
					          </button>
					        </div>
					      </form>
					
					      <div style="background-color:white; border-top: 0;" class="w3-container w3-padding-16">
					        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">취소</button>
					      </div>
					    </div>
					  </div>
				<!--  -->			
			
				<div id="q1">
					<button type="button" class="btn btn-success btn-lg"
					onClick="location.href='<c:url value="/member/myPage.do" />'">마이페이지</button>
					<button type="button" class="btn btn-secondary btn-lg"
					onClick="location.href='<c:url value="/login/logout.do" />'">로그아웃</button>
				</div>
				
			<div id="q3">
			<ul>
				<li style="color:white;">문의하기</li>
			</ul>
			<div style="border: 1px dotted white; width: 100%; margin-top: 11%;"></div>
			</div>
			<div class="inqinfo1">
			<span class="inqinfospan">*문의답변은 이메일로 발송해드립니다<br>(회원일경우 문의내역에서도 확인가능)</span>
			</div>
			<form name="frm123">
				<div class="right_list">
					<input style="color:white;" type="text" id="name" placeholder="이름" name="username" value="${memberVo.username }"><br>
					<input style="color:white;" type="text" id="email" placeholder="이메일" name="email" value="${memberVo.email1 }@${memberVo.email2}"><br>
					<input style="color:white;" type="text" id="hp" placeholder="연락처(- 같이입력해주세요)" name="hp" maxlength="13" value="${memberVo.hp1 }-${memberVo.hp2 }-${memberVo.hp3 }"><br>
					<input style="color:white;" type="text" id="title" placeholder="제목" name="inqueryTitle"><br>
					<textarea style="color:white;" rows="20" cols="32" id="content" placeholder="내용" name="inqueryContent"></textarea>
				</div>
				<input type="submit" class="btn btn-secondary btn-lg" value="보내기" id="SideQnA">
				</form>
			</c:if>
			<!-- 로그된경우 (끝)-->