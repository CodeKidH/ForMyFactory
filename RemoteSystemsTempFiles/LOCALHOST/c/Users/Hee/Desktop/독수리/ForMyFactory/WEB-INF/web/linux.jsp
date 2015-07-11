<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<title>DevHee</title>
    
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <%@ include file="../include/header.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Linux
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Tables
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				
               
                <div class="container-fluid">
                    <div class="jumbotron">
                    <a href = "create.html?pageNo=${param.pageNo}">
                        <button type="button" class="btn btn-primary btn-md" >
	                        	To Write
                        </button>
                    </a>
                        <div class="jumbotron">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th class="col-md-2">PageNo</th>
                                        <th class="col-md-6">Title</th>
                                        <th class="col-md-2">Writer</th>
                                        <th class="col-md-2">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                              <c:forEach items="${itemList}" var="item">
                                    <tr class="active">
                                        <td>${item.pageNo}</td>
                                        <td><a href = "detail.html?itemId=${item.pageNo}&pageNo=${param.pageNo}">${item.title}</a></td>
                                        <td>${item.author}</td>
                                        <td>${item.today}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                   <!--  <div class="col-lg-6">
                        <h2>Bootstrap Docs</h2>
                        <p>For complete documentation, please visit <a target="_blank" href="http://getbootstrap.com/css/#tables">Bootstrap's Tables Documentation</a>.</p>
                    </div> -->
                </div>

            </div>
            <!-- /.container-fluid -->
		
        </div>
        <!-- /#page-wrapper -->
	  <%@include file = "../include/footer.jsp" %>
    </div>
   
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
