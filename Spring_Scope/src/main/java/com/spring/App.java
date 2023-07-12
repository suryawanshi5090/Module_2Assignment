package com.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Student;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        ApplicationContext a = new ClassPathXmlApplicationContext("Beans.xml");
        Student s1= (Student)a.getBean("s1");
        
        s1.setId(1);
        s1.setFname("Rakesh");
        s1.setLname("Kharva");
        s1.setEmail("rakesh@gmail.com");
        
        
        System.out.println("Id : "+s1.getId());
        System.out.println("Fname : "+s1.getFname());
        System.out.println("Lname : "+s1.getLname());
        System.out.println("Email : "+s1.getEmail());
    	
        Student s2= (Student)a.getBean("s1");       
       
        
        System.out.println("Id : "+s2.getId());
        System.out.println("Fname : "+s2.getFname());
        System.out.println("Lname : "+s2.getLname());
        System.out.println("Email : "+s2.getEmail());
    }
}
