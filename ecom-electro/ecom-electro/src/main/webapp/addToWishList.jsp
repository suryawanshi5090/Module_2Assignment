<%@page import="java.util.List"%>
<%@page import="com.Dao.WishListDao"%>
<%@page import="com.bean.WishListBean"%>
<%

int pid=Integer.parseInt(request.getParameter("pid"));
int uid=Integer.parseInt(request.getParameter("uid"));
WishListBean w=new WishListBean();
w.setUid(uid);
w.setPid(pid);
WishListDao.addProduct(w);
List<WishListBean> list=    WishListDao.userWishList(uid);
session.setAttribute("w_size",list.size());
request.getRequestDispatcher("wishList.jsp").forward(request, response);
%>
