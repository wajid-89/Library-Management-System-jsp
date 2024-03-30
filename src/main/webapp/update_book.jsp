<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="daoimpl.*" %>
    <%@ page import="java.util.*" %>
    <%
    session=request.getSession();
    User user=(User)session.getAttribute("user");
    Integer id=Integer.parseInt(request.getParameter("id"));
    
    BookDao bookDaoImpl=new BookDaoImpl();
    Book book=bookDaoImpl.getBookById(id);
    
    CategoryDao categoryDaoImpl=new CategoryDaoImpl();
    
    List<Category> allCategories=categoryDaoImpl.getAllCategory();
    
    Category category=categoryDaoImpl.getCategoryById(book.getCategory().getId());
    if(user != null){
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update book</title>
<%@ include file="links.jsp" %>
</head>
<body style="font-family: Lora, serif;background-color: #fff;">
    <%@ include file="navbar.jsp" %> 
    <div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="Book?id=<%=book.getId()%>&&action=<%="update"%>">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">Update Book</h1>
								<hr style="background-color: rgb(31, 40, 81);">
								<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Title</label><input
										value="<%=book.getTitle() %>"	class="form-control" name="title" type="text"
											style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Author</label><input 
								value="<%=book.getAuthor() %>" class="form-control" name="author" type="text"
										style="border-color: rgb(31, 40, 81);">
								</div>
								 <div class="form-group">
                                            <label style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Category</label>
                                            <select class="form-control" name="category" class="custom-select"
										style="color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">
                                             
											  <optgroup label="Select Category">
                                
                                <%for(Category c: allCategories){
                                	if(c.getCategory().equalsIgnoreCase(category.getCategory())){}else{
                                	
                                	%>
                                	<option value="<%=c.getCategory() %>" selected=<%=category.getCategory() %>><%=c.getCategory() %></option>
                                
                                <%}} %>
                                

                                 <option value="<%=category.getCategory() %>" selected=<%=category.getCategory() %>><%=category.getCategory() %></option>
                                
                                
                                </optgroup></select></div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">No Of Copies</label><input
								value="<%=book.getNoOfCopies() %>"		class="form-control" name="no-of-copies" type="text"
										style="border-color: rgb(31, 40, 81);">
								</div>
								 
                                <hr style="background-color: #fff;">
								<div class="form-row">
									<div class="col-md-12 content-right">
										<button class="btn btn-primary form-btn" type="submit"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">UPDATE </button>
										
										<button class="btn btn-danger form-btn" type="reset"
											style="background-color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);"> CANCEL
										</button>
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
<%}else{
	response.sendRedirect("login.jsp");
}%>