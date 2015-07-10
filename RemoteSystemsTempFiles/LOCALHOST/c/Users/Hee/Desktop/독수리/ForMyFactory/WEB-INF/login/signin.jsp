<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Login</h1>
      </div>
      <!-- <div class="modal-body"> -->
      	<c:if test="${not empty param.log_error}">
      		<font color="red">${SPRING_SECURITY_LAST_EXCEPTION.message}</font>
      	</c:if>
      		<c:url value="/j_spring_security_check" var="loginUrl" />
          <form action="${loginUrl}" method="post" class="form col-md-12 center-block">
            <div class="form-group">
              <input type="text" class="form-control input-lg" name="j_username" placeholder="Enter your ID">
            </div>
            <div class="form-group">
              <input type="password" class="form-control input-lg" name="j_password" placeholder="Enter your PW">
            </div>
            <div class="form-group">
              <input type="submit" value="Sign In" class="btn btn-primary btn-lg btn-block"/>
              </span><span><a href="#">Only admin can Sign in</a></span>
            </div>
          </form>
          
   <!--    </div> -->
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true"><a href="javascript:history.back()">Cancel</a></button>
		  </div>	
      </div>
  </div>
  </div>
</div>
	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>