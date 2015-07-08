<!DOCTYPE html>
<html lang="en">

<head>

    
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
                            Spring
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
                

                <div class="container-fluid">
                    <div class="jumbotron">
                        <button type="button" class="btn btn-primary btn-md">To Write</button>
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
                                    <tr class="active">
                                        <td>/index.html</td>
                                        <td>1265</td>
                                        <td>32.3%</td>
                                        <td>$321.33</td>
                                    </tr>
                                    <tr class="success">
                                        <td>/about.html</td>
                                        <td>261</td>
                                        <td>33.3%</td>
                                        <td>$234.12</td>
                                    </tr>
                                  
                                </tbody>
                            </table>
                        </div>
                    </div>
                   <!--  <div class="col-lg-6">
                        <h2>Bootstrap Docs</h2>
                        <p>For complete documentation, please visit <a target="_blank" href="http://getbootstrap.com/css/#tables">Bootstrap's Tables Documentation</a>.</p>
                    </div> -->
                </div>
                <!-- /.row -->

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
