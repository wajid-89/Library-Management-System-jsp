<%@page import="daoimpl.RoleDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="models.*" %>  
  <%@ page import="dao.CategoryDao" %>
  <%@ page import="daoimpl.CategoryDaoImpl" %>
  <%@ page import="dao.RoleDao" %>
  <%@ page import="daoimpl.CategoryDaoImpl" %>
  <%@ page import="java.util.*" %>
  
    <%
    
    session=request.getSession();
    User user=(User) session.getAttribute("user");
    CategoryDao categoryDaoImpl=new CategoryDaoImpl();
    List<Category> allCategories=categoryDaoImpl.getAllCategory();
    RoleDao roleDaoImpl=new RoleDaoImpl();
    String action="delete";
    if(user!=null){
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view category</title>
<%@ include file="links.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">Categories</h2>

				</div>


				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="add_category.jsp" class="btn btn-primary">Add New Category</a>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
								        <th>Id</th>
										<th>Name</th>
										
										<th>edit</th>
										<th>delete</th>
									</tr>
								</thead>
								<tbody>
						<% for(Category category:allCategories){ 
						Role created_by=roleDaoImpl.getRoleById(category.getCreatedBy().getId());
						Role updated_by=roleDaoImpl.getRoleById(category.getUpdatedBy().getId());
					         %>
									<tr>
									<td><%=category.getId() %></td>
										<td><%=category.getCategory() %></td>
										
										<td style="width: 36px;"><a href="update_category.jsp?id=<%=category.getId() %>"
											style="text-decoration: none; font-weight: bold;"><i class="fa fa-edit ">update</i></a></td>

										<td style="width: 36px; height: 49px;"> 
										
										<!--  <a href="#"
											style="color: red; font-weight: bold;"></a>-->
											
										<a href="CategoryServlet?id=<%=category.getId()%>&&action=<%=action %>"
				                  style="text-decoration: none; font-weight: bold; color: red;"><i class="fa fa-pencil">delete</i></a></td>
									</tr>
								<%} %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>



<%@ include file="scripts.jsp" %>
</body>
</html>
<%}else{
	response.sendRedirect("login.jsp");
} %>