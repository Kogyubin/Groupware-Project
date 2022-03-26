<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/assets/css/metisMenu.min.css" rel="stylesheet"> -->
<!-- <link href="resources/assets/css/sb-admin-2.css" rel="stylesheet"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" -->
<!-- 	integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css"> -->
<!-- <script src="resources/assets/js/bootstrap.min.js"></script> -->
<!-- <script src="resources/assets/js/metisMenu.min.js"></script> -->
<!-- <script src="resources/assets/js/sb-admin-2.js"></script> -->
<!-- <script src="resources/assets/js/dynatree/jquery.dynatree.js"></script> -->
<!-- <link href="resources/assets/js/dynatree/ui.dynatree.css" -->
<!-- 	rel="stylesheet" /> -->
<!-- <script src="resources/assets/js/dynatree/project9.js"></script> -->
<script src="resources/assets/js/ckeditor/ckeditor.js"></script>
<script>
	//결재 경로
	function signPath() {

		$.ajax({
			url : "popupUsers4SignPath",
			type : "post"
		}).done(function(result) {
			$("#popupUsers").html(result);

		});

		$("#popupUsers").modal("show");

	}

	function fn_selectUsers(docsignpath) {
		$("#docsignpath").val(docsignpath);
		$("#popupUsers").modal("hide");

		var signPath = $("#signPath");
		var signPath4Agree = $("#signPath4Agree");

		signPath.empty();
		signPath4Agree.empty();

		var typearr = [ "기안", "합의", "결재" ];
		var nos = docsignpath.split("||");
		for ( var i in nos) {
			if (nos[i] === "")
				continue;
			var arr = nos[i].split(","); // 사번, 이름, 기안/합의/결제, 직책 
			var signArea = $("<div class='signArea'>");
			if (arr[2] === "1")
				signPath4Agree.append(signArea);
			else
				signPath.append(signArea);
			var signAreaTop = $("<div class='signAreaTop'>" + arr[3] + "</div>")
					.appendTo(signArea);
			var signAreaTop = $("<div class='signAreaCenter'>").appendTo(
					signArea);
			var signAreaTop = $(
					"<div class='signAreaBottom'>" + arr[1] + "</div>")
					.appendTo(signArea);
		}
	}

	function fn_tempSubmit() {
		CKEDITOR.instances["doccontents"].updateElement();

		if (!chkInputValue("#doctitle", "제목"))
			return false;

		$("#docstatus").val("0");
		$("#form1").submit();
	}

	window.onload = function() {
		CKEDITOR.replace('doccontents', {
			'filebrowserUploadUrl' : 'upload4ckeditor'
		});
	}

	function fn_formSubmit() {
		CKEDITOR.instances["doccontents"].updateElement();

		if (!chkInputValue("#doctitle", "제목"))
			return false;
		if (!chkInputValue("#doccontents", "내용"))
			return false;

		$("#form1").submit();
	}
</script>

</head>
<body>

	<div>

		<div>
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<i class="fa fa-edit fa-fw"></i> 기안하기
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- /.row -->
			<div class="row">
				<div class="col-lg-9"></div>

				<div class="col-lg-1">
					<button class="btn btn-outline btn-primary"
						onclick="fn_formSubmit()">결재상신</button>
				</div>
				<div class="col-lg-1">
					<button class="btn btn-outline btn-primary" onclick="signPath()">결재경로</button>
				</div>
			</div>

			<c:set value="0" var="cnt" />

			<div class="row" style="margin-top: 10px">
				<div id="signPath" class="signPath">
					<c:forEach var="signlist" items="${signlist}" varStatus="status">
						<c:if test="${signlist.sstype ne '1'}">
							<div class="signArea">
								<div class="signAreaTop">
									<c:out value="${signlist.userpos}" />
								</div>
								<div class="signAreaCenter">
									<c:choose>
										<c:when test='${signlist.ssresult == "1"}'>승인</c:when>
										<c:when test='${signlist.ssresult == "2"}'>반려</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</div>
								<div class="signAreaBottom">
									<c:out value="${signlist.usernm}" />
								</div>
							</div>
						</c:if>
						<c:if test="${signlist.sstype eq '1'}">
							<c:set var="cnt" value="${cnt + 1}" />
						</c:if>
					</c:forEach>
				</div>
				<div class="signTitle">
					<br>결<br> <br>재
				</div>
			</div>
			<c:if test="${cnt>0}">
				<div class="row" style="margin-top: 10px">
					<div id="signPath4Agree" class="signPath">
						<c:forEach var="signlist" items="${signlist}" varStatus="status">
							<c:if test="${signlist.sstype eq '1'}">
								<div class="signArea">
									<div class="signAreaTop">
										<c:out value="${signlist.userpos}" />
									</div>
									<div class="signAreaCenter">
										<c:choose>
											<c:when test='${signlist.ssresult == "1"}'>결재</c:when>
											<c:when test='${signlist.ssresult == "2"}'>반려</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</div>
									<div class="signAreaBottom">
										<c:out value="${signlist.usernm}" />
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="signTitle">
						<br>합<br> <br>의
					</div>
				</div>
			</c:if>

			<div class="row" style="margin-top: 10px">
				<form id="form1" name="form1" role="form" action="signDocSave"
					method="post">
					<input type="hidden" name="docno"
						value="<c:out value="${signDocInfo.docno}"/>"> <input
						type="hidden" name="docstatus" id="docstatus"
						value="<c:out value="${signDocInfo.docstatus}"/>"> <input
						type="hidden" name="dtno"
						value="<c:out value="${signDocInfo.dtno}"/>"> <input
						type="hidden" name="docsignpath" id="docsignpath"
						value="<c:out value="${signDocInfo.docsignpath}"/>">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row form-group">
								<label class="col-lg-1">제목</label>
								<div class="col-lg-11">
									<input type="text" class="form-control" id="doctitle"
										name="doctitle" maxlength="50"
										value="<c:out value="${signDocInfo.doctitle}"/>">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-1">내용</label>
								<div class="col-lg-11">
									<textarea class="form-control" id="doccontents"	name="doccontents">
										<c:out value="${signDocInfo.doccontents}" />
									</textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<div id="popupUsers" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>
</body>
</html>