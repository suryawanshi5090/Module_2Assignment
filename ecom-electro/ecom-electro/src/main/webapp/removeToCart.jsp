<%@page import="com.bean.MyCartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.cartDao"%>
<%
int cid=Integer.parseInt(request.getParameter("cid"));
int uid=Integer.parseInt(request.getParameter("uid"));
cartDao.removeProductByid(cid);
List<MyCartBean> list=cartDao.userCart(uid);
session.setAttribute("c_size", list.size());
response.sendRedirect("viewcart.jsp");
%>