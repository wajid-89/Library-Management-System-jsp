<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student navbar</title>
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
                <a class="navbar-brand" href="student_dashboard.jsp">

                    <img src="assets/img/logo.png" />
                </a>

            </div>

            <div class="right-div">
                <a href="StudentHandle?action=<%="logout"%>" class="btn btn-danger pull-right">LOG OUT</a>
            </div>
        </div>
    </div>
    
    <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="student_dashboard.jsp" class="menu-top-active">DASHBOARD</a></li>
                           
                           
                            
                            <li><a href="student_view_issue.jsp">Issued Books</a></li>
                            <li><a href="student_return_book.jsp">Returned Books</a></li>
                            <li><a href="student_update_profile.jsp">Settings</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
        
</body>
</html>