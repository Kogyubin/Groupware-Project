<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/assets/css/metisMenu.min.css" rel="stylesheet">
<link href="resources/assets/css/sb-admin-2.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"
	integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<script src="resources/assets/js/bootstrap.min.js"></script>
<script src="resources/assets/js/metisMenu.min.js"></script>
<script src="resources/assets/js/sb-admin-2.js"></script>
<script src="resources/assets/js/dynatree/jquery.dynatree.js"></script>
<link href="resources/assets/js/dynatree/ui.dynatree.css"
	rel="stylesheet" />
<script src="resources/assets/js/dynatree/project9.js"></script>


<script>
function fn_formSubmit(){
	document.form1.submit();	
}
</script>

</head>
<body>
 <div id="wrapper">

		
		<form role="form" id="form1" name="form1"  method="post">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><i class="fa fa-edit fa-fw"></i> 결제 받을(은) 문서</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
				 	<label><input name="searchExt1" id="searchExt1" type="radio" value="" onclick="fn_formSubmit()" <c:if test='${searchVO.searchExt1==""}'>checked</c:if>> 전체</label>
				 	<label><input name="searchExt1" id="searchExt1" type="radio" value="2" onclick="fn_formSubmit()" <c:if test='${searchVO.searchExt1=="2"}'>checked</c:if>> 진행중</label>
				 	<label><input name="searchExt1" id="searchExt1" type="radio" value="4" onclick="fn_formSubmit()" <c:if test='${searchVO.searchExt1=="4"}'>checked</c:if>> 완료</label>
				 	<label><input name="searchExt1" id="searchExt1" type="radio" value="3" onclick="fn_formSubmit()" <c:if test='${searchVO.searchExt1=="3"}'>checked</c:if>> 반려</label>
                </div>
            </div>
            
            <!-- /.row -->
            <div class="panel panel-default"> 
            	<div class="panel-body">
					<div class="listHead">
						<div class="listHiddenField pull-left field60">No.</div>
						<div class="listHiddenField pull-right field100">종류</div>
						<div class="listHiddenField pull-right field100">작성일자</div>
						<div class="listHiddenField pull-right field100">작성자</div>
						<div class="listHiddenField pull-right field100">상태</div>
						<div class="listTitle">글 제목</div>
					</div>
					
					<c:if test="${listview.size()==0}">
						<div class="listBody height200">
						</div>
					</c:if>
					
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<c:url var="link" value="signDocRead">
							<c:param name="docno" value="${listview.docno}" />
						</c:url>
					
						<div class="listBody">
							<div class="listHiddenField pull-left field60 textCenter"><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></div>
							<div class="listHiddenField pull-right field100 textCenter"><c:out value="${listview.dttitle}"/></div>
							<div class="listHiddenField pull-right field100 textCenter"><c:out value="${listview.updatedate}"/></div>
							<div class="listHiddenField pull-right field100 textCenter"><c:out value="${listview.usernm}"/></div>
							<div class="listHiddenField pull-right field100 textCenter"><c:out value="${listview.docstatus}"/></div>
							<div class="listTitle" title="<c:out value="${listview.doctitle}"/>">
								<a href="${link}"><c:out value="${listview.doctitle}"/></a>
							</div>
						</div>
					</c:forEach>	
					
					<br/>
				    
						<div class="form-group">
							<div class="checkbox col-lg-3 pull-left">
							 	<label class="pull-right">
							 		<input type="checkbox" name="searchType" value="doctitle" <c:if test="${fn:indexOf(searchVO.searchType, 'doctitle')!=-1}">checked="checked"</c:if>/>
		                        	제목
		                        </label>
							 	<label class="pull-right">
							 		<input type="checkbox" name="searchType" value="doccontents" <c:if test="${fn:indexOf(searchVO.searchType, 'doccontents')!=-1}">checked="checked"</c:if>/>
		                        	내용
		                        </label>
		                   </div>
		                   <div class="input-group custom-search-form col-lg-3">
	                                <input class="form-control" placeholder="Search..." type="text" name="searchKeyword" 
	                                	   value='<c:out value="${searchVO.searchKeyword}"/>' >
	                                <span class="input-group-btn">
	                                <button class="btn btn-default" onclick="fn_formSubmit()">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                            </span>
	                       </div>
						</div>
            	</div>    
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
		</form>	

    </div>
    <!-- /#wrapper -->

</body>
</html>