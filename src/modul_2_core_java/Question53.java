package modul_2_core_java;

import java.util.ArrayList;

public class Question53 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		a.add("Tushar");
		a.add("Kartik");
		
		System.out.println(a);
		if(a.contains("Tushar")){
			System.out.println("Element found.");
		}
		else {
			System.out.println("Element not found.");
		}
	}

}
