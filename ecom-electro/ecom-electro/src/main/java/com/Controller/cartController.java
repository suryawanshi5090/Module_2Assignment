package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.cartDao;
import com.bean.MyCartBean;

/**
 * Servlet implementation class cartController
 */
@WebServlet("/cartController")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		int qnt = Integer.parseInt(request.getParameter("qnt"));
		// System.out.println(cid + " " + qnt);
		MyCartBean c = cartDao.getCproductByid(cid);
		c.setQnt(qnt);
		int totalprice = (qnt * c.getPrice());
		c.setTprice(totalprice);
		cartDao.updateCartById(c);
		response.sendRedirect("viewcart.jsp");
	}

}
