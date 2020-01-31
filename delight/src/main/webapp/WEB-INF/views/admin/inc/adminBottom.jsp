<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <!-- ì¬ê¸°ë¶í° bottom -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block"> 최고의 공연 예매 사이트  Delight!!! - 관리자모드</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">${sessionScope.adminUserName} 님 환영합니다 <i class="mdi mdi-heart text-danger"></i></span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="<c:url value='/resources/admin/assets/vendors/js/vendor.bundle.base.js'/>" ></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<c:url value='/resources/admin/assets/js/off-canvas.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/hoverable-collapse.js'/>" ></script>
    <script src="<c:url value='/resources/admin/assets/js/misc.js'/>" ></script>
    <script type="text/javascript">
    $(function() {
		$("#out").click(function() {
			if(confirm("관리자모드를 종료하시겠습니까?")){
				location.href="<c:url value='/admin/adminLogout.do'/>";
			}
		});
		
		$("#logout").click(function() {
			if(confirm("로그아웃 하시겠습니까?")){
				location.href="<c:url value='/admin/adminLogout2.do'/>";
			}
		});
		
		$("#pwdcg").click(function() {
			window.open("/delight/admin/adminPwdCg.do","pwdCg",
			"width=500,height=500,left=0,top=0,location=yes,resizable=yes");
		});
	});
    </script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>