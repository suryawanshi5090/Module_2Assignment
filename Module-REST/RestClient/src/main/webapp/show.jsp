<%@page import="com.bean.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%" cellpadding="10px" cellspacing="10px">
	<tr>
		<th>ID</th>
		<th>FIRST NAME</th>
		<th>LAST NAME</th>
		<th>EMAIL</th>
		<th>EDIT</th>
		<th>DELETE</th>
	</tr>
	<%
		List<Student> list=(List<Student>)request.getAttribute("list");
		for(Student s:list)
		{
	%>
	<tr>
		<td><%=s.getId() %></td>
		<td><%=s.getFname() %></td>
		<td><%=s.getLname() %></td>
		<td><%=s.getEmail() %></td>
		<td>
			<form name="edit" method="post" action="StudentController">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="EDIT">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="StudentController">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="DELETE">
			</form>
		</td>
	</tr>
	<%		
		}
	%>
</table>
</body>
</html>