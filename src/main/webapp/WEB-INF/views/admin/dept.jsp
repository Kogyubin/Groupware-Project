<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%-- <%@include file="../include/header.jsp"%> --%>
<%-- <%@include file="../include/modal.jsp"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCKITRI</title>

<script>
var selectedNode = null;

	$(function() {
		$("#deptTree4Users").dynatree({
			children : <c:out value="${treeStr}" escapeXml="false"/>,
			onActivate : deptTreeInUsersActivate
		});
		$("#deptTree4Users").dynatree("getRoot").visit(function(node) {
			node.expand(true);
		});
	});
	
//부서클릭
	function deptTreeInUsersActivate(node) {
		if (node == null || node.data.key == 0) return;

		$.ajax({
			url : "${path}/deptRead",
			cache: false,
			data : {deptno : node.data.key}
// 		}).done(function(result) {
// 			$("#deptList").html(result);
			}).done(receiveData);
	}

	function receiveData(data){
		$("#deptno").val(data.deptno);
		$("#deptnm").val(data.deptnm);
	}
	
	//부서 추가
	function fn_deptNew(){
		$("#deptno").val("");
		$("#deptnm").val("");
	}
	
	//부서 추가 등록 버튼
	function fn_deptSave(){
		var pid = null;
		if (selectedNode!=null) pid=selectedNode.data.key;
		
		let saveOk = confirm("등록 하시겠습니까?");
		if (!saveOk) {
			return;
		}
		
		$.ajax({
			url:"${path}/deptSave",
			cache: false,
			type:"POST",
			data: { deptno:$("#deptno").val(), deptnm:$("#deptnm").val(), parentno: pid}
			
		}).done(receiveDataSave);
	}
	
	function receiveDataSave(data){
		if (selectedNode!==null && selectedNode.data.key===data.deptno) {
			selectedNode.data.title=data.deptnm;
			selectedNode.render();
		} else {
			addNode(data.deptno, data.deptnm);
		}
		
		alert("정상적으로 등록되었습니다.");
	}
	
	
	//부서 삭제
	function fn_deptDelete(value){
		if(selectedNode==null){
			alert("삭제할 부서를 선택바랍니다.");
			
		}
		if(selectedNode.childList){
			alert("해당 부서를 삭제할 수 없습니다.");
			
		}
		
		if(selectedNode!=null){
			
			let deleteOk = confirm("정말 삭제하시겠습니까?");

			if (!deleteOk) {
				return;
			}
			
			$ajax({
				url:"deptDelete",
				cache: false,
				data: {deptno : selectedNode.data.key}
			}).done(receiveDataDelete);
		}
		
	}
	
	function receiveDataDelete(data){
		
		selectedNode.remove();		
		selectedNode = null;
		fn_deptNew();
	}
		
	//부서 트리 추가
	function addNode(nodeNo, nodeTitle){
	var node = $("#tree").dynatree("getActiveNode");
	if (!node) node = $("#tree").dynatree("getRoot");
	var childNode = node.addChild({key: nodeNo, title: nodeTitle});
	node.expand() ;
	node.data.isFolder=true;
	node.tree.redraw();
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
                 
            	<div class="panel panel-default col-lg-6" >
                    <div class="panel-body">
			            <div class="row form-group">
			            	<button class="btn btn-outline btn-primary" onclick="fn_deptNew()" >추가</button>
						</div>
				</div>
				<input name="deptno" id="deptno" type="hidden" value="">
				<div class="row form-group">
					<div class="col-lg-9">
						<input name="deptnm" id="deptnm" style="width: 500px;" type="text"
							maxlength="100" value="" class="form-control">
					</div>
				</div>

				<div class="row form-group">
					<button class="btn btn-outline btn-primary" onclick="fn_deptSave()">등록</button>
					<button class="btn btn-outline btn-primary" onclick="fn_deptDelete()">삭제</button>
				</div>

			</div>
		</div>
	</div>
	

</body>
</html>