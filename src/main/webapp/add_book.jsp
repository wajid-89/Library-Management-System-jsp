<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="models.*"%>
<%@ page import="dao.*"%>
<%@ page import="daoimpl.*"%>
<%@ page import="java.util.*"%>
<%
session = request.getSession();
User u = (User) session.getAttribute("user");
CategoryDao categoryDaoImpl = new CategoryDaoImpl();
List<Category> allCategories = categoryDaoImpl.getAllCategory();

if (u != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<%@ include file="links.jsp"%>
</head>
<body style="font-family: Lora, serif; background-color: #fff;">
	<%@ include file="navbar.jsp"%>
	<div class="article-clean" style="margin-left: 400px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
					<div class="intro"></div>
					<form method="post" action="Book?action=<%="add"%>">
						<div class="form-row profile-row">
							<div class="col-md-8">
								<h1 class="text-center" style="color: rgb(31, 40, 81);">Book</h1>
								<hr style="background-color: rgb(31, 40, 81);">
								<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Book
											Title</label><input class="form-control" name="title"
											type="text" style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								<div class="form-row">
									<div class="col">
										<label
											style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Author</label><input
											class="form-control" name="author" type="text"
											style="border-color: rgb(31, 40, 81);">
									</div>
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">Category</label>
									<select class="form-control" name="category"
										class="custom-select"
										style="color: rgb(31, 40, 81); border-color: rgb(31, 40, 81);">
										<%
										for (Category c : allCategories) {
										%>
										<option value="<%=c.getCategory()%>" selected=""><%=c.getCategory()%>


											<%
											}
											%>
										</option>
									</select>
								</div>
								<div class="form-group">
									<label
										style="color: rgb(31, 40, 81); font-size: 16px; font-weight: bold;">No
										of Copies</label><input name="no-of-copies" class="form-control"
										type="number" style="border-color: rgb(31, 40, 81);">
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
					</form>
				</div>
			</div>
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