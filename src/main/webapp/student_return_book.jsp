<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="daoimpl.*" %>
    <%@ page import="java.util.*" %>
    <%
    
    session=request.getSession();
    Student s=(Student)session.getAttribute("student");
    

    
    StudentDao studentDaoImpl=new StudentDaoImpl();
    BookDao bookDaoImpl=new BookDaoImpl();
    IssueDao issueDaoImpl=new IssueDaoImpl();
     UserDAO userDAO=new UserDaoImpl();    
   CategoryDao categoryDao=new CategoryDaoImpl();
    if(s!=null){
    	List<Issue> issuedBooks=issueDaoImpl.getAllReturnBookByStudent(s.getId());
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>return books</title>
<%@ include file="links.jsp"%>
</head>
<body>
	<%@ include file="student_navbar.jsp"%>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">My Returned Books</h2>

				</div>


					<div class="panel panel-default">
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
									    <th>Category</th>
										<th>Issue Date</th>
										<th>Issued By</th>
										<th>Return Date</th>
									    <th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<%for(Issue issue:issuedBooks) {
									
									Book book=bookDaoImpl.getBookById(issue.getBook().getId());
									
									Student student=studentDaoImpl.getStudentById(issue.getStudent().getId());
									User u=userDAO.getUserById(issue.getIssuedBy().getId());
									Category category=categoryDao.getCategoryById(book.getCategory().getId());
									%>
									<tr>
									<td><%=issue.getId() %></td>
									    <td><%=book.getTitle() %></td>
										<td><%=category.getCategory() %></td>
										<td><%=issue.getIssueDate() %></td>
										<td><%=u.getName() %></td>
										<td><%=issue.getReturnDate() %></td>
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
<%}else{
	response.sendRedirect("index.jsp");
}
%>