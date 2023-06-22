package modul_2_core_java;

import java.util.ArrayList;
import java.util.Collections;

public class Question55 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add(1);
		a.add(2);
		a.add(3);
		a.add(4);
		a.add(5);
		
		System.out.println("List1 " +a);
		
		ArrayList b = new ArrayList();
		b.add("Pramod");
		b.add("Aniket");
		b.add("Mayur");
		b.add("Tushar");
		b.add("Kartik");
		
		System.out.println("List2 " +b);
		
		Collections.copy(b, a);
		System.out.println("Copy list 1 to list 2");
		
		System.out.println("List 1 " +a);
		System.out.println("List 2  " +b);
		
	}

}
