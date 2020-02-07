<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/adminTop.jsp" %>

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
           
</div>

<%@include file="inc/adminBottom.jsp" %>

<script type="text/javascript">
$(function() {
	$("#adminHome").addClass("active");
	
});

</script>