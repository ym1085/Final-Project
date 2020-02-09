<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/adminTop.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<div class="content-wrapper">
            <div class="row">
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">
                  <div class="card-body">
                    <img src="<c:url value='/resources/admin/assets/images/dashboard/circle.svg'/>" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">1:1 문의 <i class="mdi mdi-comment-question-outline mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5">신규 <fmt:formatNumber value="${todayInquery }" pattern="#,###"/>건</h2>
                    <h6 class="card-text">전일 <fmt:formatNumber value="${tomorInquery }" pattern="#,###"/>건</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                  <div class="card-body">
                    <img src="<c:url value='/resources/admin/assets/images/dashboard/circle.svg'/>" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Daily Register <i class="mdi mdi-account-plus mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5"><fmt:formatNumber value="${todayRegister }" pattern="#,###"/>명</h2>
                    <h6 class="card-text">전일 <fmt:formatNumber value="${tomorRegister }" pattern="#,###"/>명</h6>
                  </div>
                </div>
              </div>
              <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                  <div class="card-body">
                    <img src="<c:url value='/resources/admin/assets/images/dashboard/circle.svg'/>" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Daily Visitor<i class="mdi mdi-account-network mdi-24px float-right"></i>
                    </h4>
                    <h2 class="mb-5"><fmt:formatNumber value="${todayVisitor }" pattern="#,###"/>명</h2>
                    <h6 class="card-text">전일 <fmt:formatNumber value="${tomorVisitor }" pattern="#,###"/>명</h6>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
            	<div class="col-md-6 card grid-margin">
            		<div class="card-body">
            		<div id="chart1"></div>
            		</div>
            	</div>
            	<div class="col-md-6 card grid-margin">
            		<div class="card-body">
            		<div id="chart2"></div>
            		</div>
            	</div>
            </div>
</div>

<%@include file="inc/adminBottom.jsp" %>

<script type="text/javascript">
$(function() {
	$("#adminHome").addClass("active");
	
	$.ajax({
		url: "<c:url value='/admin/numericalStatement/dayvisitor.do'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			//alert(res);
			var con=[];
			var val=[];
			$.each(res,function(idx,value){
				con.push(value.day);
				val.push(value.count);
			})
			//alert(con);
			//alert(val);
			Highcharts.chart('chart1', {
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: '일별 방문자 수'
		        },
		        xAxis: {
		        	title: {
		                text: '방문자 수'
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
		            name: '방문자 수',
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
			Highcharts.chart('chart2', {
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