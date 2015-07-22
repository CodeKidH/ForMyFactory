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
    
    <div class="col-md-8">
      <hr>
   		
        <ul class="nav nav-justified">
 			<li><a href="#" data-toggle="modal" data-target="#delete"><i class="glyphicon glyphicon-cog"></i></a></li>
 			<li><a title="Add Widget" data-toggle="modal" href="#addWidgetModal" data-target="#add"><span class="glyphicon glyphicon-plus-sign"></span></a></li>
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
		
		<div id="delete" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!--delete-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Delete</h4>
		      </div>
		      <div class="modal-body">
		       <p> Are you sure selected data is deleted?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-default" >Submit</button>
		      </div>
		    </div>
		
		  </div>
		</div>
	  
      <hr>
      	  <a href="#"><strong><i class="glyphicon glyphicon-list-alt"></i>To Do</strong></a>
       <table class="table table-striped">
        <thead>
          <tr><th></th><th>Num</th><th>Date</th><th>Rate</th><th>Description and Notes</th></tr>
        </thead>
        <tbody>
        <%--   <c:forEach items="${todoList}" var="todo"> --%>
          <tr>
       		<td>
       			<input type="checkbox" value="">
          	</td>
          	<td>
          	</td>
          	<td>
          	</td>
	      	<td>
				<div class="progress">
                 	<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100" style="width: 0%"> </div>
                </div>
            </td>
            <td>
           		 ${todo.note}
            </td>
         </tr>
      <%--    </c:forEach> --%>
        </tbody>
      </table>
      
          
    </div>
     <div class="col-md-4">
      <hr>
      <ul class="nav nav-justified">
			<li><a href="#"  data-toggle="modal" data-target="#delete2"><i class="glyphicon glyphicon-cog"></i></a></li>
		</ul>  
		
      <hr>    
       <a href="#"><strong><i class="glyphicon glyphicon-list-alt"></i>Done</strong></a> 
       <table class="table table-striped">
        <thead>
          <tr><th></th><th>Num</th><th>Description and Notes</th></tr>
        </thead>
        <tbody>
         <tr>
          	<td>
          		<input type="checkbox" value="">
          	</td>
          	<td>
          	</td>
	      	<td>
	      		<strong>Success</strong>
            <td>
           </td>
         </tr>
        </tbody>
      </table>
    </div>
    
    <div id="delete2" class="modal fade" role="dialog">
		  <div class="modal-dialog">
			
		    <!--delete-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Delete</h4>
		      </div>
		      <div class="modal-body">
		       <p>Congraturation!!</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-default" >Submit</button>
		      </div>
		    </div>
			
		  </div>
		</div>
    	
   
    	
  </div><!--/row-->
  
</div><!--/container-->
<!-- /Main -->
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
<script type="text/javascript">
	function openAdd(){
		var o =  {}
		var goal = prompt(o,pop);
		function pop(){}
		alert('hell');
	}
	
</script>
</html>