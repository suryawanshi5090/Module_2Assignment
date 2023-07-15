package com.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Employee;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        ApplicationContext a  = new ClassPathXmlApplicationContext("Beans.xml");
        Employee e =  (Employee) a.getBean("e2");
        
        System.out.println("Id : "+e.getEid());
        System.out.println("Fname : "+e.getFname());
        System.out.println("Lname : "+e.getLname());
        System.out.println("Email : "+e.getEmail());
    }
}
