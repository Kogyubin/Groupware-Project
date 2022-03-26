<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/modal.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCKITRI</title>

<script>
	$(function() {
		$("#deptTree4Users").dynatree({
			children : <c:out value="${treeStr}" escapeXml="false"/>,
			onActivate : deptTreeInUsersActivate
		});
		$("#deptTree4Users").dynatree("getRoot").visit(function(node) {
			node.expand(true);
		});
	});

	function deptTreeInUsersActivate(node) {
		if (node == null || node.data.key == 0)
			return;

		$.ajax({
			url : "deptList",
			type : "post",
			data : {
				deptno : node.data.key
			}
		}).done(function(result) {
			$("#deptList").html(result);
		});
	}

	var action = '';
	var url = '';
	var type = '';
	var deptno = 0;

	$(document).ready(function() {

		//추가 버튼 클릭
		$("#addBtn").click(function() {
			action = 'create';
			type = 'post'
			$("#modal-title").text("추가");
			$("#myModal").modal();

		});

		//Modal의 submit 버튼 클릭
		$("#modalSubmit").click(function() {

			if (action == 'create') {
				empno = 0;
				url = '${path}/addUserSave';
			} else if (action == 'modify') {
				url = '${path}/addUserSave';
			}

			var data = {
				emp_no : $("#empNo").val(),
				emp_name : $("#empName").val(),
				emp_id : $("#empId").val(),
				dept_no : $("#deptNo").val(),
				hiredate : $("#hiredate").val(),
				position : $("#position").val()
			};

			console.log(data);

			$.ajax({
				url : url,
				type : type,
				data : data
			}).done(function(result) {

				if (result) {
					alert("등록에 성공하였습니다.");
				} else {
					alert("등록에 실패하였습니다.");
				}
				$("#myModal").modal('toggle');

			}).always(function() {

				location.reload();

			});

		});
	});

	//부서 디테일
	function fn_UserRead(emp_no) {
		$.ajax({
			url : "${path}/userRead",
			type : "post",
			data : {
				emp_no : emp_no
			},
			success : function(result) {
				console.log(result);
				$("#empNo").val(result.emp_no);
				$("#empNo").attr("readonly", true);
				$("#empName").val(result.emp_name);
				$("#empId").val(result.emp_id);
				$("#deptNo").val(result.dept_no);
				$("#hiredate").val(result.hiredate);
				$("#hiredate").attr("readonly", true);
				$("#position").val(result.position);

				$("#myModal").modal();
			}
		})
	}

	//부서 삭제
	function fn_UserDelete(emp_no) {

		let deleteOk = confirm("정말 삭제하시겠습니까?");
		
		if(!deleteOk){
			return;
		}
		
		$.ajax({
			url : "${path}/userDelete",
			type : "post",
			data : {
				emp_no : emp_no,
// 				dept_no : selectedNode.data.key
			},
			success : function(result) {
				$("#userlist4Users").html(result);
			}
		});
		
	}
</script>

</head>
<body>
	<h2>부서 관리</h2>


	<div id="app" class="container">

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div>부서리스트</div>
					</div>
					<div class="maxHeight400">
						<div id="deptTree4Users"></div>
					</div>
				</div>
			</div>
		</div>
			<div class="panel panel-default col-lg-6" >
                <div class="panel-body">
	            <div class="row form-group">
	            
<!-- 	            <button id="addBtn" type="button" class="btn btn-info btn-sm" data-toggle="modal">추가</button>	 -->
				</div>
				<input name="deptno" id="deptno" type="hidden" value=""> 
	            <div class="row form-group">
	            	<div class="col-lg-9" >
			 				<input name="deptnm" id="deptnm" style="width: 500px;" type="text" maxlength="100" value="" class="form-control">
		            </div>
				</div>
				
				 <div class="row form-group">
	            	<button class="btn btn-outline btn-primary" onclick="fn_groupSave()" >등록</button>
	            	<button class="btn btn-outline btn-primary" onclick="fn_groupDelete()" >삭제</button>
				</div>
				
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body" id="myModalBody">
					<table class="table">
						<tr>
							<td>사원번호</td>
							<td><input class="form-control" id="empNo" type="text"></td>
						</tr>
						<tr>
							<td>사원명</td>
							<td><input class="form-control" id="empName" type="text"></td>
						</tr>
						<tr>
							<td>ID</td>
							<td><input class="form-control" id="empId" type="text"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>PW</td> -->
<!-- 							<td><input class="form-control" id="empPw" type="text"></td> -->
<!-- 						</tr> -->
						<tr>
							<td>부서번호</td>
							<td><input class="form-control" id="deptNo" type="text"></td>
						</tr>
						<tr>
							<td>입사일</td>
							<td><input class="form-control" id="hiredate" type="date"></td>
						</tr>
						<tr>
							<td>직위</td>
							<td><input class="form-control" id="position" type="text"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button id="modalSubmit" type="button" class="btn btn-success">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>