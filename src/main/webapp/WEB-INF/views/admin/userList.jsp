<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<table class="table table-striped table-bordered table-hover">
	<colgroup>
		<col width='10%' />
		<col width='15%' />
		<col width='15%' />
		<col width='15%' />
		<col width='15%' />
		<col width='15%' />
		<col width='15%' />
	
		
	</colgroup>
	<thead>
		<tr>
			<th>No.</th>
			<th>사원번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>입사일</th>
			<th>직위</th>
			<th></th>
			
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listview" items="${listview}" varStatus="status">
			<tr>
				<td><c:out value="${status.index+1}" /></td>
				<td><a href="javascript:fn_UserRead(<c:out value="${listview.emp_no}"/>)"><c:out value="${listview.emp_no}"/></a></td>
				<td><a href="javascript:fn_UserRead(<c:out value="${listview.emp_no}"/>)"><c:out value="${listview.emp_name}"/></a></td>
				<td><c:out value="${listview.emp_id}" /></td>
				<td><c:out value="${listview.hiredate}" /></td>
				<td><c:out value="${listview.position}" /></td>
				<td><a href="javascript:fn_UserDelete(<c:out value="${listview.emp_no}"/>,this)"><i class="fa fa-times fa-fw"></i></a></td>
				
			</tr>
			
		</c:forEach>
	</tbody>
</table>
