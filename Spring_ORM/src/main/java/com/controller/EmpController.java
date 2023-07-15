package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Employee;
import com.dao.EmployeeDao;


@WebServlet("/EmpController")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		ApplicationContext a= new ClassPathXmlApplicationContext("Beans.xml");
		EmployeeDao employeeDao = (EmployeeDao)a.getBean("employeeDao");
		
		if(action.equalsIgnoreCase("insert"))
		{
			Employee e = new Employee();
			e.setFname(request.getParameter("fname"));
			e.setLname(request.getParameter("lname"));
			e.setEmail(request.getParameter("email"));
			employeeDao.insertEmployee(e);
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("edit"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			Employee e = employeeDao.getEmployeeById(id);
			request.setAttribute("e", e);
			request.getRequestDispatcher("update.jsp").forward(request, response);			
		}
		if(action.equalsIgnoreCase("update"))
		{
			Employee e = new Employee();
			e.setId(Integer.parseInt(request.getParameter("id")));
			e.setFname(request.getParameter("fname"));
			e.setLname(request.getParameter("lname"));
			e.setEmail(request.getParameter("email"));
			employeeDao.insertEmployee(e);
			response.sendRedirect("show.jsp");
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int id = Integer.parseInt(request.getParameter("id"));
			employeeDao.deleteEmployee(id);
			response.sendRedirect("show.jsp");
		}
		
		
	}

}
