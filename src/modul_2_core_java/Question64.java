package modul_2_core_java;

import java.util.ArrayList;

public class Question64 {
	public static void main(String[] args) {
		ArrayList<String> a1 = new ArrayList<String>();
		a1.add("Pramod");
		a1.add("Aniket");
		a1.add("Mayur");
		a1.add("Tushar");
		a1.add("Kartik");
		
		ArrayList<String> a2 = new ArrayList<String>();
		a2.add("Pramod");
		a2.add("Aniket");
		a2.add("Anand");
		a2.add("Yash");
		a2.add("Kartik");
		
		ArrayList<String> a3 = new ArrayList<String>();
		for(String e:a1)
			a3.add(a2.contains(e) ? "Yes" : "No");
		System.out.println(a3);
		
		
	}

}
