<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
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
					<td>${bvo.board_no }</td>
					<td> ${bvo.title } </td>
					<td>${bvo.emp_no }</td>
					<td>${bvo.bo_regdate }</td>
					<td>${bvo.visit_cnt }</td>					
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" onclick="location.href='boardForm'">글쓰기</button>
		<div class="newcontent right padding-r30 margin-t-b10">
			<c:if test="${!empty sessionScope.session_id }">
				<a href="regist" class="btn">새글작성</a>
			</c:if>
		</div>
		<div class="pagination">
			<!-- 이전버튼 -->
			<c:if test="${paging.prev }">
				<a href="board?curPage=${paging.startPage-1 }">&lt;</a>
			</c:if>
			<c:forEach varStatus="status" begin="${paging.startPage }" end="${paging.endPage }" >
				<c:choose>
					<c:when test="${paging.curPage eq status.index }">
						<span>&nbsp;${status.index }&nbsp;</span>  <!-- 현재페이지의 경우 그냥 출력 -->
					</c:when>
					<c:otherwise> <!-- 그 외 이동해야하는 나머지 페이지는 a 태그로 출력 -->
						&nbsp;<a href="board?curPage=${status.index }">${status.index }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음버튼 -->
			<c:if test="${paging.next }">
				<a href="board?curPage=${paging.endPage+1 }">&gt;</a>
			</c:if>
		</div>
		
	</div>
</body>

</html>