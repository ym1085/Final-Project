/**
 * js/member.js
 * 회원가입, 회원정보수정에서 사용
 */
var ctx = "/delight";

$(function(){
	//이메일 - 직접입력의 경우 텍스트박스가 보이도록
	$("#email2").change(function(){
		if($(this).val()=='etc'){
			$("#email3").val("");
			$("#email3").css("visibility","visible");
			$("#email3").focus();				
		}else{
			$("#email3").css("visibility","hidden");
		}
	});
	
	
	//생년월일 Date Picker UI사용
	$("#birth").datepicker({changeYear: true,dateFormat: "yy-mm-dd",
	       yearRange: "1900:2020",
	         dayNamesMin: ["일","월","화","수","목","금","토"],
	         monthNames: ["1월","2월","3월","4월","5월","6월",
	            "7월","8월","9월","10월","11월","12월"]});
	
	//중복확인 버튼 클릭- 아이디 중복확인 창 띄우기
	/*$("#btnChkId").click(function(){
		var userid=$("#userid").val();
		
		window.open(ctx+"/member/checkUserid.do?userid="+userid,"아이디 중복 확인",
			"width=450,height=300,left=450,top=350,location=yes,resizable=yes");
	});*/
	
	
	//비밀번호 중복 체크 
	$("#accordancePwd").hide();
	$("#discordPwd").hide();
	//아이디 정규식
	$("#accordanceId").hide();
	
	$("input").keyup(function(){
		var pwd1=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		var userid=$("#userid").val();
		
		if(pwd1!="" || pwd2!=""){
			if(pwd1==pwd2){
				$("#accordancePwd").show();
				$("#discordPwd").hide();
				$("#submit").removeAttr("disabled");
			}else {
				$("#accordancePwd").hide();
				$("#discordPwd").show();
				$("#submit").attr("disabled","disabled");
			}
		}else {	//공백일시
			$("#accordancePwd").hide();
			$("#discordPwd").hide();
			$("#submit").removeAttr("disabled");
		}
		
		//아이디 정규식
		if(userid.length!=''){
			if(!validate_usid($("#userid").val())){
				$("#accordanceId").show();
				$("#btnChkId").attr("disabled","disabled");	//중복체크 불가능
			}else {
				$("#accordanceId").hide();
				$("#btnChkId").removeAttr("disabled");
			}
		}else if(userid.length==''){
			$("#accordanceId").hide();
		}
	});
	 
	//폼 submit시 중복확인 체크. 
	$("form[name=frm]").submit(function(){
		if($("#chkId").val()=='N'){
			alert("아이디 중복확인을 하세요(필수)");
			$("#userid").focus();
			event.preventDefault();
		}if($("#chkEmail").val()=='N'){
			alert("이메일 인증 하세요!(필수)");
			$("#chkEmail").focus();
			event.preventDefault();
		}
	});

});

function validate_phone(ph){
	 var pattern=new RegExp(/^[0-9]*$/g);
	 return pattern.test(ph); //정규식과 일치하면 true
	 /*  정규식  /^[0-9]*$/g
	0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
	닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
	 */
}

function validate_userid(uid){
   var pattern= new RegExp(/^[a-zA-Z0-9_]+$/g);
   return pattern.test(uid);
   /*
   	정규식  /^[a-zA-Z0-9_]+$/g
	a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 
	끝나야 한다는 의미
	닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미
   */
}

//우편번호 API
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=address]').val(data.address);
			$('[name=addressDetail]').val(data.buildingName);
		}
	}).open();
}

//정규식(ID)
function validate_usid(userid){
	var idReg = new RegExp(/^[A-za-z0-9]{5,15}$/g);
	return idReg.test(userid);
	//영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 끝날때 영문 대문자 또는 소문자 또는 숫자
}

