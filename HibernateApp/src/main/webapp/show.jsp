<%@page import="com.dao.EmplDao"%>
<%@page import="com.bean.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<table class="table table-hover">
<tr>
	<th>ID</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email</th>
	<th>Mobile</th>
	<th>Gender</th>
	<th>Address</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>

<%
	List<Employee> list = EmplDao.getAllEmployees();
	for (Employee e : list)
	{
%>
	<tr>
		<td><%=e.getId() %></td>
		<td><%=e.getFname() %></td>
		<td><%=e.getLname() %></td>
		<td><%=e.getEmail()%></td>
		<td><%=e.getMobile()%></td>
		<td><%=e.getGender()%></td>
		<td><%=e.getAddress()%></td>
		<td>
			<form name="edit" method="post" action="EmplController">
			<input type="hidden" name="id" value="<%=e.getId() %>">
			<input type="submit" name="action" value="Edit" class="btn btn-primary">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="EmplController">
			<input type="hidden" name="id" value="<%=e.getId() %>">
			<input type="submit" name="action" value="Delete" class="btn btn-danger">
			</form>
		</td>

	</tr>
<%		
	}
%>



</table>


</body>
</html>