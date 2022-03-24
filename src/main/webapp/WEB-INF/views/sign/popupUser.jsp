<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script>
	var selectedNode = null;
	
	$(function(){
			console.log("${treeStr}");
		$("#tree").dynatree({
			
			children: <c:out value="${treeStr}" escapeXml="false"/>,
			onActivate: deptTreeInUserActivate
		});
		
// 	    $("#tree").dynatree("getRoot").visit(function(node){
// 	        node.expand(true);
// 	    });
	    
	    
	});

    function fn_search() {
    	if ( ! chkInputValue("#searchKeyword", "검색어")) return false;
    	
        $.ajax({
        	url: "popupUsersByDept",
    		type: "post", 
        	data: { searchKeyword : $("#searchKeyword").val() }    	
        }).done(function(result){
        			$("#userlist").html(result);
    		}    		
        );
    }
    
    function deptTreeInUserActivate(node) {
        if (node==null || node.data.key==0) return;
        
        $.ajax({
            url: "popupUsersByDept",
            type:"post", 
            data: { deptno : node.data.key }        
        }).success(function(result){
                    $("#userlist").html(result);
            }            
        );
    }

</script>    

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <div class="col-lg-4 pull-right">
	                   	<div class="input-group custom-search-form">
                        	<input class="form-control" type="text" id="searchKeyword" name="searchKeyword" onkeydown="if(event.keyCode == 13) { fn_search();}">
                            <span class="input-group-btn">
                            	<button class="btn btn-default" onclick="fn_search()"><i class="fa fa-search"></i></button>
                            </span>
                       	</div>
					</div>                    
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body" id="myModalBody">
		            <!-- /.row -->
		            <div class="row">
		            	<div class="col-lg-5" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			                    <div></div>       
			                    <div>부서리스트</div>
			                    <div class="maxHeight400">
							    	<div id="tree">
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-7" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<div>사용자리스트</div>
			                    </div>
			                    
			                    <div class="panel-body maxHeight400" id="userlist">
			                    <a>고규빈</a>
							    </div>    
							</div>
						</div>	
		            </div>
            		<!-- /.row -->

				</div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
        </div>