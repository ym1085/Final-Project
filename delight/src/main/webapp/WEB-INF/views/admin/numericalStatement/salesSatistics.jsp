<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/adminTop.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<div class="content-wrapper">
	<div class="card">
		<div class="card-body">
			<div id="chart1">
			
			</div>
		</div>
	</div>
	<hr>
	<div class="card">
		<div class="card-body">
			<div id="chart2">
			
			</div>
		</div>
	</div>
	
</div>

<%@include file="../inc/adminBottom.jsp" %>

<script type="text/javascript">
$(function() {
	$("#chartPart").addClass("active");
	$("#chart").addClass("show");
	
	$.ajax({
		url: "<c:url value='/admin/numericalStatement/daysales.do'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			//alert(res);
			var con=[];
			var val=[];
			$.each(res,function(idx,value){
				con.push(value.day);
				val.push(value.totalsales);
			})
			//alert(con);
			//alert(val);
			Highcharts.chart('chart1', {
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '일별 매출'
		        },
		        xAxis: {
		        	title: {
		                text: '일'
		            },
		            categories: con,
		        },
		        yAxis: {
		            title: {
		                text: '매출액'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#080927'
		            }]
		        },
		        series: [{
		            name: '매출',
		            data: val
		        }],
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        tooltip: {
		            valueSuffix: '원'
		        },
		        credits: {
		            enabled: false
		        }
		    });
		},
		error:function(xhr,status,error){
			alert("Error : "+status+", "+error);
		}
	});

	$.ajax({
		url: "<c:url value='/admin/numericalStatement/dayselled.do'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			//alert(res);
			var con=[];
			var val1=[];
			var val2=[];
			$.each(res,function(idx,value){
				if(value.type=='연극'){
					val1.push(value.totalselled);
					
				}else if(value.type=='뮤지컬'){
					val2.push(value.totalselled);
					con.push(value.day);
				}
			})
			//alert(con);
			//alert(val);
			Highcharts.chart('chart2', {
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '장르 별 예매 수량'
		        },
		        xAxis: {
		        	title: {
		                text: '일'
		            },
		            categories: con,
		        },
		        yAxis: {
		            title: {
		                text: '수량'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#080927'
		            }]
		        },
		        series: [{
		            name: '연극',
		            data: val1
		        },{
		            name: '뮤지컬',
		            data: val2
		        }],
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        tooltip: {
		            valueSuffix: '장'
		        },
		        credits: {
		            enabled: false
		        }
		    });
		},
		error:function(xhr,status,error){
			alert("Error : "+status+", "+error);
		}
	});
	
	
});

</script>