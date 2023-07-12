package com.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Emp;
import com.bean.EmpInfo;
import com.util.EmpUtil;

public class EmpDao {

	public static void insertEmpInfo(EmpInfo e1)
	{
		Session session = EmpUtil.createSession();
		Transaction tr = session.beginTransaction();
		session.save(e1);
		tr.commit();
		session.close();
	}
	
	public static void insertEmp(Emp e2)
	{
		Session session = EmpUtil.createSession();
		Transaction tr = session.beginTransaction();
		session.save(e2);
		tr.commit();
		session.close();
	}
	
}
