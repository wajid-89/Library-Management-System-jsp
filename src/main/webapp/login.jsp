<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <% String action = "login"; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="login/css/login.css">
	<title>Login Page</title>
</head>

<body style="background-image:url('login/img/libray.jpg'); ">

	<form action="Handle?action=<%=action%>" method="post">
		<div class="login-box">
			<h1>Login</h1> 

			<div class="textbox">
				<i class="fa fa-user" aria-hidden="true"></i>
				<input type="email" placeholder="email"
						name="email" value="">
			</div>

			<div class="textbox">
				<i class="fa fa-lock" aria-hidden="true"></i>
				<input type="password" placeholder="Password"
						name="password" value="">
			</div>

			<input class="button" type="submit"
					name="login" value="Sign In">
		</div>
	</form>
</body>

</html>
