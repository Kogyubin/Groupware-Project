<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<script>
var selectedNode = null;

$(function(){
	$("#deptTree4Users").dynatree({
		children: <c:out value="${treeStr}" escapeXml="false"/>,
		onActivate: deptTreeInUsersActivate
	});
    $("#deptTree4Users").dynatree("getRoot").visit(function(node){
        node.expand(true);
    });
});

    function set_Users(emp_no) {
    	if (emp_no==="") {
    		addRow(0, '<c:out value="${sessionScope.emp_no}"/>', '<c:out value="${sessionScope.emp_name}"/>', '');
    		return;
    	}
    	var nos = emp_no.split("||");
    	for (var i in nos) { 
    		if (nos[i]==="") continue;
    		var arr = nos[i].split(","); // 사번, 이름, 기안/합의/결제, 직책 
    		addRow(arr[2], arr[0], arr[1], arr[3]);
    	}
    }





    function fn_addUser(emp_no, emp_name, dept_no, position) {
        
        var chk = document.getElementById("tr"+emp_no);
        if (chk) {
        	alert("이미 선택된 사용자입니다.");
        	return;
        }
        addRow(2, emp_no,  emp_name, position);
    }
    
    
    
function deptTreeInUsersActivate(node) {
    if (node==null || node.data.key==0) return;
    
    $.ajax({
        url: "popupUsers4Users",
        type:"post", 
        data: { deptno : node.data.key }        
    }).done(function(result){
                $("#userlist4Users").html(result);
        }            
    );
}


function addRow(optionIndex, emp_no, emp_name, position) {
	var tr = $("<tr id='tr" + emp_no +"'>");
	$("#seletedUsers > tbody").append(tr);

	var td = $("<TD>");
	tr.append(td);
	
	var typearr = ["기안", "합의", "결재"];
	var select = $("<select>");
	td.append(select);
	for (var i=0; i<typearr.length;i++) {
		var option = $("<option value='"+ i + "'>" + typearr[i] + "</option>");
		select.append(option);
		select.val(optionIndex);
	}

	var td = $("<TD>");
	tr.append(td);
	td.text(emp_name);
	
	td = $("<TD>");
	tr.append(td);
	td.html("<a href='javascript:fn_UserDelete(" + emp_no +")'><i class='fa fa-times fa-fw'></i></a>");
	
	if (position==="") position = typearr[optionIndex];
	td = $("<TD>");
	tr.append(td);
	td.html(position);
	td.css({"display": "none"});
}


function fn_UserDelete(emp_no) {
	$("#tr"+emp_no).remove();
}

function fn_search4Users() {
	if ( ! chkInputValue("#keyword4Users", "검색어")) return false;
	
    $.ajax({
    	url: "popupUsers4Users",
		type: "post", 
    	data: { searchKeyword : $("#keyword4Users").val() }    	
    }).done(function(result){
    			$("#userlist4Users").html(result);
		}    		
    );
}


</script>    

	  	<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-3 pull-right">
		                   	<div class="input-group custom-search-form">
	                        	<input class="form-control" type="text" id="keyword4Users" name="keyword4Users" onkeydown="if(event.keyCode == 13) { fn_search4Users();}">
	                            <span class="input-group-btn">
	                            	<button class="btn btn-default" onclick="fn_search4Users()"><i class="fa fa-search"></i></button>
	                            </span>
	                       	</div>
					</div>
                    <h4 class="modal-title" id="myModalLabel">사용자관리</h4>
                </div>
                
                <div class="modal-body">
		            <!-- /.row -->
		            <div class="row">
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			                            <div>부서리스트</div>
			                    </div>
			                    <div class="maxHeight400">
							    	<div id="deptTree4Users">
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<div>사용자리스트</div>
			                    </div>
			                    <div class="panel-body maxHeight400" id="userlist4Users">    
							    </div>    
							</div>
						</div>	
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<div>선택된사용자</div>
			                    </div>
			                    <div class="panel-body maxHeight400">
									 <table  id="seletedUsers" class="table table-striped table-bordered table-hover">
										<colgroup>
											<col width='30%' />
											<col width='60%' />
											<col width='10%' />
										</colgroup>
										<thead>
											<tr>
												<th></th> 
												<th>이름</th>
												<th></th> 
												<th style="display:none"></th> 
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
							    </div>    
							</div>
						</div>	
		            </div>
            		<!-- /.row -->                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">닫기</button>
                    <button type="button" class="btn btn-primary" onclick="fn_closeUsers()">확인</button>
                </div>
		    </div>
	  	</div>