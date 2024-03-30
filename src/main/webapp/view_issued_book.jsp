<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="dao.*" %>
     <%@ page import="models.*" %>
      <%@ page import="daoimpl.*" %>
       <%@ page import="java.util.*" %>
    <%
    session=request.getSession();
    User u=(User)session.getAttribute("user");
    
    IssueDao issueDaoImpl=new IssueDaoImpl();
    List<Issue> issuedBooks=issueDaoImpl.getAllIssue();
    
    StudentDao studentDaoImpl=new StudentDaoImpl();
    BookDao bookDaoImpl=new BookDaoImpl();
  
    UserDAO userDaoImpl=new UserDaoImpl();
    
    if(u!=null){
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view issued books</title>
<%@ include file="links.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">Issued Books</h2>

				</div>


				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="issue_book.jsp" class="btn btn-primary">Issue Book</a>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<%
								if (issuedBooks.size() > 0) {
								%>
								<thead>
									<tr>
									    <th>Id</th>
										<th>Book</th>
										
										<th>Student</th>
										<th>Issue Date</th>
										<th>Issued By</th>
										<th>update</th>
										<th>delete</th>
									</tr>
								</thead>
								<tbody>
									<%for(Issue issue:issuedBooks) {
									Student student=studentDaoImpl.getStudentById(issue.getStudent().getId());
									Book book=bookDaoImpl.getBookById(issue.getBook().getId());
									User user=userDaoImpl.getUserById(issue.getIssuedBy().getId());
									%>
									<tr>
										<td><%=issue.getId() %></td>
										<td><%=book.getTitle() %></td>
										<td><%=student.getName() %></td>
										<td><%=issue.getIssueDate() %></td>
										<td><%=user.getName() %></td>
										
										<td style="width: 36px;"><a href=""
											style="text-decoration: none; font-weight: bold;"><i
												class="fa fa-edit ">update</i></a></td>

										<td style="width: 36px; height: 49px;">
											<!--  <a href="#"
											style="color: red; font-weight: bold;"></a>--> <a href="Book?id=<%=issue.getId()%>&&action=<%="deleteIssue" %>"
											style="text-decoration: none; font-weight: bold; color: red;"><i
												class="fa fa-pencil">delete</i></a>
										</td>
									</tr>
									<%} %>
							
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
				<h1>No Books</h1>
			</center>
			<%
			}
			%>

		</div>
	</div>
	<%@ include file="scripts.jsp"%>

</body>
</html>
<% 
    } else{
    response.sendRedirect("login.jsp");	
    }
%>