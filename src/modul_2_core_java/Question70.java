package modul_2_core_java;

import java.util.ArrayList;

public class Question70 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		
		System.out.println("Original arraylist: " +a);
		
		a.ensureCapacity(5);
		a.add("Tushar");
		a.add("Kartik");
		
		System.out.println("New arraylist: " +a);
		
		
		
	}

}
