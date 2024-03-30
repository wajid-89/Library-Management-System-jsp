<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="daoimpl.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@ page import="models.*"%>
<%
session = request.getSession();
Student student = (Student) session.getAttribute("student");
if (student != null) {
	IssueDao issueDao = new IssueDaoImpl();
	List<Issue> list = issueDao.getAllRequestsByStudentId(student.getId());

	List<Issue> listReturn = issueDao.getAllReturnBookByStudent(student.getId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student dashboard</title>
<%@include file="links.jsp"%>
</head>
<body>
	<%@ include file="student_navbar.jsp"%>



	<div class="row" style="margin: 15px;" align="center">

		<div class="col-md-3 col-sm-3 col-xs-6" style="margin: 185px">
			<div class="alert alert-success back-widget-set text-center">
				<a href="student_view_issue.jsp"> <i class="fa fa-book fa-5x"></i></a>
				<h3><%=list.size()%>+</h3>
				<h3>Issued Books</h3>
			</div>
       </div>
		<div class="col-md-3 col-sm-3 col-xs-6" style="margin: 185px">

			<div class="alert alert-info back-widget-set text-center">
				<a href="student_return_book.jsp"><i class="fa fa-undo fa-5x" style="color:green;"></i></a>
				<h3><%=listReturn.size()%>+&nbsp;
				</h3>
				<h3>Returned Books</h3>
			</div>
		</div>

	</div>

 <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
             <a href="http://www.linkedin.com/in/wajid-ali4" target="blank"><i class="fa fa-linkedin fa-2x"></i></a> Developed By : Wajid Bajeer</a> 
                </div>

            </div>
        </div>
    </section>

	<%@include file="scripts.jsp"%>
</body>
</html>
<%
} else {
response.sendRedirect("index.jsp");
}
%>