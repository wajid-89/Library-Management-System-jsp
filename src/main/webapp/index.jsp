<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login </title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.login-container{
margin-top: 5%;
margin-bottom: 5%;
}
.login-form-1{
padding: 5%;
box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
text-align: center;
color: #333;
}

.login-form-2{
padding: 5%;

box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
text-align: center;
color: #fff;
}
.login-container form{
padding: 10%;
}
.btnSubmit
{
width: 50%;
border-radius: 1rem;
padding: 1.5%;
border: none;
cursor: pointer;
}
.login-form-1 .btnSubmit{
font-weight: 600;
color: #fff;
background-color: #0062cc;
}
.login-form-2 .btnSubmit{
font-weight: 600;
color: #0062cc;
background-color: #fff;
}


</style>
</head>
<body style="background-image:url('login/img/libray.jpg'); background-repeat: no-repeat; ">

<div class="container login-container" align="center" style="margin: 300px;" >
                    <div class="text-center">
                  <h4 class="text-dark mb-4">Welcome Back!</h4>
                     </div>
<div class="row">

<div class="col-md-6 login-form-1" >
<h3>Admin Login</h3>
<form action="Handle?action=<%="login"%>" method="post">
<div class="form-group" >
<input type="email" class="form-control" placeholder="Your Email "  value="" name="email"/>
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="Your Password " value="" name="password" />
</div>
<div class="form-group">
<input type="submit" class="btnSubmit" value="Login" />
</div>

</form>
</div>

<div class="col-md-6 login-form-2">
<h3>Student Login</h3>
<form action="StudentHandle?action=<%="login"%>" method="post">
<div class="form-group">
<input type="text" class="form-control" placeholder="Enter Roll No " name="roll-no" />
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="Your Password " name="password"/>
</div>
<div class="form-group">
<input type="submit" class="btnSubmit" value="Login" />
</div>
<!-- 0062cc -->
</form>
</div>
</div>
</div> 
</body>
</html>