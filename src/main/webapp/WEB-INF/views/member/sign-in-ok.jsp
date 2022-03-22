<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		let flag = ${flag};
		let path = "";
		if(flag){//로그인 성공
			alert("로그인 성공");
			path="${path}/main";
			
		}else{//로그인 실패
			alert("로그인 실패");
			path="${path}/sign-in";
		}
		
		window.location.href=path;
	
	</script>

</body>
</html>