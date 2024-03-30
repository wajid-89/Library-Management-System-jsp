<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <%@ page import="dao.UserDAO" %>
    <%@ page import="dao.RoleDao" %>
    <%@ page import="daoimpl.UserDaoImpl" %>
    <%@ page import="daoimpl.RoleDaoImpl" %>
    <%@ page import="java.util.*" %>
    
    <% 
    session=request.getSession();
 User user=(User) session.getAttribute("user");
   
 String action="update";
    if(user != null){
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update user</title>
<%@ include file="links.jsp" %> 
<%
RoleDao roleDaoImpl=new RoleDaoImpl();
UserDAO userDaoImpl=new UserDaoImpl();

Integer id=Integer.parseInt(request.getParameter("id"));
User u=userDaoImpl.getUserById(id);

List<Role> allRoles=roleDaoImpl.getAllRole();
  Role userRole=roleDaoImpl.getRoleById(u.getRole().getId());
%>
</head>
<body style="font-family: Lora, serif;background-color: #fff;">
    <%@ include file="navbar.jsp" %> 
    <div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="User?id=<%=u.getId() %>&&action=<%=action%>">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">Update User</h1>
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
								value="<%=u.getPassword() %>"		class="form-control" name="password" type="password"
										style="border-color: rgb(31, 40, 81);">
								</div>
								 <div class="form-group">
                                            <label style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Role</label>
                                            <select class="form-control" name="role" class="custom-select"
										style="color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">
                                             
											  <optgroup label="Select Role">
                                
                                <%for(Role role: allRoles){
                                	if(role.getRole().equalsIgnoreCase(userRole.getRole())){}else{
                                	
                                	%>
                                	<option value="<%=role.getRole() %>" selected=""><%=role.getRole() %></option>
                                
                                <%}} %>
                                
                                <% System.out.print(userRole.getRole()); %>
                                 
                                <option value="<%=userRole.getRole() %>" selected=""><%=userRole.getRole() %></option>
                                
                                </optgroup></select></div>
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
<% }else{
response.sendRedirect("login.jsp");}%>