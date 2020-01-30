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
		
       
        //[1]맴버쉽 구매 -> 일반회원만 가능
        //[2]유저 ID 테이블에 셋팅
        var userid = "${userid}";
        var email = "${email}";
        var hp = "${hp}";
        alert(userid+"\n"+email+"\n"+hp);
       	
        IMP.request_pay({
        	
        	//[간편결제]페이코로 설정하세요
            pg : 'payco',			
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),	
            name : 'DELIGHT 티켓 예매 결제',
            amount : 			'50000',																		 	
            buyer_email : 		'${email}',						
            buyer_name : 		'${memberVo.username}',					
            buyer_tel : 		'${hp}',						
            buyer_addr : 		'${memberVo.address}',			
            buyer_postcode : 	'${memberVo.zipcode}',		
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
                alert("맴버쉽 결제가 완료되었습니다!");
                
                //일단 길어도 좀 찾아주시고 불편하신분은 내려서 하시면 됩니다.
                location.href="<c:url value='/member/buyMembershipUser.do?userid=${userid}&name=${name}&detail=${detail}'/>";
                
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                //실패시 이동할 페이지
                //이 부분은 만지지 마세요
                location.href="<c:url value='/index.do'/>";
                alert(msg);
           
            	<%-- <%=request.getContextPath()%> --%>
            }
        });
        
    });
    </script>
</body>
</html>