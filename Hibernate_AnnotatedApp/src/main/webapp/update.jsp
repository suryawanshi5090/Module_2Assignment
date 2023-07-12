<%@page import="com.bean.Student"%>
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

<%
	Student s = (Student)request.getAttribute("s");
%>

<h3 align="center">Student Registration</h3>
<hr>
<form action="StudentController" method="post">
<input type="hidden" name="id" value="<%=s.getId()%>">
<table align="center">
	<tr>
		<td>First Name : </td>
		<td><input type="text" name="fname" value="<%=s.getFname()%>"></td>
	</tr>
	<tr>
		<td>Last Name : </td>
		<td><input type="text" name="lname" value="<%=s.getLname()%>"></td>
	</tr>
	<tr>
		<td>Email : </td>
		<td><input type="text" name="email" value="<%=s.getEmail()%>"></td>
	</tr>	
	<tr>
		<td>Gender : </td>
		<%
			if(s.getGender().equals("male"))
			{
		%>
		<td>
			<input type="radio" name="gender" value="male" checked="checked">Male
			<input type="radio" name="gender" value="female">Female
		</td>
		<%
			}
			else if(s.getGender().equals("female"))
			{
		%>
		<td>
			<input type="radio" name="gender" value="male">Male
			<input type="radio" name="gender" value="female" checked="checked">Female
		</td>
		<%
			}
			else
			{
		%>
		<td>
			<input type="radio" name="gender" value="male">Male
			<input type="radio" name="gender" value="female">Female
		</td>
		<%
			}
			
		%>
		
		
	</tr>
	<tr>
		<td>Address : </td>
		<td>
			<textarea rows="5" cols="20" name="address"><%=s.getAddress()%></textarea>
		</td>
	</tr>
	<tr>
		<td> </td>
		<td><input type="submit" name="action" value="Update" class="btn btn-danger"></td>
	</tr>
</table>
</form>

<a href="show.jsp">Show All Students</a>

</body>
</html>