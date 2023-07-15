package com.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Employee;
import com.util.EmplUtil;

public class EmplDao {
	
	public static void insertEmployee(Employee e)
	{
		Session session = EmplUtil.createSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(e);
		tr.commit();
		session.close();
	}
	
	public static List<Employee> getAllEmployees()
	{
		Session session=EmplUtil.createSession();
		List<Employee> list = session.createQuery("from Employee").list();
		session.close();
		return list;
	}
	
	public static Employee getEmpById(int id)
	{
		Session session = EmplUtil.createSession();
		Employee e =  session.get(Employee.class, id);
		session.close();
		return e;
	}
	
	public static void deleteById(int id)
	{
		Session session = EmplUtil.createSession();
		Transaction tr = session.beginTransaction();
		Employee e = session.get(Employee.class, id);
		session.delete(e);
		tr.commit();
		session.close();
	}

}
















