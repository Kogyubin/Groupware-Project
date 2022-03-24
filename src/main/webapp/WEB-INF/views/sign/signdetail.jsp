<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/assets/css/signdetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<script src="resources/assets/js/bootstrap.min.js"></script>
<script src="resources/assets/js/dynatree/jquery.dynatree.js"></script>
<link href="resources/assets/js/dynatree/ui.dynatree.css" rel="stylesheet"/> 
<script src="resources/assets/js/dynatree/project9.js"></script>    
<script>

//결재 경로
function signPath(){
	
	
    $.ajax({
        url: "popupUsers4SignPath",
        type: "post"        
    }).done(function(result){
                $("#popupUsers").html(result); 
                
				
    });
    
    $("#popupUsers").modal("show");
    
    
}
	


</script>

</head>
<body>

	<main role="main">

		<section class="panel important">
			<h2>기안하기</h2>

				<div class="twothirds">
					<input type="hidden" name="bno" value="${bvo.bno }">
					no: ${bvo.bno } / view: ${bvo.viewCnt } / date: 
					<fmt:formatDate value="${bvo.regdate }" pattern="yyyy/MM/dd hh:mm:ss"/> 
					<br>
					writer:<br /> 
					<input type="text" name="id" size="40" value="${bvo.id }" readonly/><br />
					title:<br /> 
					<input type="text" name="title" id="title" size="40" value="${bvo.title }" readonly /><br />
					content:<br />
					<textarea name="content" id="content" rows="15" cols="67" readonly >${bvo.content }</textarea>
					<br />
					
					<c:if test="${!empty bvo.fileName }">
					Download: <a href="file-download?bno=${bvo.bno}" class="file-down">${bvo.fileName }</a>
					</c:if>
				</div>
				<br>
				<div>
					<hr>
					&lt;&lt; Comment &gt;&gt; <br><br>
					<c:forEach items="${clist }" var="cvo">
						
						<div class="comment"><input type="hidden" value="${cvo.cno }">
							<span class="font-w-b">${cvo.id }</span> | 
							<span class="font-s10 font-c-gray">${cvo.regdate }</span>&nbsp;&nbsp;
							
							<a onclick="commCommFun(this);">답변</a> 
							<a onclick="commCommSaveFun(this);" class="hide">저장</a>
							<a onclick="commCommCancelFun(this);">취소</a> <br>
							<span class="margin-t10 display-inb">${cvo.content }</span>
						</div>
						<div class="hide"><textarea rows="3" cols="20"></textarea></div>
						
					 	<c:forEach items="${cclist }" var="ccvo">
					 		<c:if test="${cvo.cno eq ccvo.parentComment }">
								 <div class="comm-comm comment">
									<span class="font-w-b">${ccvo.id }</span>|
									<span class="font-s10 font-c-gray">${ccvo.regdate }</span><br> 
									<span class="margin-t10 display-inb">${ccvo.content }</span>
								</div>
					 		
					 		</c:if>
						</c:forEach>	
					 	
						
						
					</c:forEach>
					
					
					
				</div>
				
				<c:if test="${!empty sessionScope.session_id }">
					<div><!-- 답변 등록 -->
					
						<textarea class="comment-regist" rows="4" cols="50" name="comment"></textarea>
						<div class="commentBtn"><a href="#" id="commentBtn">답변</a></div>

					</div>
				</c:if>
				
				<div class="text-align-c margin-b20 clear-b">
					<a href="board" class="btn">결재상신</a>
						<button id="signPathUser" class="btn" onclick="signPath()">결재경로</button>
					
					
				</div>
			
		</section>

	</main>
	<div id="popupUsers" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"  aria-labelledby="myLargeModalLabel">
	
	
	
	
	</div>
</body>
</html>