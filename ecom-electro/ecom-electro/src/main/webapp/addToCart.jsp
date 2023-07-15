<%@page import="java.util.List"%>
<%@page import="com.Dao.cartDao"%>
<%@page import="com.bean.MyCartBean"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%
int pid=Integer.parseInt(request.getParameter("pid"));
int uid=Integer.parseInt(request.getParameter("uid"));
ProductBean p=ProductDao.getProductById(pid);
MyCartBean c=new MyCartBean();
c.setPid(pid);
c.setUid(uid);
c.setQnt(1);
c.setPrice(p.getPrice());
c.setTprice(p.getPrice());
cartDao.addToCartProduct(c);
List<MyCartBean> list=cartDao.userCart(uid);
session.setAttribute("c_size", list.size());
request.getRequestDispatcher("viewcart.jsp").forward(request, response);
%>