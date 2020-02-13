<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
	
	$(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp92846846'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
		
        //일반회원
        //-> 배포할때 지울겁니다 지우지마세요.
        var userid = "${userid}";
        //alert(userid);
      
       	var ticketPriceSubmitUser = "${ticketPriceSubmitUser}";		//유저가 선택한 티켓가격의 총 합
       	var perfomid = 				"${perfomid}";					//pfDetail부터 넘겨 받은 공연ID
       	var perfomfacilityid = 		"${perfomfacilityid}";			//pfDetail부터 넘겨 받은 공연시설ID
       	var perfomdate = 			"${perfomdate}";				//tkVo.perfomdate부터 얻어온 공연 날짜 -> SEQ로 SQL문 작성 후 얻어온 값 -> 내가 선택한 날짜와 같음
       	var perfomtime = 			"${perfomtime}";				//tkVo.perfomtime부터 얻어온 공연 시간 -> SEQ로 SQL문 작성 후 얻어온 값 -> 내가 선택한 시간과 같음
       	var perfomplace = 			"${perfomplace}";				//tkVo.perfomplace부터 얻어온 공연 장소 -> SEQ로 SQL문 작성 후 얻어온 값 
       	var perfomtitle = 			"${perfomtitle}";				//tkVo.perfomtitle부터 얻어온 공연명 -> SEQ로 SQL문 작성 후 얻어온 값
       	var perfomtype = 			"${perfomtype}";				//공연타입
       	var username = 				"${username}";					//유저가 선택한 티켓의 총 장수를 구한 합
       	var useremail = 			"${useremail}";					//예매자명
       	var username2 = 			"${username2}";					//예매자 이메일
       	var useremail2 = 			"${useremail2}";				//관람자명
       	var ticketSeat = 			"${ticketSeat}";				//관람자 이메일
       	var ticketSeq = 			"${ticketSeq}";   				//선택된 티켓의 좌석 등급 -> TICKET_SEQ활용 데이터 뽑아왔을거임
       	var ticketCount = 			"${ticketCount}";				//티켓 SEQ
       	var mileagePoint = 			"${mileagePoint}";				//마일리지 체크
       	
       	//디버깅 -> 배포할때 지울겁니다 지우지마세요.
       	/* alert("티켓 총액 값 : "+ticketPriceSubmitUser+"\n공연 id : "+perfomid+"\n공연 시설 id : "+perfomfacilityid+"\nticketVo_공연일자 : "+perfomdate
       			+"\nticketVo=공연시간 : "+perfomtime+"\n공연 장소 : "+perfomplace+"\n공연제목 : "+perfomtitle+"\n공연 타입 : "+perfomtype+"\n예매자명 : "+username
       			+"\n예매자 이메일 : "+useremail+"\n관람자명 : "+username2+"\n관람자 이메일 : "+useremail2+"\n티켓 수량 SEQ : "+ticketSeq+"\n판매하는 표 좌석등급 : "+ticketSeat+
       			"\n선택된 티켓 수량 : "+ticketCount+"\n로그인 된 유저 id : "+userid+"\n유저의 마일리지 값 : "+mileagePoint); */
       
        
        IMP.request_pay({
        	
        	//[간편결제]페이코로 설정하세요
            pg : 'payco',			
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),	
            name : 'DELIGHT 티켓 예매 결제',
            amount : 			'151',						//${ticketPriceSubmitUser}	 	
            buyer_email : 		'${memberVo.email1}',		//회원 이메일		
            buyer_name : 		'${memberVo.username}',		//회원 이름
            buyer_tel : 		'${hp}',					//회원 전화번호 
            buyer_addr : 		'${memberVo.address}',		//회원 주소
            buyer_postcode : 	'${memberVo.zipcode}',		//회원 우편번호 주소
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if (everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                       	msg = "아직 제대로 결제가 되지 않았습니다.";
                        alert(msg);
                    }
                });
                
                //성공시 이동할 페이지
                //페이코 우리은행으로 무통장입금 계좌 발급 받을 시 오류 날 수 있습니다.
                alert("결제가 완료되었습니다!");
                location.href="<c:url value='/payment/showPaymentendUser.do?mt20id=${perfomid}&mt10id=${perfomfacilityid}&prfnm=${perfomtitle}&perfomtype=${perfomtype}&select_date=${perfomdate}&select_time=${perfomtime}&booking=${ticketCount}&seat_class=${ticketSeat}&userid=${userid}&useremail=${useremail}&ticket_seq=${ticketSeq}&pay_price=${ticketPriceSubmitUser}&username=${username}&username2=${username2}&useremail2=${useremail2}&perfomplace=${perfomplace}&hp=${hp}&mileagePoint=${mileagePoint}'/>";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                //실패시 이동할 페이지
                //이 부분은 만지지 마세요
                location.href="<c:url value='/performance/pfReservation.do?ticketSeq=${ticketSeq}&mt20id=${perfomid}&mt10id=${perfomfacilityid}&prfnm=${perfomtitle}&perfomtitle=${perfomtype}&fcltynm=${perfomplace}&genrenm=${perfomtype}'/>";
                alert(msg);
           
            	<%-- <%=request.getContextPath()%> --%>
            }
        });
        
    });
    </script>
</body>
</html>