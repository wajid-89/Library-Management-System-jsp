<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="models.*"%>
<%@ page import="dao.BookDao"%>
<%@ page import="daoimpl.BookDaoImpl"%>
<%@ page import="dao.CategoryDao"%>
<%@ page import="daoimpl.CategoryDaoImpl"%>
<%@ page import="java.util.*"%>

<%
session = request.getSession();
User user = (User) session.getAttribute("user");
CategoryDao categoryDaoImpl = new CategoryDaoImpl();
BookDao bookDaoImpl = new BookDaoImpl();
List<Book> allBooks = bookDaoImpl.getAllBook();

if (user != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view books</title>
<%@ include file="links.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-11.5">
					<h2 class="header-line" align="center">Books</h2>

				</div>


				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="add_book.jsp" class="btn btn-primary">Add New Book</a>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<%
								if (allBooks.size() > 0) {
								%>
								<thead>
									<tr>
										<th>Id</th>
										<th>Title</th>
										<th>Author</th>
										<th>Category</th>
										<th>No OF Copies</th>
										<th>edit</th>
										<th>delete</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Book book : allBooks) {
										Category c = categoryDaoImpl.getCategoryById(book.getCategory().getId());
									%>
									<tr>
										<td><%=book.getId()%></td>
										<td><%=book.getTitle()%></td>
										<td><%=book.getAuthor()%></td>
										<td><%=c.getCategory()%></td>
										<td><%=book.getNoOfCopies()%></td>
										<td style="width: 36px;"><a href="update_book.jsp?id=<%=book.getId() %>"
											style="text-decoration: none; font-weight: bold;"><i
												class="fa fa-edit ">update</i></a></td>

										<td style="width: 36px; height: 49px;">
											<!--  <a href="#"
											style="color: red; font-weight: bold;"></a>--> <a href="Book?id=<%=book.getId()%>&&action=<%="delete" %>"
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
} else {
response.sendRedirect("login.jsp");
}
%>