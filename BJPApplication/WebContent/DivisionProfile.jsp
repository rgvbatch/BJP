<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.dao.ConnectionSteps"%>
<%@page import="com.java.userbean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="500(2).jsp" %>
<!DOCTYPE html>
<html>
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>MY EDIT</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
 

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script>

    window.history.forward();

</script>
<script type="text/javascript">
  function AllowNumbersOnly(e) {
    var code = (e.which) ? e.which : e.keyCode;
    if (code > 31 && (code < 48 || code > 57)) {
      e.preventDefault();
    }
  }
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%
		Userbean user = (Userbean) session.getAttribute("DivisionSession");
	%>
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
     
      <span class="logo-lg"><b><%=user.getDivision() %></span>
      
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- inner menu: contains the actual data -->
          <!-- Notifications: style can be found in dropdown.less -->
          <!-- Tasks: style can be found in dropdown.less -->
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/admin.jpg" class="user-image" alt="User Image">
              
              <%if(user.getMiddlename()!=null) {%>
              <span class="hidden-xs"><%=user.getFirstname() %> <%=user.getMiddlename() %> <%=user.getLastname() %></span>
              <%}else{ %>
              <span class="hidden-xs"><%=user.getFirstname() %> <%=user.getLastname() %></span>
              <%} %>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/admin.jpg" class="img-circle" alt="User Image">
                 </br>
                 <%if(user.getMiddlename()!=null) {%>
                 <%=user.getFirstname() %> <%=user.getMiddlename() %> <%=user.getLastname() %>
                 <%}else{ %>
                 <%=user.getFirstname() %> <%=user.getLastname() %>
                 <%} %></br>
                  <small><%=user.getEmail() %></small></br>
                  <small><%=user.getMobile() %></small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
             <li class="user-footer">
                <div class="pull-left">
                  <a href="DivisionProfile.jsp" class="btn btn-default btn-flat">EditProfile</a>
                </div>
                <div class="pull-right">
                  <a href="DivisionLogout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/admin.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%if(user.getMiddlename()!=null) {%>
                 <%=user.getFirstname() %> <%=user.getMiddlename() %> <%=user.getLastname() %>
                 <%}else{ %>
                 <%=user.getFirstname() %> <%=user.getLastname() %>
                 <%} %></p>
        </div>
      </div>
      <!-- search form -->
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="active">
          <a href="DivisionHome.jsp">
            <i class="fa fa-dashboard"></i> <span>Home</span>
            <span class="pull-right-container">

            </span>
          </a>
        </li>
      <li class="active">
          <a href="AddProblems.jsp">
            <i class="fa fa-star"></i> <span>Add Problems</span>
            
          </a>
      </li>
	  <li class="active">
          <a href="ViewDivisionProblems.jsp">
            <i class="fa fa-star"></i> <span>View Problems</span>
           
          </a>
      </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="background: url(images/img66.png)"no-repeat;>
    <!-- Content Header (Page header) -->
    

			<div class="form">
     
     <div class="container">
            <form action="LoginServlet?name=editdivprofile" method="post" class="form-horizontal" role="form">
                <h2>Edit Profile</h2>
				
				<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Constitution<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Add Constitution" name="constitution"  value=<%=user.getConstitution() %>  readonly= "readonly"  class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Division<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Add Constitution" name="division"  value=<%=user.getDivision() %>  readonly= "readonly"  class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="First Name" name="firstname" value=<%=user.getFirstname() %> class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <%if(user.getMiddlename()==null) {%>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Middle Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Middle Name" name="middlename"  class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
			
                <%}else{ %>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Middle Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Middle Name" name="middlename" value=<%=user.getMiddlename() %>  class="form-control" autocomplete="off" autofocus>   
                    </div>
                </div>
               
                <%} %>
				<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Last Name<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Last Name" name="lastname"   value=<%=user.getLastname() %>  class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">User Name<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="User Name" name="username" value=<%=user.getUsername() %> class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Password<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Password" name="password"  value=<%=user.getPassword()%> class="form-control" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Email<span class="req">*</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName"  placeholder="Email" name="email" value=<%=user.getEmail() %> class="form-control" pattern="[a-z0-9._%+-]*[@]\b((yahoo.com)||(hotmail.com)||(gmail.com)||(outlook.com))" required autocomplete="off" autofocus>   
                    </div>
                </div>
                <!-- <div class="form-group">
                    <label class="control-label col-sm-3">Gender<span class="req">*</span></label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="radio-inline">
                                 <label><input type="radio" name="gender" value="F" required autocomplete="off">Female</label>
                             </div>
                             <div class="radio-inline">
                                 <label><input type="radio" name="gender" value="M" required autocomplete="off">Male</label>
                             </div>
                        </div>
                    </div>
                </div> /.form-group -->
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Mobile<span class="req" >*</span></label>
                    <div class="col-sm-9">
                        <input type="text" name="mobile" id="phone" placeholder="Mobile Number" value=<%=user.getMobile() %> class="form-control" onkeypress = "return AllowNumbersOnly(event)" required autocomplete="off" autofocus maxlength="10" minlength="10">   
                    </div>
                </div>
                <div class="form-group">
                    
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block" onclick="myFunction()">Submit</button>
                    </div>
                </div>
				
            </form> <!-- /form -->
       
        </div> <!-- ./container -->
          
		  

        </div>
        
        
        
      </div><!-- tab-content -->
  <!-- /.content-wrapper -->
  <!-- <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
