package com.spring.DiByConstructor;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Employee;
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
        //Employee e =   (Employee) a.getBean("e1");
        Student s = (Student)a.getBean("s1");
        
        System.out.println(s.getId());
        System.out.println(s.getFname());
        System.out.println(s.getLname());
        
        
        //System.out.println(e);
    }
}
