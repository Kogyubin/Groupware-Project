<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="width:600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>사원번호</td> 
					<td><c:out value="${info.emp_no}"/></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><c:out value="${info.title}"/></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><c:out value="${info.content}"/></td> 
				</tr>
			</tbody>
		</table>
		<input type="button" onclick="location.href='boardlist'" value="돌아가기">
		<input type="button"onclick="location.href='boardUpdate?no=${info.board_no}'" value="수정">
		<input type="button" onclick="location.href='boardDelete?no=${info.board_no}'" value="삭제">    
</body>
</html>