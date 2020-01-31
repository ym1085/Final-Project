<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../inc/adminTop.jsp" %>

<div class="content-wrapper">
	<div id="frmdiv">
		<form name="searchFrm">
		<input type="hidden" value="1" name="curPage" id="curPage">
		<input type="hidden" value="0" name="totalP" id="totalP">
		<span>장르</span>
		<select id="type" name="type">
			<option value="">장르 선택</option>
			<option value="AAAA">연극</option>
			<option value="AAAB">뮤지컬</option>
		</select>
		 
		<c:import url="/inc/inc_area.do"></c:import>
		 
		<span>시작일</span>
		<input type="text" id="stdate" name="stdate">
		 
		<span>종료일</span>
		<input type="text" id="eddate" name="eddate">
		
		<span>공연명</span>
		<input type="text" id="perfomName" name="perfomName">
		
		<button type="submit">검색</button>
		</form>
	</div>
	<div class="card" id="tableparent">
		<div id="tablediv" class="card-body">
			<table class="table text-center table-bordered">
			<colgroup>
				<col style="width: 50%;">
				<col style="width: 20%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
			</colgroup>
				<thead class="table-danger font-weight-bold">
					<tr>
						<th>공연명</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<tr>
						<td colspan="4">검색 후 이용 가능합니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="pagediv" class="text-center">
			<div class="btn-group" role="group" id="pagedesk">
				
			</div>
		</div>
	</div>
</div>
<div id="variablebox">
	<input type="hidden" id="blocksize" value="5">
	<input type="hidden" id="firstpage">
	<input type="hidden" id="lastpage" value="0">
	<input type="hidden" id="stype">
	<input type="hidden" id="ssido">
	<input type="hidden" id="sgugun">
	<input type="hidden" id="sstdate">
	<input type="hidden" id="seddate">
	<input type="hidden" id="sperfomName">
</div>

<%@include file="../inc/adminBottom.jsp" %>
<style type="text/css">
form[name=searchFrm] :not(span){
	margin-left: 20px;
	margin-right: 20px;
}
form[name=searchFrm] span{
	padding-top: 10px;
}
form[name=searchFrm] button{
	margin: 0;
	margin-top: 0.3%;
}
form[name=searchFrm]{
	overflow: hidden;
}
#frmdiv{
	padding: 0 2% 0 2%;
}
#tableparent{
	margin-top: 20px;
	height: 100%;
}
#tablediv table{
	height: 100%;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>" ></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>">
