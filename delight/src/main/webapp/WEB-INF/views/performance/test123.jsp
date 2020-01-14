<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/tab_resources/csss/style.css' />" />

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui.min.css' />">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>

<script type="text/javascript">
		$(function(){
			//faq slider
			
			$("#tabs").tabs();
			
			$(".faq-q").on("click", function(){
				var $q = $(this);
				var $ct = $(this).next(".faq-a");
				$(".faq-a").not($ct).slideUp('fast', function(){
					$(".faq-q").not($q).removeClass("on");
				});
				$q.toggleClass("on");
				$ct.stop().slideToggle('fast');
			});
		});
		
</script>

<style type="text/css">
#aa{
	margin: 5px;
	color: white;
}
#uls{
	width: 64%;
	margin-left: 18%;
	background: white;
	border: 0;
}
#tabs-1,#tabs-2,#tabs-3,#tabs-4{
	padding-top: 0;
}
.board-wrap{
	padding-top: 5px;
}
#ll a{
	width: 150px;
	text-align: center;
	height: 35px;
	font-size: 1.2em;
	font-weight: bold;
}
#ll{
	padding-top: 5px;
	margin-left: 10px;
}
</style>
</head>
<body>
<div id="tabs">
  <ul id="uls">
    <li id="ll"><a href="#tabs-1">가입</a></li>
    <li id="ll"><a href="#tabs-2">조사</a></li>
    <li id="ll"><a href="#tabs-3">적립금</a></li>
    <li id="ll"><a href="#tabs-4">기타</a></li>
  </ul>
  <div id="tabs-1">
    <div id="wrap">
	<div class="inner">
		<!-- Board wrap -->
			<div class="board-wrap">
				<!-- 일반 게시판 리스트 -->
				<div class="faq-list">

					<h3 class="faq-q">패널이란 무엇인가요?</h3>
					<div class="faq-a">
						<hr>
						패널이란, PICKS의 조사에 참여하실 수 있는 회원을 의미합니다.<br>
						PICKS 패널이 되시면 온라인 조사에 참여하실 수 있습니다.<br>
						회원 가입은 당연히 무료이며, 조사에 참여하시면 저희 PICKS에서 소정의 답례(적립금)을 드립니다.<br>
						<br>
						조사 참여는 본인이 가능한 시간과 상황에 따라 선택하실 수 있으며, 참여하지 않으셔도 불이익이 없습니다.<br>
						또한 패널님께 어떠한 마케팅이나 대금 지급 등의 요구 사항은 일체 없습니다.
					</div>
					
					<h3 class="faq-q">패널 가입은 어떻게 하나요?</h3>
					<div class="faq-a">
						<hr>
						패널은 인터넷으로만 가입이 가능하며,가입 후 홈 화면에있는 설문참여 목록을 확인하시면 조사에 참여하실 수 있습니다.<br>

						가입 관련 문의사항이 있으신 경우 고객센터 상단 중앙 1:1문의 등록해주시면(평일 오전 10:00 ~오후 6:00)신속히 처리해 드리겠습니다.
					</div>
					
					<h3 class="faq-q">가입할 때 이름(생년월일,성별)을 잘못 적었습니다.</h3>
					<div class="faq-a">
						<hr>
						가입 시 안내드린 바와 같이 실명정보(이름, 생년월일, 성별)은 수정할 수 없습니다.<br>
						탈퇴 후 재가입을 해주셔야 합니다.
					</div>
					
					<h3 class="faq-q">회원정보를 변경하려면 어떻게 해야 하나요?</h3>
					<div class="faq-a">
						<hr>
						패널님의 정보를 변경하시려면, 로그인 후 마이페이지>회원정보 수정 에서 원하시는 부분을 변경한 후 수정 버튼을 클릭하시면 패널 정보가 변경됩니다.<br>
						단 정회원이라도 아이디 및 이름, 생년월일, 성별 등의 실명정보는 수정할 수 없습니다.<br><br>
						
						조사 및 경품은 패널파워에 등록된 정보를 기초로 제공되므로, 정보가 변경된 경우 꼭 수정을 해주시기 바랍니다.
					</div>
					
					<h3 class="faq-q">탈퇴는 어떻게 하나요?</h3>
					<div class="faq-a">
						<hr>
						로그인 하신 후, 마이페이지 > 회원탈퇴 에서 탈퇴하실 수 있습니다.<br>
						탈퇴는 본인이 직접 하셔야 하며,
						탈퇴를 하시면 보유하신 적립금과 지급 신청 중인 적립금 모두 소멸 되며, 소멸된 적립금은 복구되지 않습니다.
					</div>
				</div>
				<!-- END 가입 -->
			</div><!-- END Board wrap -->
	</div>

 </div><!--END Wrap-->
  </div>
  <div id="tabs-2">
  	 <div id="wrap">
	<div class="inner">
		<!-- Board wrap -->
			<div class="board-wrap">
				<!-- 일반 게시판 리스트 -->
				<div class="faq-list">

					<h3 class="faq-q">조사는 어디서 하나요?</h3>
					<div class="faq-a">
					<hr>
						조사는 메인화면에서 설문참여 버튼 혹은 목록을 누르시면 해당하는 설문에 참여 가능합니다.
					</div>
					
					<h3 class="faq-q">PICKS 는 주로 어떤 조사를 수행하나요?</h3>
					<div class="faq-a">
					<hr>
						PICKS 는 3가지 의 질문형식으로 여론조사, 마케팅조사, 해외조사 등 다양한 조사를 진행하고 있습니다.
					</div>
					
					<h3 class="faq-q">왜 모바일 조사가 없나요?</h3>
					<div class="faq-a">
					<hr>
						대부분의 조사 소요 시간이 길고, 스마트폰에서 참여 시 오답률이 높아 신뢰성이 떨어지기 때문에 PC와 노트북에서 진행하고 있습니다.
					</div>
					
					<h3 class="faq-q">익스플러에서 화면이 정상적으로 보이지 않습니다.</h3>
					<div class="faq-a">
					<hr>
						익스플로러 오류는 여러 가지 이유가 있을 수 있습니다.<br>
						저희가 직접 패널님의 컴퓨터 환경을 확인하지 못하기 때문에 정확한 원인을 파악하기 힘드나,<br>
						 일반적으로 보안 문제인 경우가 많습니다.<BR>
						 다른 인터넷 사용 혹은 F5를 눌러 진행 해보시기 바랍니다.
					</div>
					
					<h3 class="faq-q">일반유저도 설문을 작성할수있나요?</h3>
					<div class="faq-a">
					<hr>
						평균 설문자성은 기업 유저만 작성 하실수 있습니다.<BR>
						작성하실경우 적립금 을 충전하셔야 하며 더 상세한 정보를 원하시면<BR>
						 1:1문의 해주시면 빠르게 답변해드리도록 하겠습니다.
					</div>
				</div>
				<!-- END 일반 게시판 리스트 -->
			</div><!-- END Board wrap -->
	</div>

 </div><!--END Wrap-->
  </div>
  <div id="tabs-3">
   	 <div id="wrap">
	<div class="inner">
		<!-- Board wrap -->
			<div class="board-wrap">
				<!-- 일반 게시판 리스트 -->
				<div class="faq-list">
					<!-- <p class="no-ct">등록된 게시물이 없습니다.</p> -->

					<h3 class="faq-q">조사를 하면 적립금을 얼마 받을 수 있나요?</h3>
					<div class="faq-a">
						<hr>
						조사의 문항이나 난이도에 따라 적립금 금액이 다릅니다.<BR>
						조사에 참여하시기 전 예상 소요시간과 적립금을 안내하고 있으니,<BR>
						확인하시고 조사에 참여하시기 바랍니다.
					</div>
					
					<h3 class="faq-q">적립금은 현금으로 지급되나요?</h3>
					<div class="faq-a">
					<HR>
						적립금은 포인트의 개념으로, 모으신 적립금을 현금,으로 지급받으실 수 있습니다.<BR>
						적립금 10원 = 현금 10원입니다.<BR><br>

						<span style="color: red; font-weight: bold;">*3,000 원 부터 신청하실 수 있습니다.</span>
					</div>
					
					<h3 class="faq-q">적립금은 어떻게 모으나요?</h3>
					<div class="faq-a">
					<hr>
						적립금은 저희가 진행하는 설문조사나 이벤트에 참여해주신 패널님께 드리는 소정의 답례입니다.<br>
						저희가 진행하는 설문조사나 이벤트에 참여해주시면 해당 적립금을 받으실 수 있습니다.
					</div>
					
					<h3 class="faq-q">적립금은 어떻게 신청하나요?</h3>
					<div class="faq-a">
					<hr>
						적립금 지급 신청은 마이페이지 > 적립금신청하기 에서 신청하실 수 있습니다.<br>
						<br>
						단!! <span style="color: red; font-weight: bold;">*3,000 원 부터 신청하실 수 있습니다.</span>
					</div>
					
					<h3 class="faq-q">현금이체 신청 후 계좌를 변경해도 되나요?</h3>
					<div class="faq-a">
					<hr>
						적립금 신청은 저희측에서 관리 하기 때문에 저희가 승인 하기 바로전 계좌로 이체진행합니다.
					</div>
					
					<h3 class="faq-q">현금이체 예정일은 언제인가요?</h3>
					<div class="faq-a">
					<hr>
						현금이체는 한달에 2번 진행되고 있습니다.<br>
						<br>
						지금 예정일은 마이페이지>적립금 관리에서 지급내역확인을 통해 확인 하실 수 있습니다.
					</div>
					
					<h3 class="faq-q">현금이체 지급 시간은 어떻게 되나요?</h3>
					<div class="faq-a">
					<hr>
						현금 이체 적립금은 금융결제원을 통해 이체되며,<br>
						은행마다 입금시간에 차이가 있어 정확한 시간을 안내드리기 힘든 점 양해 부탁드립니다.
					</div>
					
					<h3 class="faq-q">현금이체 결과는 어디에서 확인할 수 있나요?</h3>
					<div class="faq-a">
					<hr>
						현금이체 결과는 이체 예정일에 공지사항에 안내해드리고 있습니다.
					</div>
					
					<h3 class="faq-q">이체받은 현금은 환불가능한가요?</h3>
					<div class="faq-a">
					<hr>
						현금이체한 적립금은 환불이 불가능합니다. 양해 부탁드립니다.
					</div>
					
				</div>
				<!-- END 일반 게시판 리스트 -->
			</div><!-- END Board wrap -->
	</div>

 </div><!--END Wrap-->
  </div>
   <div id="tabs-4">
   	 <div id="wrap">
	<div class="inner">
		<!-- Board wrap -->
			<div class="board-wrap">
				<!-- 일반 게시판 리스트 -->
				<div class="faq-list">
					<!-- <p class="no-ct">등록된 게시물이 없습니다.</p> -->

					<h3 class="faq-q">로그아웃 어떻게 하나요?</h3>
					<div class="faq-a">
					<hr>
						우측 상단 로그아웃 버튼을 누르시면됩니다.
					</div>
					
					<h3 class="faq-q">PICKS는 믿을 수 있는 회사인가요?</h3>
					<div class="faq-a">
					<HR>
						<span style="color: red; font-weight: bold; font-size: 1.3em;">저희 PICKS 는 2000년 부터 서비스를 시작한 국내 1위 온라인 리서치사 입니다.</span>
					</div>
					
				</div>
				<!-- END 일반 게시판 리스트 -->
			</div><!-- END Board wrap -->
	</div>

 </div><!--END Wrap-->
  </div>
	</div>
</body>
</html>