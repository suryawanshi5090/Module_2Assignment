package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Employee;
import com.dao.EmplDao;


@WebServlet("/EmplController")
public class EmplController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			Employee e = new Employee();
			e.setFname(request.getParameter("fname"));
			e.setLname(request.getParameter("lname"));
			e.setEmail(request.getParameter("email"));
			e.setMobile(Long.parseLong(request.getParameter("mobile")));
			e.setGender(request.getParameter("gender"));
			e.setAddress(request.getParameter("address"));
			EmplDao.insertEmployee(e);
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("edit"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			Employee e  =EmplDao.getEmpById(id);
			request.setAttribute("e", e);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("update"))
		{
			Employee e = new Employee();
			e.setId(Integer.parseInt(request.getParameter("id")));
			e.setFname(request.getParameter("fname"));
			e.setLname(request.getParameter("lname"));
			e.setEmail(request.getParameter("email"));
			e.setMobile(Long.parseLong(request.getParameter("mobile")));
			e.setGender(request.getParameter("gender"));
			e.setAddress(request.getParameter("address"));
			EmplDao.insertEmployee(e);
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			EmplDao.deleteById(id);
			response.sendRedirect("show.jsp");
		}
	}

}
