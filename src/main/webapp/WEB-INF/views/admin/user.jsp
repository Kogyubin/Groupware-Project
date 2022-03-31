<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@include file="../include/header.jsp"%> --%>
<%-- <%@include file="../include/modal.jsp"%> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCKITRI</title>

<script>
	let selectedNode;
	
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

// 		console.log(node.data.title);
		selectedNode = node.data.key;
		
		$.ajax({
			url : "userList",
			type : "post",
			data : {
				deptno : node.data.key
			}
		}).done(function(result) {
			$("#userlist4Users").html(result);
		});
	}

	var action = '';
	var url = '';
	var type = '';
	var empno = 0;

	$(document).ready(function() {

		//추가 버튼 클릭
		$("#addBtn").click(function() {
			if (selectedNode == null) {
				alert("부서를 선택바랍니다.");
				return;
			}
			action = 'create';
			type = 'post'
			$("#modal-title").text("추가");
			$("#selectBox").val(selectedNode).prop("selected",true);
			$("#empNo").val("");
			$("#empNo").attr("readonly",false);
			$("#empName").val("");
			$("#empId").val("");
			$("#hiredate").val("");
			$("#hiredate").attr("readonly",false);
			$("#position").val("");
			
			$("#myModal").modal();
			

		});

		//Modal의 submit 버튼 클릭
		$("#modalSubmit").click(function() {
			
			if (action == 'create') {
				empno = 0;
				url = '${path}/addUserSave';
			} else if (action == 'modify') {
				url = '${path}/userUpdate';
			}

			var data = {
				emp_no : $("#empNo").val(),
				emp_name : $("#empName").val(),
				emp_id : $("#empId").val(),
				dept_no : $("#selectBox option:selected").val(),
				hiredate : $("#hiredate").val(),
				position : $("#position").val()
			};

			console.log(data);

			$.ajax({
				url : url,
				type : type,
				data : data
			}).done(function(result) {

				
				if (action == 'create') {
					if (result) {
						alert("등록에 성공하였습니다.");
					} else {
						alert("등록에 실패하였습니다.");
					}
				} else if (action == 'modify') {
					if (result) {
						alert("수정에 성공하였습니다.");
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
				
// 				deptTreeInUsersActivate($("#selectBox option:selected").val());
				
				
				$("#myModal").modal('toggle');

			});

		});
	});

	//사원 디테일
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
				$("#selectBox").val(selectedNode).prop("selected",true);
				$("#hiredate").val(result.hiredate);
				$("#hiredate").attr("readonly", true);
				$("#position").val(result.position);

				$("#myModal").modal();
				action = "modify";
			}
		})
	}

	//사원 삭제
	function fn_UserDelete(emp_no) {
// 	console.log(event.currentTarget);
		let deleteOk = confirm("정말 삭제하시겠습니까?");

		if (!deleteOk) {
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
				
				if (result) {
					
// 					$this.parent().remove();
					alert("삭제가 완료되었습니다.");
				}
				
			}
		});

	}
</script>

</head>
<body>

	<h2>사원 관리</h2>


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

			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div>사원리스트</div>
					</div>
					<div class="panel-body maxHeight400" id="userlist4Users"></div>
				</div>
			</div>
		</div>

		<button id="addBtn" type="button" class="btn btn-info btn-sm"
			data-toggle="modal">추가</button>

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
							<td>부서명</td>
<!-- 							<td><input class="form-control" id="deptNm" type="text"></td> -->
							<td>
							<select id="selectBox" class="form-control">
								<c:forEach var="deptList" items="${listview }">
                                     <option value="${deptList.key }">${deptList.title }</option>
                           		</c:forEach>
							</select>
							</td>
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