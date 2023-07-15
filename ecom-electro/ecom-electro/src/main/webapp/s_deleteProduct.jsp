
<%@page import="com.Dao.ProductDao"%>
<%
int pid=Integer.parseInt( request.getParameter("pid"));
ProductDao.deleteProductById(pid);
response.sendRedirect("s_index.jsp");
%>