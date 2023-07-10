package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student;
import com.util.StudentUtil;

public class StudentDao {
	
	public static int insertStudent(Student s)
	{
		int result=0;
		try {
			Connection conn=StudentUtil.CreateConnection();
			String sql="insert into emp(fname,lname,email) values(?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setString(3, s.getEmail());
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static List<Student> getAllStudent()
	{
		List<Student> list=new  ArrayList<Student>();
		try {
			Connection conn=StudentUtil.CreateConnection();
			String sql="select * from emp";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Student s=new Student();
				s.setId(rs.getInt("id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setEmail(rs.getString("email"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Student getStudent(int id)
	{
		Student s=null;
		try {
			Connection conn=StudentUtil.CreateConnection();
			String sql="select * from emp where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setFname(rs.getString("fname"));
				s.setLname(rs.getString("lname"));
				s.setEmail(rs.getString("email"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public static int updateStudent(Student s)
	{
		int result=0;
		try {
			Connection conn=StudentUtil.CreateConnection();
			String sql="update emp set fname=?,lname=?,email=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setString(3, s.getEmail());
			pst.setInt(4, s.getId());
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static int deleteStudent(int id)
	{
		int result=0;
		try {
			Connection conn=StudentUtil.CreateConnection();
			String sql="delete from emp where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,id);
			result=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
