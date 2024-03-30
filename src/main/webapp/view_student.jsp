<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="daoimpl.*" %>
    <%@ page import="java.util.*"%>
    <%
    session=request.getSession(); 
    User u =(User) session.getAttribute("user");

    StudentDao studentDaoImpl=new StudentDaoImpl();
    RoleDao roleDao=new RoleDaoImpl();
List<Student> students=studentDaoImpl.getAllStudent();   
    if(u !=null){
    	
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Students</title>
<%@ include file="links.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">Students</h2>

				</div>


				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="add_student.jsp" class="btn btn-primary">Add New Student</a>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<%
								if (students.size() > 0) {
								%>
								<thead>
									<tr>
										<th>Roll No#</th>
										<th>Name</th>
										<th>Date Of Birth</th>
										<th>Contact</th>
										<th>Email</th>
										<th>Password</th>
										<th>Created By</th>
										<th>Create Date</th>
										<th>edit</th>
										<th>delete</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Student s : students) {
						     	Role createdBy  = roleDao.getRoleById(s.getCreatedBy().getId());
									%>
									<tr>
										
										<td><%=s.getRollNo()%></td>
										<td><%=s.getName() %></td>
										<td><%=s.getDateOfBirth() %></td>
										<td><%=s.getContact() %></td>
										<td><%=s.getEmail()%></td>
										<td><%=s.getPassword() %></td>
										<td><%=createdBy.getRole() %></td>
										<td><%=s.getCreateDate() %></td>
										<td style="width: 36px;"><a href="update_student.jsp?id=<%=s.getId()%>"
											style="text-decoration: none; font-weight: bold;"><i
												class="fa fa-edit ">update</i></a></td>

										<td style="width: 36px; height: 49px;">
											<a href="StudentServlet?id=<%=s.getId() %>&&action=<%="delete" %>"
											style="text-decoration: none; font-weight: bold; color: red;"><i
												class="fa fa-pencil">delete</i></a>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
			<%
			} else {
			%>
			<center>
				<h1>No Students</h1>
			</center>
			<%
			}
			%>

		</div>
	</div>


<%@ include file="scripts.jsp"%>
</body>
</html>
<%} else{
response.sendRedirect("login.jsp");
}%>