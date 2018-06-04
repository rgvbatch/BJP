<!DOCTYPE html>
<%@page import="com.java.userbean.Userbean"%>
<%@page import="com.java.dao.ConnectionSteps"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="500.jsp" %>
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
  <title>View Divisions</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
  <style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<%
		Userbean user = (Userbean) session.getAttribute("AdminSession");
%>
<div class="wrapper">

    <header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b></span>
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
              
              <!-- Menu Footer-->
               <li class="user-footer">
                <div class="pull-left">
                  <a href="AdminProfile.jsp" class="btn btn-default btn-flat">EditProfile</a>
                </div>
                <div class="pull-right">
                  <a href="AdminLogout.jsp" class="btn btn-default btn-flat">Sign out</a>
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
						<img src="dist/img/admin.jpg" class="img-circle"
							alt="User Image">
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
          <a href="AdminHome.jsp">
            <i class="fa fa-dashboard"></i> <span>Home</span>
            <span class="pull-right-container">

            </span>
          </a>
        </li>
<li class="active treeview">
          <a href="#">
            <i class="fa fa-star"></i> <span>Constitutions</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
							<li class="active"><a href="AddConstitutions.jsp"><i
									class="fa fa-plus-square"></i> Add Constitutions</a></li>
							<li><a href="ViewConstitution.jsp"><i
									class="fa fa-circle-o"></i> View Constitutions</a></li>
						</ul>
        </li>
		<li class="treeview">
          <a href="#">
            <i class="fa fa-star"></i> <span>Divisions</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
							<li class="active"><a href="AddDivisions.jsp"><i
									class="fa fa-plus-square"></i> Add Divisions</a></li>
							<li><a href="ViewDivision.jsp"><i class="fa fa-circle-o"></i>
									View Divisions</a></li>
						</ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"  style="background: url(images/img11.jpg)"no-repeat;>
    <!-- Content Header (Page header) -->
    
    <!-- Main content -->
   
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-8">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title" align="center">Divisions</h3>

              
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
			<div class="table-responsive mailbox-messages">
              <div class="box-body  no-padding">
              <form action="DeleteDivisions.jsp" method="post" id="form">
              <table class="table table-hover" id="customers">
                <tr>
			    <th>
				  <div class="table table-hover"">
                   <!-- Check all button -->
                   <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                  </button>
                  <div class="btn-group">
                    <button type="submit" class="btn btn-default btn-sm" form="form"><i class="fa fa-trash-o"></i></button>
                  </div>
                  </div>
				</th>
                <th>S.NO</th>
                                        <th>Division Name</th>
										<th>Constitution Name</th>
										
										<th>No. Of problems</th>
                </tr>
                
               <%
										try {
											ConnectionSteps steps = new ConnectionSteps();
											Connection conn = steps.connection();
											PreparedStatement pstmt = conn
													.prepareStatement("select constitutiontable.constitution,divisiontable.division, count(problemtable.division) FROM constitutiontable INNER JOIN divisiontable  ON constitutiontable.constitution=divisiontable.constitution LEFT JOIN problemtable  ON  divisiontable.constitution=problemtable.constitution and divisiontable.division=problemtable.division group by constitutiontable.constitution,divisiontable.division,problemtable.division");
											ResultSet rs = pstmt.executeQuery();
											int i = 0;
											while (rs.next()) {
												int rowCount = rs.getInt(3);
												
												i++;
									%>
               <tr>
										<td><input type="checkbox"  name="check" value="<%=rs.getString("division") %>">
										<input type="hidden"  name="check1" value="<%=rs.getString("constitution") %>"></td>
										
										<td><%=i%></td>
										<td><%=rs.getString("division")%></td>
										<td><%=rs.getString("constitution")%></td>
										
										<td><%=rowCount%></td>

									</tr>
                <%
											}
											} catch (Exception e) {
												System.out.println(e);
											}
										%>
                 
                 
                  
                </table>
                </form>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
           
                <!-- /.btn-group -->
                
                <!-- /.pull-right -->
              </div>
            </div>
          
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
	
  </div>
  <!-- /.content-wrapper -->
 

  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  
  <script  src="js/index.js"></script>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- Page Script -->
<script>
  $(function () {
    //Enable iCheck plugin for checkboxes
    //iCheck for checkbox and radio inputs
    $('.mailbox-messages input[type="checkbox"]').iCheck({
      checkboxClass: 'icheckbox_flat-blue',
      radioClass: 'iradio_flat-blue'
    });

    //Enable check and uncheck all functionality
    $(".checkbox-toggle").click(function () {
      var clicks = $(this).data('clicks');
      if (clicks) {
        //Uncheck all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
      } else {
        //Check all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("check");
        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
      }
      $(this).data("clicks", !clicks);
    });

    //Handle starring for glyphicon and font awesome
    $(".mailbox-star").click(function (e) {
      e.preventDefault();
      //detect type
      var $this = $(this).find("a > i");
      var glyph = $this.hasClass("glyphicon");
      var fa = $this.hasClass("fa");

      //Switch states
      if (glyph) {
        $this.toggleClass("glyphicon-star");
        $this.toggleClass("glyphicon-star-empty");
      }

      if (fa) {
        $this.toggleClass("fa-star");
        $this.toggleClass("fa-star-o");
      }
    });
  });
</script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
