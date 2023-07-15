package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ContactUsDao;
import com.bean.ContactUsBean;

/**
 * Servlet implementation class ContactUsController
 */
@WebServlet("/ContactUsController")
public class ContactUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("ContactUs")) {
			ContactUsBean c = new ContactUsBean();
			c.setEmail(request.getParameter("email"));
			c.setMessage(request.getParameter("message"));
			ContactUsDao.insertContact(c);
			request.setAttribute("msg", "Thank you for contacting us....");
			request.getRequestDispatcher("contactUs.jsp").forward(request, response);
		}
	}

}
