<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	 <table class="table table-striped table-bordered table-hover">
		<colgroup>
			<col width='20%' />
			<col width='40%' />
			<col width='40%' />
		</colgroup>
		<thead>
			<tr>
				<th>No.</th> 
				<th>이름</th>
				<th>부서명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">	
				<tr>
					<td><c:out value="${status.index+1}"/></td>
					<td><a href="javascript:fn_selectUser(<c:out value="${listview.emp_no}"/>, '<c:out value="${listview.emp_name}"/>')"><c:out value="${listview.emp_name}"/></a></td>
					<td><c:out value="${listview.position}"/></td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>
