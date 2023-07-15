package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.bean.Student;

public class StudentDao{
	
	private HibernateTemplate hibernateTemplate;
	

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}


	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	@Transactional
	public void insertStudent(Student s)
	{
		this.hibernateTemplate.saveOrUpdate(s);
	}
	@Transactional
	public List<Student> getAllStudent()
	{
		return this.hibernateTemplate.loadAll(Student.class);
	}
	@Transactional
	public Student getStudent(int id)
	{
		return this.hibernateTemplate.get(Student.class, id);
	}
	@Transactional
	public void deleteStudent(int id)
	{
		Student s=this.hibernateTemplate.get(Student.class, id);
		this.hibernateTemplate.delete(s);
	}
}
