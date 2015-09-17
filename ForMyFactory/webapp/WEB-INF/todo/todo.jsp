<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>DevHee</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
	</head>
	<body>
<!-- Header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-toggle"></span>
      </button>
      <a class="navbar-brand" href="index.html">Home</a>
    </div>
   <!--  <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        
        <li class="dropdown">
          <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#">
            <i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
          <ul id="g-account-menu" class="dropdown-menu" role="menu">
            <li><a href="#">My Profile</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-lock"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </div> -->
  </div><!-- /container -->
</div>
<!-- /Header -->

<!-- Main -->
<div class="container">
  
  
  <!-- lower section -->
  <div class="row">
    
    <div class="col-md-12">
      <hr>
   		
        <ul class="nav nav-justified">
 			<li><a href="#" data-toggle="modal" data-target="#rating"><i class="glyphicon glyphicon-cog"></i></a></li>
 			<li><a title="Add Widget" data-toggle="modal" href="#addWidgetModal" data-target="#add"><span class="glyphicon glyphicon-plus-sign"></span></a></li>
 			<li><a title="Add Widget" data-toggle="modal" href="#addWidgetModal" data-target="#delete"><span class="glyphicon glyphicon-minus-sign"></span></a></li>
		</ul>   
		<div id="add" class="modal fade" role="dialog">
		  <div class="modal-dialog">
			<form:form modelAttribute="todo" action="registerToDo.html">
		    <!-- add-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">What to do</h4>
		      </div>
		       <div class="form-group">
			      <div class="modal-body">
			        <form:input path="note" class="form-control input-lg" name="j_username" placeholder="Enter your Goal"/>
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-default" >Submit</button>
		      </div>
		    </div>
			</form:form>
		  </div>
		</div>
		
		<div id="rating" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!--delete-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Option</h4>
		      </div>
		      <div class="modal-body">
		       <button type="button" class="col-xs-4 btn btn-default btn-md" onclick="rateTodo()" value="rate">Rate</button>
		       
		        <div class="col-xs-8 selectContainer">
		            <select id="rate" class="form-control" name="size">
		                <option value="">Choose a Rate</option>
		                <option value="20">SoSo(20)</option>
		                <option value="40">Good(40)</option>
		                <option value="60">Excellent(60)</option>
		                <option value="80">Almost There!(80)</option>
		                <option value="100">Success(100)</option>
		            </select>
		      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div id="delete" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!--delete-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Option</h4>
		      </div>
		      <div class="modal-body">
			      <div class="row">
			       <button type="button" class="btn btn-default btn-md" onclick="deleteTodo()">Delete</button> : Are you sure to delete it?
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
      <hr>
      	  <a href="#"><strong><i class="glyphicon glyphicon-list-alt"></i>To Do</strong></a>
       <table class="table table-striped">
        <thead>
          <tr><th></th><th>Num</th><th>Date</th><th>Rate</th><th>Description and Notes</th><th>Success</th></tr>
        </thead>
        <c:set var="i" value="0"/>
        <tbody>
          <c:forEach items="${todoList}" var="todo">
          <tr>
       		<td>
       			<input type="checkbox" value="${todo.num}" id="todolist_${i}">
          	</td>
          	<td id="num">
          		${todo.num}
          	</td>
          	<td>
          		${todo.todate}
          	</td>
	      	<td class="progress">
                 	<div class="progress-bar <c:choose> <c:when test="${todo.rate == 100}">progress-bar-success</c:when>
                 										<c:when test="${todo.rate == 80}">progress-bar-danger</c:when>
                 										<c:when test="${todo.rate == 60}">progress-bar-danger</c:when>
                 										<c:when test="${todo.rate == 40}">progress-bar-info</c:when>
                 										<c:when test="${todo.rate == 20}">progress-bar-info</c:when>
                 	</c:choose>" role="progressbar" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100" style="width: ${todo.rate}%"> </div>
                 	<input type="hidden" value="${todo.rate}" id="rate_${i}"/>
            <td>
           		 ${todo.note}
            </td>
             <td>
             	<c:if test="${todo.rate == 100}">
             		<strong style="color:#FFCD28">Success</strong>
             	</c:if>
            </td>
         </tr>
      	 <c:set var="i" value="${i+1}"/>
         </c:forEach>
        </tbody>
      </table>
      
          
    </div>
   <form id="tran" name="tran" method="post" action="deleteTodo.html">
    	<input type = "hidden" name="paramMap" id = todoArray value = ""/>
   </form>
   
   <form id="tran1" name="tran1" method="post" action="rateTodo.html">
    	<input type = "hidden" name="paramMap" id = todoArray1 value = ""/>
    	<input type = "hidden" name="rate" id = rate value = ""/>
   </form>
    
   <input type = "hidden" id = "size" value = "${todoListSize}"/>	
    	
  </div><!--/row-->
  
</div><!--/container-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
function deleteTodo(){
	var size = jQuery("#size").val();
	var todoArray="";
	var todoObject = new Object();
	var count = 0;
	
	
	for(var i = 0; i<size; i++){
		
		if(jQuery("#todolist_"+i).is(":checked") == true){
			todoArray = jQuery("#todolist_"+i).val()+"-"+todoArray;
			count++;
		}
	}
	
	jQuery("#todoArray").val(todoArray);
	
	if(todoArray == ""){
		alert("Choose a delete row");
	}else{
		jQuery("#tran").submit();
		//location.href = "deleteTodo.html?param="+todoArray;
	}

}

function rateTodo(){
	
	var size = jQuery("#size").val();
	var rate = jQuery("#rate").val();
	var todoArray = "";
	var count = 0;
	
	for(var i = 0; i<size; i++){
			
		if(jQuery("#todolist_"+i).is(":checked") == true){
			todoArray = jQuery("#todolist_"+i).val()+"-"+todoArray;
			count++;
		}
	}
	jQuery("#todoArray1").val(todoArray);
	jQuery("#rate").val(rate);
	
	if(todoArray == ""){
		alert("Choose a rate row");
	}else{
		
		location.href = "rateTodo.html?todoArray="+todoArray+"&rate="+rate;
	}
}

</script>
<script src="js/bootstrap.min.js"></script>
</body>

</html>