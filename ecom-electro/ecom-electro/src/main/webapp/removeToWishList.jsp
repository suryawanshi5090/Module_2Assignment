<%@page import="com.bean.WishListBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.WishListDao"%>
<%
int pid=Integer.parseInt(request.getParameter("pid"));
int uid=Integer.parseInt(request.getParameter("uid"));
WishListDao.removeProductToWishList(pid, uid);
List<WishListBean> list=WishListDao.userWishList(uid);
session.setAttribute("w_size", list.size());
request.getRequestDispatcher("wishList.jsp").forward(request, response);
%>