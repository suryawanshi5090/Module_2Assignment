package modul_2_core_java;

import java.util.ArrayList;
import java.util.Collections;

public class Question65 {
	public static void main(String[] args) {
		ArrayList<String> a1 = new ArrayList<String>();
		a1.add("Pramod");
		a1.add("Aniket");
		a1.add("Mayur");
		a1.add("Tushar");
		a1.add("Kartik");
		
		System.out.println("Arraylist before swap: ");
		for(String a: a1) {
			System.out.println(a);
		}
		
		Collections.swap(a1, 0, 2);
		System.out.println("Arraylist after swap:");
		for(String b : a1) {
			System.out.println(b);
		}

	}

}
