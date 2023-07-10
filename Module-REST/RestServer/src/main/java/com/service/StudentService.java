package com.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.bean.Student;
import com.dao.StudentDao;
import com.google.gson.Gson;

@Path("student")
public class StudentService {
	
Gson gson=new Gson();
	
	@Path("insert")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public String insertStudent(String student)
	{
		Student s=gson.fromJson(student, Student.class);
		int result=StudentDao.insertStudent(s);
		if(result>0)
		{
			return "Data Inserted Successfully";
		}
		else
		{
			return "Data Insertion Failed";
		}
	}
	
	@Path("fetchall")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public String getAllStudent()
	{
		List<Student> list=StudentDao.getAllStudent();
		return gson.toJson(list);
	}
	
	@Path("getid")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public String getStudent(String sid)
	{
		System.out.println("getid called");
		int id=gson.fromJson(sid, Integer.class);
		Student s=StudentDao.getStudent(id);
		System.out.println(s.getId());
		return gson.toJson(s);
	}
	
	@Path("update")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public String updateStudent(String student)
	{
		Student s=gson.fromJson(student, Student.class);
		int result=StudentDao.updateStudent(s);
		if(result>0)
		{
			return "Data Updated Successfully";
		}
		else
		{
			return "Data Updation Failed";
		}
	}
	
	@Path("delete")
	@Produces(MediaType.TEXT_PLAIN)
	@POST
	public String deleteStudent(String sid)
	{
		int id=gson.fromJson(sid, Integer.class);
		int result=StudentDao.deleteStudent(id);
		if(result>0)
		{
			return "Data Deleted Successfully";
		}
		else
		{
			return "Data Deletion Failed";
		}
	}

}
