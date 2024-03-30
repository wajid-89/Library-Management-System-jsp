<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.*" %>
    <% 
    Book book=(Book)request.getAttribute("book1");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%


%>
</head>
<body>
<table>
<thead>
<tr>
<th>Id<th>
<th>title<th>
</tr>
</thead>
<tbody>
<tr>
<td><%=book.getTitle() %></td>
<td></td>
</tr>
</tbody>
</table>
</body>
</html>