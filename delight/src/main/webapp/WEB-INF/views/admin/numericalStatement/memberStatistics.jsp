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
	<hr>
	<div class="card">
		<div class="card-body">
			<div id="chart3">
			
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/adminBottom.jsp" %>

<script type="text/javascript">
$(function() {
	$("#chartPart").addClass("active");
	$("#chart").addClass("show");
	
	Highcharts.chart('chart1', {
        chart: {
            type: 'bar'
        },
        title: {
            text: '회원 성비율'
        },
        xAxis: {
        	title: {
                text: '회원비율'
            },
            categories: ['성비율'],
        },
        yAxis: {
            title: {
                text: '비율'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#080927'
            }],
            max: 100
        },
        series: [{
            name: '남자',
            data: [JSON.parse('${man}')]
        },{
            name: '여자',
            data: [JSON.parse('${woman}')]
        }],
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        tooltip: {
            valueSuffix: '%'
        },
        credits: {
            enabled: false
        }
    });
	
	Highcharts.chart('chart2', {
        chart: {
            type: 'bar'
        },
        title: {
            text: '회원 연령대 비율'
        },
        xAxis: {
        	title: {
                text: '연령대'
            },
            categories: ${age}
        },
        yAxis: {
            title: {
                text: '비율'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [{
            name: '연령대',
            data: ${agegroup}
        }],
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        tooltip: {
            valueSuffix: '%'
        },
        credits: {
            enabled: false
        }
    });
	
	$.ajax({
		url: "<c:url value='/admin/numericalStatement/joincount.do'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			//alert(res);
			var con=[];
			var val=[];
			$.each(res,function(idx,value){
				con.push(value.day);
				val.push(value.join);
			})
			//alert(con);
			//alert(val);
			Highcharts.chart('chart3', {
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '일자별 가입자 수'
		        },
		        xAxis: {
		        	title: {
		                text: '가입자 수'
		            },
		            categories: con,
		        },
		        yAxis: {
		            title: {
		                text: '명수'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#080927'
		            }]
		        },
		        series: [{
		            name: '가입자수',
		            data: val
		        }],
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        tooltip: {
		            valueSuffix: '명'
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