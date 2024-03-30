<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <%@include file="links.jsp" %>
</head>
<body>
    <div class="navbar navbar-inverse set-radius-zero" >
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.jsp">

                    <img src="assets/img/logo.png" />
                </a>

            </div>

            <div class="right-div">
                <a href="Handle?action=<%="logout"%>" class="btn btn-danger pull-right">LOG OUT</a>
            </div>
        </div>
    </div>
    
    <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="dashboard.jsp" class="menu-top-active">DASHBOARD</a></li>
                            <li><a href="view-user.jsp">User</a></li>
                            <li><a href="view_student.jsp">Students</a></li>
                            <li><a href="view_category.jsp">Category</a></li>
                            <li><a href="view_book.jsp">Books</a></li>
                             <li><a href="view_issued_book.jsp">Issued Books</a></li>
                            <li><a href="update_profile.jsp">Settings</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
        
             
 <%@include file="scripts.jsp" %>
  
</body>
</html>