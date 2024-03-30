<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
<%@ page import="dao.*" %>
<%@ page import="daoimpl.*" %>
    <%
    session=request.getSession();
    User u=(User) session.getAttribute("user");
    UserDAO userDAO=new UserDaoImpl(); 
    if(u != null){
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update profile</title>
<%@ include file="links.jsp" %>
</head>
<body style="font-family: Lora, serif;background-color: #fff;">
<%@ include file="navbar.jsp" %>
  <div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">MY PROFILE</h1>
								<hr style="background-color: rgb(31, 40, 81);">
								<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Name</label><input
										value="<%=u.getName() %>"	class="form-control" name="name" type="text"
											style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Email</label><input 
								value="<%=u.getEmail() %>"		class="form-control" name="email" type="email"
										style="border-color: rgb(31, 40, 81);">
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Password</label><input
								value="<%=u.getPassword() %>"		class="form-control" name="password" type="text"
										style="border-color: rgb(31, 40, 81);">
								</div>
								
                                <hr style="background-color: #fff;">
								<div class="form-row">
									<div class="col-md-12 content-right">
										<button class="btn btn-primary form-btn" type="submit"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">UPDATE </button>
										
										<button class="btn btn-danger form-btn" type="reset"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);"> CANCEL
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
 
<%@ include file="scripts.jsp" %>
</body>
</html>
<%}
else{
	response.sendRedirect("index.jsp");
}
%>