<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<table class="table table-striped table-bordered table-hover">
	<colgroup>
		<col width='5%' />
		<col width='15%' />
		<col width='10%' />
		<col width='14%' />
		<col width='14%' />
		<col width='14%' />
		<col width='14%' />
		<col width='14%' />
		
	</colgroup>
	<thead>
		<tr>
			<th>No.</th>
			<th>사원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>부서번호</th>
			<th>입사일</th>
			<th>직위</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listview" items="${listview}" varStatus="status">
			<tr>
				<td><c:out value="${status.index+1}" /></td>
<%-- 				<td><a href="javascript:fn_addUser(<c:out value="${listview.emp_no}"/>, '<c:out value="${listview.emp_name}"/>', '<c:out value="${listview.emp_id}"/>', '<c:out value="${listview.emp_pw}"/>')"><c:out --%>
<%-- 							value="${listview.dept_no}" /></a></td> --%>
				<td><c:out value="${listview.emp_no}" /></td>
				<td><c:out value="${listview.emp_name}" /></td>
				<td><c:out value="${listview.emp_id}" /></td>
				<td><c:out value="${listview.dept_no}" /></td>
				<td><c:out value="${listview.hiredate}" /></td>
				<td><c:out value="${listview.position}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
