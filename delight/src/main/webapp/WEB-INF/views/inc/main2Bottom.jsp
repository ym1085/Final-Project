<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 여기부터 바텀인클루드 -->
	<script
		src="<c:url value='/resources/idxresources/vendor/jquery/jquery-3.2.1.min.js' />"></script>
	<script>

   $( ".toggle_icon" ).on('click', function() {
      $( 'body' ).toggleClass( "open" );   
   });
   </script>
	<!-- 라이트바 건들지마시오 -->

</body>
</html>