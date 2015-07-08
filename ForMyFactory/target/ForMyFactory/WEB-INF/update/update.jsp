<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/blog-post.css" rel="stylesheet">

  

</head>

<body>
	<c:set var ="pageNo" value="${param.pageNo}"/>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
            	<c:choose>
                	<c:when test="${pageNo ==1}"> <a class="navbar-brand" href="linux.html">Linux</a></c:when>
                	<c:otherwise><a class="navbar-brand" href="#">Spring</a></c:otherwise>
                </c:choose>
               
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container-fluid">

        <div class="row">
			
            <!-- Blog Post Content Column -->
            <div class="col-md-6 col-md-offset-3">
            	<form:form modelAttribute="item" action="update.html">
            		<form:hidden path="pageNo" />
            	 <h2>
            	 <div class="form-group">
                	<label for = "usr">Title</label>
                	<form:input path="title" class="form-control" maxlength="20" />
                </div>
                </h2>
				
                <!-- Author -->
                <h2>
                <div class="form-group">
                	<label for="usr">by</label>
                	<form:input path="author" class="form-control col-xs-3" maxlength="6" />
                </div>
                </h2>

                <hr>

                <!-- Preview Image -->
                <input type="file" title="Search for a file to add">

                <hr>

                <!-- Post Content -->
                <p>
                <div class="form-group">
				  <label for="comment">Comment:</label>
				 <form:textarea path="contents" class="form-control"  rows="10"/>
				</div>
				</p>
                <hr>
			<button type="submit" class="btn btn-success">Register</button>
			<button type="reset" class="btn btn-warning">Reset</button>
			<button type="button" class="btn btn-info"><a href="javascript:history.back()">Back</a></button>
			</form:form>
			
			
            </div>
        </div>
        <!-- /.row -->
		
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
