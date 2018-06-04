<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login/css/util.css">
	<link rel="stylesheet" type="text/css" href="login/css/main.css">
<!--===============================================================================================-->
</head>
<%

response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	
	    
	      %>
<body>
	<div id="login-wrapper" class="group has-pw-reset">
    <div class="wrapper">
    <div id="notify">
        <noscript>
            <div class="error-notice">
                <img src="/cPanel_magic_revision_1486056223/unprotected/cpanel/images/notice-error.png" alt="Error" align="left"/>
                JavaScript is disabled in your browser.
                For Webmail to function properly, you must enable JavaScript.
                If you do not enable JavaScript, certain features in Webmail will not function correctly.
            </div>
            </noscript>
        
        
        <div id='login-status' class="error-notice" style="visibility: hidden">
            <div class="content-wrapper">
                <div id="login-detail">
                    <div id="login-status-icon-container"><span class='login-status-icon'></span></div>
                    <div id="login-status-message">You have logged out.</div>
                </div>
            </div>
        </div>
    </div>
    </div></div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="login/images/img-01.png" alt="IMG">
				</div>

				<form action="LoginServlet?name=admin" method="post">
					<span class="login100-form-title">
						AdminLogin
					</span>
                   <!--  <input type="hidden" name="name" value="admin"></input> -->
					<div class="wrap-input100 validate-input" data-validate = "username is required">
						<input class="input100" type="text" name="username" placeholder="UserName">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user-circle" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="PassWord">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="return myFunction()">Login</button>
						<script>
							function myFunction() {
								
								var r=confirm("Confirm Submission");
								if(r==true){
                                return true;
								}
								else{
									return false;
								}
							}
						</script>
					</div>
					<div class="text-center p-t-12">
					<a href="LoginPage.jsp">Back to  main page</a>
							</div>

					<div class="text-center p-t-138">
					
							</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/bootstrap/js/popper.js"></script>
	<script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="login/js/main.js"></script>

</body>
</html>