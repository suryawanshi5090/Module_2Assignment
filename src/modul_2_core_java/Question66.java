package modul_2_core_java;

import java.util.ArrayList;

public class Question66 {
	public static void main(String[] args) {
		ArrayList<String> a1 = new ArrayList<String>();
		a1.add("Pramod");
		a1.add("Aniket");
		a1.add("Mayur");
		a1.add("Tushar");
		a1.add("Kartik");
		
		System.out.println("First arraylist: " +a1);
		
		ArrayList<String> a2 = new ArrayList<String>();
		a2.add("Pramod");
		a2.add("Aniket");
		a2.add("Anand");
		a2.add("Yash");
		a2.add("Kartik");
		
		System.out.println("Second arraylist: " +a2);
		
		ArrayList<String> a3 = new ArrayList<String>();
		a3.addAll(a1);
		a3.addAll(a2);
		System.out.println("New array: " +a3);
		
	}

}
