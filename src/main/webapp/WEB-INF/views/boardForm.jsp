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
	<form name="form" action="boardSave">
		<table border="1" style="width:600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%'/>
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="emp_no" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="70" maxlength="250"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="5" cols="60"></textarea></td>
				</tr>
				<tr>
					<td>파일</td>
					<td><input type="file" name="file"></td>
				</tr>
				
			</tbody> 
	</table>
	<input type="submit" value="저장">
	</form>
</body>
</html>