<script type="text/javascript">
$(function() {
	$("#salesManagement").addClass("active");
	$("#sell").addClass("show");
	$("form[name=searchFrm] span").addClass("font-weight-bold");
	$("form[name=searchFrm]").addClass("text-center");
	$("form[name=searchFrm] *").addClass("text-dark");
	$("form[name=searchFrm] select").addClass("form-control");
	$("form[name=searchFrm] select").addClass("form-control-sm");
	$("form[name=searchFrm] input").addClass("form-control");
	$("form[name=searchFrm] input").addClass("form-control-sm");
	$("form[name=searchFrm] button").addClass("btn btn-inverse-success btn-fw btn-sm");
	$("form[name=searchFrm] select").css("width","150px");
	$("form[name=searchFrm] #gugun").css("width","190px");
	$("form[name=searchFrm] input").css("width","100px");
	$("form[name=searchFrm] *").css("float","left");
	
	$("#stdate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	
	$("#eddate").datepicker({changeYear: true,dateFormat: "yymmdd",
		maxDate: "+1m +15d",
		minDate: "-1m",
		showOtherMonths: true,
		dayNamesMin: ["일","월","화","수","목","금","토"],
		monthNames: ["1월","2월","3월","4월","5월","6월",
			"7월","8월","9월","10월","11월","12월"]});
	
	$("form[name=searchFrm]").submit(function(){
		event.preventDefault();
		if($("#type option:selected").val()==''){
			alert("장르를 선택하시기 바랍니다.");
			$("#type").focus();
			event.preventDefault();
		}else if($("#stdate").val()==''){
			alert("시작일을 선택하시기 바랍니다.");
			$("#stdate").focus();
			event.preventDefault();
		}else if($("#eddate").val()==''){
			alert("종료일을 선택하시기 바랍니다.");
			$("#eddate").focus();
			event.preventDefault();
		}else{
			$("#curPage").val("1");
			$("#totalP").val("0");
			getList();
		}
	});
	
	
	
	
});

function gopage(i){
	if($("#stype").val()!=$("#type option:selected").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else if($("#ssido").val()!=$("#sido option:selected").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else if($("#sgugun").val()!=$("#gugun option:selected").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else if($("#sstdate").val()!=$("#stdate").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else if($("#seddate").val()!=$("#eddate").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else if($("#sperfomName").val()!=$("#perfomName").val()){
		alert("검색조건이 변경되었습니다. 다시 검색해주세요.");
	}else{
		
		$("#curPage").val(i);
		getList();
	}
}

var ing="<tr><td colspan='4'>검색 중입니다. 잠시만 기다려주세요.</td></tr>";

function openDetail(id){
	window.open("/delight/admin/salesManagement/settingDetail.do?perfomid="+id,"detail",
	"width=800,height=900,left=0,top=0,location=yes,resizable=yes");
}


function getList(){
	$("tbody").find("tr").remove().end().append(ing);
	$("#pagediv").find("#pagedesk *").remove();
	$.ajax({
		url:"<c:url value='/admin/salesManagement/ticketsetting.do'/>",
		type:"post",
		data: /* type : $("#type option:selected").val(),
			   sido : $("#sido option:selected").val(),
			   gugun: $("#gugun option:selected").val(),
			   stdate:$("#stdate").val(),
			   eddate:$("#eddate").val(),
			   perfomName:$("#perfomName").val() */
			   $("form[name=searchFrm]").serialize(),
			   
		dataType:"json",
		success:function(res){
			var li=res.list;
			var pageCount=res.cnt;
			$("#totalP").val(pageCount);
			var str="";

			$.each(li,function(idx,value){
				str+="<tr><td><a href='#' onclick=openDetail('"+value.mt20id+"') >"+value.prfnm
				+"</a></td><td>"+value.prfpdfrom
				+"</td><td>"+value.prfpdto+"</td><td>"
				+value.prfstate+"</td></tr>"
			});
			$("tbody").find("tr").remove().end().append(str);
			
			//paging
			var cpage=$("#curPage").val();
			var bsize=$("#blocksize").val();
			var fpage=cpage-(cpage-1)%bsize;
			$("#firstpage").val(fpage);
			var lpage=fpage+(bsize-1);
			if(lpage>pageCount){
				lpage=pageCount;
			}
			$("#lastpage").val(lpage);
			var pa="";
			
			//이전 블럭 버튼
			if(fpage>1){
				pa+="<button type='button' class='btn btn-social-icon btn-outline-youtube' onclick=gopage("+(fpage-1)+")> &lt;&lt;</button>";
			}
			
			//페이지 번호
				for(var i=fpage;i<=lpage;i++){
					if(i==cpage){
						pa+="<span class='btn btn-success'>"+i+"</span>";
					}else{
						pa+="<input type='button' value='"+i+"' class='btn btn-danger pgo' onclick=gopage("+i+")>";
					}
				}
			
			//다음 블럭 버튼
			if(lpage<pageCount){
				pa+="<button type='button' class='btn btn-social-icon btn-outline-youtube' onclick=gopage("+(lpage+1)+")> &gt;&gt;</button>";
			}
				
			
				$("#stype").val($("#type option:selected").val());
				$("#ssido").val($("#sido option:selected").val());

				$("#sstdate").val($("#stdate").val());
				$("#seddate").val($("#eddate").val());
				$("#sperfomName").val($("#perfomName").val());
			
				$("#pagediv").find("#pagedesk *").remove();
				$("#pagedesk").append(pa);

		},
		error:function(xhr, status, error){
			//alert("검색결과가 없습니다.");
			var er="<tr><td colspan='4'>검색 조건 결과가 없습니다.</td></tr>";
			$("tbody").find("tr").remove().end().append(er);
		}
	});//ajax 끝
}

</script>