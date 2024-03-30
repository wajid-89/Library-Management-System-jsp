<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dao.*"%>
<%@page import="daoimpl.*"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>

<%
session = request.getSession();
User user = (User) session.getAttribute("user");
BookDao bookDaoImpl = new BookDaoImpl();
List<Book> allBooks = bookDaoImpl.getAllBook();

IssueDao issuekDaoImpl = new IssueDaoImpl();
List<Issue> allIssueBooks =issuekDaoImpl.getAllIssue();
 
StudentDao studentDaoImpl = new StudentDaoImpl();
List<Student> allIStudents =studentDaoImpl.getAllStudent();
if (user != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<%@include file="links.jsp"%>

</head>
<body>
	<%@ include file="navbar.jsp"%>
	
	 <div class="row" style="margin: 150px;">
	 
	    <div class="col-md-3 col-sm-3 col-xs-6" style="margin: 35px">
	    
		<div class="alert alert-success back-widget-set text-center">                
				<a href="view_book.jsp"> <i class="fa fa-book fa-5x" style="color: green;"></i></a>
				<h3><%=allBooks.size()%></h3>
				<h3>Books</h3>
		  </div>
          </div>
            
      
      <div class="col-md-3 col-sm-3 col-xs-6" style="margin: 35px">
               <div class="alert alert-success back-widget-set text-center">
                         <a href="view_student.jsp">   <i  class="fa fa-graduation-cap fa-5x"></i></a>
                            <h3><%=allIStudents.size() %> </h3>
                           <h3>Students</h3>
          </div>
          </div>

 <div class="col-md-3 col-sm-3 col-xs-6" style="margin: 35px">
                      <div class="alert alert-warning back-widget-set text-center">
                        <a href="view_issued_book.jsp">    <i class="fa fa-fw fa-list-alt icon fa-5x" style="color: red;"></i></a>
                            <h3><%=allIssueBooks.size() %></h3>
                          <h3>Issued Books</h3>
             </div>
             </div>
        </div>              
 <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
             <a href="http://www.linkedin.com/in/wajid-ali4" target="blank"><i class="fa fa-linkedin fa-2x"></i></a> 
             <a href="https://github.com/wajid-89" target="blank"><i class="fa fa-github fa-2x"></i></a>Developed By : Wajid Bajeer</a> 
                </div>

            </div>
        </div>
    </section>
	
	<%@include file="scripts.jsp"%>
</body>
<%
} else {
response.sendRedirect("login.jsp");
}
%>
</html>