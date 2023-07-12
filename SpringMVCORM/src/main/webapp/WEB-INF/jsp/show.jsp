<%@page import="com.bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
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
	ApplicationContext a = new ClassPathXmlApplicationContext("Beans.xml");
	StudentDao  studentDao = (StudentDao)a.getBean("studentDao");
%>
<table class="table table-hover">
<tr>
	<th>ID</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<%
	List<Student> list = studentDao.getAllStudent();
	for(Student s : list)
	{
%>
	<tr>
		<td><%=s.getId() %></td>
		<td><%=s.getFname()%></td>
		<td><%=s.getLname()%></td>
		<td><%=s.getEmail() %></td>
		<td>
		<form name="edit" action="edit" method="post">
		<input type="hidden" name="id" value="<%=s.getId()%>">
		<input type="submit" name="action" value="Edit" class="btn btn-primary">		
		</form>
		
		</td>
		<td>
			<form name="delete" action="delete" method="post">
		<input type="hidden" name="id" value="<%=s.getId()%>">
		<input type="submit" name="action" value="Delete" class="btn btn-primary">		
		</form>
		</td>
	</tr>
<%
	}
%>


</table>

<a href="insert.jsp">Add New Student</a>

</body>
</html>