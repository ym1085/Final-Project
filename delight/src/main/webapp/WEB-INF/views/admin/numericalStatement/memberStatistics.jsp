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
            categories: ['']
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
            categories: ['10대','20대','30대','40대','50대','60대','70대','80대','90대']
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
        }
    });
});

</script>