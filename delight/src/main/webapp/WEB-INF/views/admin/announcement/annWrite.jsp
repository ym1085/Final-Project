<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>

<div id="parent">
	<!-- 공지 작성 -->
		<div id="writediv" class="content-wrapper">
            <form name="write" id="write" method="post" action="<c:url value='/admin/announcement/annWrite.do'/>">
				<fieldset>
					<div>
						<label for="type">종류</label>
						<select id="type" name="annType">
							<option value="">공지 종류 선택</option>
							<option value="1">일반공지</option>
							<option value="2">이벤트공지</option>
						</select>
					</div>
					<br>
					<div>
						<label for="title">제목</label>
						<input type="text" name="annTitle" id="title" >
					</div>
					<div id="divdiv">
						<label for="bo_content">내용</label>
						<textarea id="bo_content" name="annContent"></textarea>
					</div>

					<div id="lastdiv">
						<button type="submit" class="btn btn-gradient-danger btn-rounded btn-fw">작성완료</button>
						<button id="v" type="button" class="btn btn-gradient-success btn-rounded btn-fw">미리보기</button>
					</div>
				</fieldset>
			</form>
		</div>
		<!-- 작성 미리 보기 -->
		<div class="content" id="viewdiv">
			
		</div>
</div>




<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
#writediv{
	width: 50%;
	float: left;
	height: 100%;
}
#viewdiv{
	width: 50%;
	float: left;
	padding: 44px 36px 44px 36px;
	overflow: scroll;
	
	height: 100%;
}
#viewdiv img{
	width: 100%;
}
#write{
	width: 100%;
	margin: 0 auto;
}
#write div{
	clear: both;
		border-bottom: 1px solid #eee;
		padding: 5px 0;
		margin: 0;
		overflow: auto;
}
#write label{
		width: 10%;
		float: left;
		text-align: right;
		padding: 3px 15px 0 0;
		clear: left;		
		font-weight: bold;
}
#bo_content{
	float: right;
	overflow: hidden;
	height: 500px;
}
#write fieldset{
	width: 90%;
		padding: 0;
		margin: 0 auto;
		border: 0;
		border-bottom: 2px solid #e2e2e2;
		}
#lastdiv{
	text-align: center;
}
#title{
	width: 70%;
}
#parent{
	height: 100%;
}
#viewdiv img{
	width: 100%;
	height: 100%;
}
</style>

<script type="text/javascript">
$(function() {
	$("#announcement").addClass("active");
	$("#ann").addClass("show");
	
	CKEDITOR.replace('bo_content',{height: '300', width: '99%',
		filebrowserUploadUrl: "<c:url value='/adm/fileupload.do'/>"	
	});
	
		var a=CKEDITOR.instances["bo_content"];
	$("#v").click(function(){
		
		$("#viewdiv").html(a.getData());
	});
	
	$("form[name=write]").submit(function() {
		var b=a.getData();
		if($("#type").val().length<1){
			alert("공지 타입을 선택하시기 바랍니다.");
			$("#type").focus();
			event.preventDefault();
		}else if(b==''){
			alert("내용을 입력하시기 바랍니다.");
			$("#bo_content").focus();
			event.preventDefault();
		}else if($("#title").val()==''){
			alert("제목을 입력하시기 바랍니다.");
			$("#title").focus();
			event.preventDefault();
		}
	});
	
});

</script>