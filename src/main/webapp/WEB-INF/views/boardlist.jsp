<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/assets/css/board.css" />
</head>
<body>
	<div id="wrapper">
		<h1>BOARD</h1>
		
		
		
		<table id="keywords" cellspacing="0" cellpadding="0" border="1">
			<thead>
				<tr>
					<th width="20%">게시판번호</th>
					<th width="20%"><span>게시판제목</span></th>
					<th width="20%"><span>사원</span></th>
					<th width="20%"><span>게시판등록일</span></th>
					<th width="20%"><span>조회수</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="bvo">
					
						
				<tr>
					<td><a href="boardRead?no=${bvo.board_no }">${bvo.board_no }</td>
					<td><a href="boardRead?no=${bvo.board_no }"> ${bvo.title} </a></td>
					<td>${bvo.emp_no }</td>
					<td>${bvo.bo_regdate }</td>
					<td>${bvo.visit_cnt }</td>					
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" onclick="location.href='boardForm'">글쓰기</button>
		
		
	</div>
</body>

</html>