<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>SCKITRI</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script>
	function contentAdd($url){
		$.ajax({
			url: $url,
			
			success : function(data){
				$("#content").html(data);
			}
			
			
			
		});
	}
	


</script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<%@include file="common/head.jsp"%>
				
				<section id="content">

				<%@include file="common/calendar.jsp" %>
<%-- 				<%@include file="board/mainboardlist.jsp" %> --%>
				
				</section>
				


			</div>
		</div>

		<%@include file="common/navigation.jsp"%>

	</div>

	<!-- Scripts -->
	<%@include file="common/script.jsp"%>
	
	
</body>

</html>