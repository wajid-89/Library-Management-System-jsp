<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="daoimpl.*" %>
    <%@ page import="java.util.*" %>
    
<%
session=request.getSession();
User u=(User) session.getAttribute("user");
StudentDao studentDaoImpl=new StudentDaoImpl();
Integer id=Integer.parseInt(request.getParameter("id"));
Student s=studentDaoImpl.getStudentById(id);
if(u !=null){
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<%@ include file="links.jsp" %>
</head>
<body style="font-family: Lora, serif;background-color: #fff;">
    <%@ include file="navbar.jsp" %> 
    <div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="StudentServlet?id=<%=s.getId()%>&&action=<%="update"%>">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">Update Student</h1>
								<hr style="background-color: rgb(31, 40, 81);">
								<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Roll No</label><input
										value="<%=s.getRollNo() %>"	class="form-control" name="rollNo" type="text"
											style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Name</label><input 
								value="<%=s.getName() %>" class="form-control" name="name" type="text"
										style="border-color: rgb(31, 40, 81);">
								</div>
								
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Email</label><input
								value="<%=s.getEmail() %>"		class="form-control" name="email" type="email"
										style="border-color: rgb(31, 40, 81);">
								</div>
								
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Password</label><input 
								value="<%=s.getPassword() %> %>" class="form-control" name="password" type="text"
										style="border-color: rgb(31, 40, 81);">
								</div>
								
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Date Of Birth</label><input
								value="<%=s.getDateOfBirth() %>"		class="form-control" name="date-of-birth" type="date"
										style="border-color: rgb(31, 40, 81);">
								</div>
								 
								 <div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Contact</label><input
								value="<%=s.getContact() %>"		class="form-control" name="contact" type="tel"
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
<%}else{
response.sendRedirect("login.jsp");
}%>