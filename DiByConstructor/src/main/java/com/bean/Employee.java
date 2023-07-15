package com.bean;

public class Employee {
	
	int id;
	String fname,lname,email;
	
	public Employee(int id, String fname, String lname, String email) {		
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
	}
	
	@Override
	public String toString() {
		
		return "\nID : "+id+"\nFname : "+fname+"\nLname : "+lname+"\nEmail : "+email;
	}
	
	
	

}
