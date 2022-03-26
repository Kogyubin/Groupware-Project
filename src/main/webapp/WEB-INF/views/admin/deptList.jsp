<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<table class="table table-striped table-bordered table-hover">
	<colgroup>
		<col width='10%' />
		<col width='20%' />
		<col width='30%' />
		<col width='20%' />
		<col width='20%' />
		
		
	</colgroup>
	<thead>
		<tr>
			<th>No.</th>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서소속</th>
			<th></th>
			
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listview" items="${listview}" varStatus="status">
			<tr>
				<td><c:out value="${status.index+1}" /></td>
				<td><a href="javascript:fn_UserRead(<c:out value="${listview.deptno}"/>)"><c:out value="${listview.emp_id}"/></a></td>
				<td><a href="javascript:fn_UserRead(<c:out value="${listview.deptnm}"/>)"><c:out value="${listview.emp_name}"/></a></td>
				<td><c:out value="${listview.parentno}" /></td>
				<td><a href="javascript:fn_UserDelete(<c:out value="${listview.emp_no}"/>)"><i class="fa fa-times fa-fw"></i></a></td>
				
			</tr>
			
		</c:forEach>
	</tbody>
</table>
