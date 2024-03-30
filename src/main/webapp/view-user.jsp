<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*" %>
	<%@ page import="util.Database" %>
	<%@ page import="models.*" %>
	<%@ page import="daoimpl.UserDaoImpl" %>
	<%@ page import="daoimpl.RoleDaoImpl" %>
	<%@ page import="dao.RoleDao" %>
	<%@ page import="dao.UserDAO" %>
	<%
	session=request.getSession();
	User user=(User) session.getAttribute("user");
	
	 UserDAO userDaoImpl=new UserDaoImpl();
	 RoleDao roleDaoImpl=new RoleDaoImpl();
	
	 List<User> allUsers=userDaoImpl.getAllUser();
	 String action="delete";
	if(user !=null){
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>View users</title>
<%@include file="links.jsp"%>

</head>
<body>


	<%@include file="navbar.jsp"%>

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">Users</h2>

				</div>


				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="add_user.jsp" class="btn btn-primary">Add new User</a>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
								        <th>Id</th>
										<th>Name</th>
										<th>Email</th>
										<th>Password</th>
										<th>Created Date</th>
										<th>Created By</th>
										<th>Update Date</th>
										<th>Updated By</th>
										<th>edit</th>
										<th>delete</th>
									</tr>
								</thead>
								<tbody>
								<% for(User u:allUsers){
									Role createdBy=roleDaoImpl.getRoleById(u.getRole().getId());
									
									Role updatedBy=roleDaoImpl.getRoleById(u.getRole().getId());
									%>
									<tr>
						                <td><%=u.getId() %></td>
										<td><%=u.getName() %></td>
										<td><%=u.getEmail() %></td>
										<td><%=u.getPassword() %></td>
										<td><%=u.getCreateDate() %></td>
										<td><%=createdBy.getRole() %></td>
										<td><%=u.getUpdateDate()%></td>
										<td><%=updatedBy.getRole()%></td>
										<td style="width: 36px;"><a href="update-user.jsp?id=<%=u.getId() %>"
											style="text-decoration: none; font-weight: bold;"><i class="fa fa-edit ">update</i></a></td>

										<td style="width: 36px; height: 49px;"> 
										
										<!--  <a href="#"
											style="color: red; font-weight: bold;"></a>-->
											
										<a href="User?id=<%=u.getId() %>&&action=<%=action %>"
				                  style="text-decoration: none; font-weight: bold; color: red;"><i class="fa fa-pencil">delete</i></a></td>
									</tr>
									<% }%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
<%@include file="scripts.jsp"%>
</body>
</html>
	<%}else{response.sendRedirect("login.jsp");
	} %>