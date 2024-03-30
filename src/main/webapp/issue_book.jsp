<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="daoimpl.*" %>
    <%@ page import="java.util.*" %>
 <%
 session=request.getSession();
 User user=(User) session.getAttribute("user");
  
 BookDao bookDaoImpl=new BookDaoImpl();
 List<Book> allBooks=bookDaoImpl.getAllBook();
 if(user != null){
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Issue Book</title>
  <%@ include file="links.jsp" %>
</head>
<body style="font-family: Lora, serif; background-color: #fff;">
	<%@ include file="navbar.jsp"%>
	<div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="Book?action=<%="issue"%>">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">Issue Book</h1>
								<hr style="background-color: rgb(31, 40, 81);">
				   				<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Roll No
											</label><input class="form-control" name="rollNo"
											type="text" style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								 <div class="form-group">
                                           <h2 style="margin-bottom: 10px">Select Books</h2>
                                            <div class="container">
                                               <%for(Book b :allBooks) {%>
                                                    <input style="margin: 10px;" type="checkbox" value=<%=b.getId() %> name="selected" />
                                                 <%=b.getTitle() %> 
                                               <%} %>
                                            </div>
                                           
								<hr style="background-color: #fff;">
								<div class="form-row">
									<div class="col-md-12 content-right">
										<button class="btn btn-primary form-btn" type="submit"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">ADD</button>

										<button class="btn btn-danger form-btn" type="reset"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">
											CANCEL</button>
									</div>
								</div>
							</div>
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



     <%@ include file="scripts.jsp" %>
</body>
</html>
<%}
 else{
	 response.sendRedirect("login.jsp");
 }
%>