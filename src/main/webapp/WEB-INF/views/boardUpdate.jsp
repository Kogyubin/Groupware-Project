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
	<form name="form" action="boardUpdateSave">
		<table border="1" style="width:600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>제목</td> 
					<td><input type="text" name="title" size="70" maxlength="250" value="<c:out value="${info.title}"/>"></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><textarea name="content" rows="5" cols="60"><c:out value="${info.content}"/></textarea></td> 
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="board_no" value="${info.board_no }">
		<input type="submit"  value="저장">  
		</form>
</body>
</html>